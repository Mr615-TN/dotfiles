#!/bin/sh

import subprocess
import shutil
import platform
import os
import sys
import time # For sleep calls

# Global variable to store Homebrew environment variables
homebrew_env = {}

def run_command(command, check=True, shell=False, sudo=False, capture_output=True, env=None, stdin_input=None):
    """
    Runs a shell command and returns True on success, False on failure.
    If check is True, raises an exception on non-zero exit code.
    If capture_output is False, prints output directly to console.
    'env' parameter allows passing custom environment variables.
    'stdin_input' allows passing input to the command's stdin.
    """
    full_command = f"sudo {command}" if sudo else command
    
    print(f"Executing: {full_command}")
    
    try:
        current_env = os.environ.copy()
        if env:
            current_env.update(env)

        stdin_pipe = subprocess.PIPE if stdin_input else None
        
        if capture_output:
            process = subprocess.run(
                full_command, 
                shell=shell, 
                check=check, 
                capture_output=True, 
                text=True, 
                env=current_env, 
                input=stdin_input
            )
            if process.stdout:
                print(f"STDOUT:\n{process.stdout}")
            if process.stderr:
                print(f"STDERR:\n{process.stderr}")
        else:
            process = subprocess.run(
                full_command, 
                shell=shell, 
                check=check, 
                env=current_env,
                input=stdin_input
            )
            
        return True
    except subprocess.CalledProcessError as e:
        print(f"Command '{e.cmd}' failed with exit code {e.returncode}.")
        if e.stdout:
            print(f"STDOUT:\n{e.stdout}")
        if e.stderr:
            print(f"STDERR:\n{e.stderr}")
        return False
    except FileNotFoundError:
        print(f"Command not found: '{full_command.split()[0]}'. Make sure it's in your PATH.")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

def is_installed(app_name, env=None):
    """
    Checks if an application's executable is found in the system's PATH.
    Allows passing custom environment for PATH lookup (e.g., Homebrew's PATH).
    """
    current_env = os.environ.copy()
    if env:
        current_env.update(env)
    return shutil.which(app_name, path=current_env.get('PATH')) is not None

def get_distribution_info():
    """
    Detects the Linux distribution ID (e.g., 'ubuntu', 'fedora', 'arch') and ID_LIKE.
    """
    try:
        with open('/etc/os-release', 'r') as f:
            config = dict(line.strip().split('=', 1) for line in f if '=' in line)
            return config.get('ID', '').lower(), config.get('ID_LIKE', '').lower()
    except FileNotFoundError:
        print("Warning: /etc/os-release not found. Cannot accurately determine distribution.")
        return "unknown", ""

def update_package_lists(distro_id):
    """
    Updates the package lists for the detected distribution.
    """
    print(f"Updating package lists for {distro_id}...")
    if distro_id in ["ubuntu", "debian", "linuxmint"]:
        return run_command("apt update", sudo=True, capture_output=False)
    elif distro_id in ["fedora", "centos", "rhel", "almalinux", "rocky"]:
        return run_command("dnf check-update", sudo=True, capture_output=False)
    elif distro_id == "arch":
        return run_command("pacman -Sy --noconfirm", sudo=True, capture_output=False)
    elif distro_id == "opensuse":
        return run_command("zypper refresh", sudo=True, capture_output=False)
    else:
        print(f"No specific package list update method for {distro_id}.")
        return True

def install_native_package(distro_id, package_name, common_name):
    """
    Attempts to install a package using the distribution's native package manager.
    """
    print(f"Attempting to install {common_name} ({package_name}) via native package manager...")
    if distro_id in ["ubuntu", "debian", "linuxmint"]:
        result = subprocess.run(f"apt-cache policy {package_name}".split(), capture_output=True, text=True)
        if "Candidate:" not in result.stdout and "Installed:" not in result.stdout:
            print(f"Package '{package_name}' not found in apt repositories.")
            return False
        return run_command(f"apt install -y {package_name}", sudo=True)
    elif distro_id in ["fedora", "centos", "rhel", "almalinux", "rocky"]:
        return run_command(f"dnf install -y {package_name}", sudo=True)
    elif distro_id == "arch":
        return run_command(f"pacman -S --noconfirm {package_name}", sudo=True)
    elif distro_id == "opensuse":
        return run_command(f"zypper install -y {package_name}", sudo=True)
    else:
        print(f"No native package manager support for {distro_id} for {common_name}.")
        return False

def ensure_flatpak_installed(distro_id, id_like):
    """
    Ensures Flatpak is installed and Flathub remote is added.
    """
    if is_installed("flatpak"):
        # Check if Flathub remote is added
        print("Flatpak is installed. Checking for Flathub remote...")
        if run_command("flatpak remote-info flathub", capture_output=True):
            print("Flathub remote is already added.")
            return True
        else:
            print("Flathub remote not found. Adding Flathub remote...")
            if run_command("flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo", sudo=False):
                print("Flathub remote added successfully.")
                return True
            else:
                print("Failed to add Flathub remote.")
                return False
    
    print("Flatpak not found. Attempting to install Flatpak...")
    if distro_id in ["ubuntu", "debian", "linuxmint"] or "debian" in id_like:
        if not run_command("apt install -y flatpak", sudo=True): return False
    elif distro_id in ["fedora", "centos", "rhel", "almalinux", "rocky"] or "rhel" in id_like:
        if not run_command("dnf install -y flatpak", sudo=True): return False
    elif distro_id == "arch":
        if not run_command("pacman -S --noconfirm flatpak", sudo=True): return False
    elif distro_id == "opensuse":
        if not run_command("zypper install -y flatpak", sudo=True): return False
    else:
        print(f"Unsupported distribution: {distro_id}. Cannot automatically install Flatpak.")
        return False
    
    print("Flatpak installed. Adding Flathub remote...")
    # Add Flathub remote after installing Flatpak
    if run_command("flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo", sudo=False):
        print("Flathub remote added successfully.")
        return True
    else:
        print("Failed to add Flathub remote.")
        return False

def install_flatpak_package(flatpak_id, common_name, distro_id, id_like):
    """
    Installs a Flatpak package from Flathub.
    """
    print(f"Attempting to install {common_name} ({flatpak_id}) via Flatpak...")
    if not ensure_flatpak_installed(distro_id, id_like):
        print(f"Skipping Flatpak installation for {common_name} as Flatpak could not be set up.")
        return False

    # Flatpak install often asks for confirmation 'y/n', simulate 'y'
    return run_command(f"flatpak install flathub {flatpak_id} -y", sudo=False)

def ensure_homebrew_installed(distro_id, id_like):
    """
    Ensures Homebrew (Linuxbrew) is installed on Debian/Ubuntu or Fedora/RHEL family.
    Sets global homebrew_env if successful.
    """
    global homebrew_env

    if not (distro_id in ["ubuntu", "debian", "linuxmint"] or "debian" in id_like or
            distro_id in ["fedora", "centos", "rhel", "almalinux", "rocky"] or "rhel" in id_like):
        print("Homebrew installation skipped: Not on Debian/Ubuntu or Fedora/RHEL family.")
        return False

    homebrew_prefix = "/home/linuxbrew/.linuxbrew" # Default for fresh install
    user_homebrew_path = os.path.join(os.path.expanduser("~"), ".linuxbrew")
    if os.path.exists(user_homebrew_path):
        homebrew_prefix = user_homebrew_path # If installed in user home

    # If brew is already installed, ensure its environment is sourced for current script
    if is_installed("brew", env=homebrew_env): 
        print("Homebrew is already installed. Loading environment...")
        try:
            brew_shellenv_output = subprocess.check_output(f"{homebrew_prefix}/bin/brew shellenv", shell=True, text=True).strip()
            for line in brew_shellenv_output.split('\n'):
                if line.startswith('export '):
                    key, value = line[len('export '):].split('=', 1)
                    value = value.strip("'") # Remove single quotes
                    homebrew_env[key] = value
            print("Homebrew environment loaded.")
            return True
        except Exception as e:
            print(f"Failed to load Homebrew environment: {e}")
            return False

    print("Homebrew (Linuxbrew) not found. Attempting to install...")

    # Install build dependencies for Homebrew
    print("Installing Homebrew build dependencies...")
    if distro_id in ["ubuntu", "debian", "linuxmint"] or "debian" in id_like:
        if not run_command("apt install -y build-essential procps curl file git", sudo=True):
            print("Failed to install Homebrew build dependencies for Debian/Ubuntu.")
            return False
    elif distro_id in ["fedora", "centos", "rhel", "almalinux", "rocky"] or "rhel" in id_like:
        if not run_command("dnf groupinstall -y 'Development Tools'", sudo=True):
            print("Failed to install Homebrew build dependencies for Fedora/RHEL.")
            return False
        if not run_command("dnf install -y procps-ng curl file git", sudo=True):
            print("Failed to install Homebrew build dependencies for Fedora/RHEL (additional).")
            return False
    else:
        print("Unsupported distro for automatic Homebrew dependency installation.")
        return False

    # Install Homebrew
    install_cmd = '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    print("Running Homebrew installer...")
    # The Homebrew installer can prompt for sudo password, so we use Popen to keep it interactive
    try:
        process = subprocess.Popen(install_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        stdout, stderr = process.communicate()
        if process.returncode != 0:
            print(f"Homebrew installation failed with exit code {process.returncode}.")
            print(f"STDOUT:\n{stdout}")
            print(f"STDERR:\n{stderr}")
            return False
        else:
            print("Homebrew installer output:")
            print(stdout)
            print(stderr)
            print("Homebrew installation script completed.")
            
            # Extract and source Homebrew environment variables
            print("Sourcing Homebrew environment...")
            brew_exec_path = os.path.join(homebrew_prefix, "bin", "brew")
            
            if os.path.exists(brew_exec_path):
                brew_shellenv_output = subprocess.check_output(f"{brew_exec_path} shellenv", shell=True, text=True).strip()
                for line in brew_shellenv_output.split('\n'):
                    if line.startswith('export '):
                        key, value = line[len('export '):].split('=', 1)
                        value = value.strip("'")
                        homebrew_env[key] = value
                print("Homebrew environment loaded successfully.")
                print("Consider adding Homebrew to your shell's PATH permanently (e.g., in ~/.bashrc or ~/.zshrc):")
                print('eval "$(' + brew_exec_path + ' shellenv)"')
                return True
            else:
                print(f"Could not find brew executable at {brew_exec_path} after installation.")
                return False

    except Exception as e:
        print(f"An error occurred during Homebrew installation: {e}")
        return False

def install_homebrew_package(package_name, common_name):
    """
    Installs a package using Homebrew. Requires homebrew_env to be populated.
    """
    global homebrew_env
    if not homebrew_env:
        print(f"Homebrew environment not set up. Cannot install {common_name} via Homebrew.")
        return False
    
    print(f"Attempting to install {common_name} ({package_name}) via Homebrew...")
    return run_command(f"brew install {package_name}", sudo=False, env=homebrew_env)

def install_oh_my_posh_linux():
    """
    Installs Oh My Posh by downloading the official binary to /usr/local/bin.
    """
    print("Attempting to install Oh My Posh...")
    if is_installed("oh-my-posh"):
        print("Oh My Posh is already installed.")
        return True

    download_url = "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64"
    install_path = "/usr/local/bin/oh-my-posh"

    print(f"Downloading Oh My Posh from {download_url} to {install_path}...")
    success_download = run_command(f"wget {download_url} -O {install_path}", shell=True, sudo=True)
    if not success_download:
        print("Failed to download Oh My Posh.")
        return False

    success_chmod = run_command(f"chmod +x {install_path}", sudo=True)
    if not success_chmod:
        print("Failed to make Oh My Posh executable.")
        return False

    print("Oh My Posh installed successfully.")
    return True

def install_kitty_linux():
    """
    Installs Kitty terminal using its official installer script.
    """
    print("Attempting to install Kitty terminal...")
    if is_installed("kitty"):
        print("Kitty is already installed.")
        return True

    installer_cmd = "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n"
    print("Running Kitty's official installer script...")
    if run_command(installer_cmd, shell=True, sudo=False): # sudo=False as it installs to user's home
        print("Kitty installed via official script. Symlinking for easier access.")
        
        home_bin = os.path.expanduser("~/.local/bin")
        if not os.path.exists(home_bin):
            os.makedirs(home_bin)
        
        kitty_app_path = os.path.expanduser("~/.local/kitty.app/bin")
        if os.path.exists(os.path.join(kitty_app_path, "kitty")):
            run_command(f"ln -sf {kitty_app_path}/kitty {home_bin}/kitty")
            run_command(f"ln -sf {kitty_app_path}/kitten {home_bin}/kitten")
            print(f"Symlinks created in {home_bin}. Ensure this directory is in your PATH.")
            return True
        else:
            print(f"Kitty executable not found in expected path: {kitty_app_path}")
            return False
    else:
        print("Failed to install Kitty via official script. Please consider manual installation.")
        return False

def main():
    global homebrew_env
    
    # Define applications and their installation preferences/names
    # 'native': Package name for apt/dnf/pacman/zypper
    # 'brew': Homebrew package name (fallback)
    # 'flatpak_id': Flatpak application ID (e.g., org.gnome.Lollypop)
    # 'exec': The actual executable name (if different from common name)
    
    apps_config = {
        "cava": {"exec": "cava", "native": "cava", "brew": "cava", "flatpak_id": "com.github.karlstav.cava"},
        "helix": {"exec": "hx", "native": "helix", "brew": "helix", "flatpak_id": "com.helix_editor.Helix"},
        "btop": {"exec": "btop", "native": "btop", "brew": "btop", "flatpak_id": "com.github.aristidb.btop"},
        "neovim": {"exec": "nvim", "native": "neovim", "brew": "neovim", "flatpak_id": "io.neovim.nvim"},
        "fastfetch": {"exec": "fastfetch", "native": "fastfetch", "brew": "fastfetch", "flatpak_id": "io.github.fastfetch.Fastfetch"},
        "zellij": {"exec": "zellij", "native": "zellij", "brew": "zellij", "flatpak_id": "org.zellij.Zellij"},
        "tmux": {"exec": "tmux", "native": "tmux", "brew": "tmux", "flatpak_id": None}, # tmux typically not via flatpak
        "zsh": {"exec": "zsh", "native": "zsh", "brew": "zsh", "flatpak_id": None}, # zsh not via flatpak
    }

    distro_id, id_like = get_distribution_info()

    if distro_id == "unknown":
        print("Could not determine Linux distribution. Cannot proceed with package-manager specific installations.")
        sys.exit(1)
    
    print(f"Detected Linux distribution: {distro_id} (ID_LIKE: {id_like})")

    # Update native package lists first
    if not update_package_lists(distro_id):
        print("Warning: Failed to update native package lists. Installations might fail or get old versions.")

    # Attempt to install/configure Homebrew if on supported distro family
    if (distro_id in ["ubuntu", "debian", "linuxmint"] or "debian" in id_like or
        distro_id in ["fedora", "centos", "rhel", "almalinux", "rocky"] or "rhel" in id_like):
        print("\n--- Homebrew Setup ---")
        ensure_homebrew_installed(distro_id, id_like)
    else:
        print("\n--- Homebrew skipped as this distribution family is not officially supported by Linuxbrew in this script ---")

    # Attempt to install/configure Flatpak
    print("\n--- Flatpak Setup ---")
    flatpak_ready = ensure_flatpak_installed(distro_id, id_like)
    if not flatpak_ready:
        print("Warning: Flatpak could not be set up. Flatpak installations will be skipped.")

    for app_name, config in apps_config.items():
        print(f"\n--- Checking for {app_name} ---")
        executable_name = config.get("exec", app_name)

        # Check if already installed via any method
        if is_installed(executable_name, env=homebrew_env):
            print(f"{app_name} is already installed.")
            continue
        
        print(f"{app_name} not found. Attempting to install...")
        installed = False

        # 1. Attempt installation via native package manager
        if "native" in config and config["native"]:
            if install_native_package(distro_id, config["native"], app_name):
                installed = True
            else:
                print(f"Failed to install {app_name} via native package manager (or package not found).")
        
        # 2. If not installed and on a supported Homebrew distro family, try Homebrew
        if not installed and homebrew_env and "brew" in config and config["brew"]:
            if install_homebrew_package(config["brew"], app_name):
                installed = True
            else:
                print(f"Failed to install {app_name} via Homebrew.")

        # 3. If still not installed and Flatpak is ready, try Flatpak
        if not installed and flatpak_ready and "flatpak_id" in config and config["flatpak_id"]:
            # Note: Flatpak apps run in a sandbox, so their executables might not be directly in PATH
            # However, `flatpak run <app_id>` can launch them, or desktop entries
            # For simplicity in this script, we'll try to install, but `is_installed`
            # might not detect it unless Flatpak's binaries are symlinked to PATH (often they are not by default)
            print(f"Trying Flatpak for {app_name}...")
            if install_flatpak_package(config["flatpak_id"], app_name, distro_id, id_like):
                installed = True
                print(f"Note: {app_name} installed via Flatpak. You might need to run it via 'flatpak run {config['flatpak_id']}' or its desktop shortcut.")
            else:
                print(f"Failed to install {app_name} via Flatpak.")

        if not installed:
            print(f"Failed to install {app_name} through automated methods.")
            print(f"You may need to install {app_name} manually for your distribution or check its package name.")

    # Handle special cases that don't fit the general package manager/brew/flatpak logic
    print("\n--- Special Installations ---")

    # Oh My Posh (direct download)
    if not is_installed("oh-my-posh"):
        install_oh_my_posh_linux()
    else:
        print("Oh My Posh is already installed.")

    # Kitty (official script)
    if not is_installed("kitty"):
        install_kitty_linux()
    else:
        print("Kitty is already installed.")
    
    # Oh My Zsh (requires Zsh to be present)
    print("\n--- Checking for Oh My Zsh ---")
    if is_installed("zsh"):
        home_dir = os.path.expanduser("~")
        oh_my_zsh_path = os.path.join(home_dir, ".oh-my-zsh")
        if not os.path.exists(oh_my_zsh_path):
            print("Oh My Zsh not found. Installing...")
            install_command = 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'
            if not run_command(install_command, shell=True, check=False):
                print("Failed to install Oh My Zsh. It might already be partially installed or requires manual intervention.")
                print("Check for ~/.oh-my-zsh directory and ~/.zshrc file.")
            else:
                print("Oh My Zsh installed successfully.")
                print("Remember to configure your ~/.zshrc for Oh My Zsh and any themes/plugins.")
        else:
            print("Oh My Zsh is already installed.")
    else:
        print("Zsh is not installed. Cannot install Oh My Zsh.")

    print("\n--- Package installation process complete ---")
    print("You should now proceed with linking your dotfiles and configuring your applications.")
    print("Remember to install a Nerd Font for powerline-enabled prompts (like Oh My Posh) to display correctly.")
    print("You may need to restart your terminal or log out/in for some changes to take full effect.")

if __name__ == "__main__":
    main()
