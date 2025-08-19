#!/usr/bin/env python3
import subprocess

def run(cmd):
    """Run a shell command and print output."""
    print(f"\n$ {cmd}")
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout.strip())
    if result.stderr:
        print(result.stderr.strip())

def main():
    print("🚀 Starting Emacs cleanup and setup for emacs-plus@30...")

    # 1️⃣ Uninstall all stock Emacs versions
    run("brew uninstall --ignore-dependencies emacs")
    run("brew uninstall --force emacs")

    # 2️⃣ Remove any leftover Emacs cask metadata
    run("rm -rf $(brew --prefix)/Caskroom/emacs")
    run("rm -rf $(brew --repo)/Caskroom")

    # 3️⃣ Remove any old or unlinked Emacs kegs
    run("brew uninstall --force emacs-mac@29")

    # 4️⃣ Cleanup Homebrew caches and prune symlinks
    run("brew cleanup -s")
    run("rm -rf ~/Library/Caches/Homebrew/*")

    # 5️⃣ Reset Homebrew taps to clear stale metadata
    run("brew update-reset")

    # 6️⃣ Relink emacs-plus@30 and overwrite any remaining symlinks
    run("brew unlink emacs-plus@30")
    run("brew link --overwrite emacs-plus@30")

    # 7️⃣ Pin emacs-plus@30 to prevent upgrades from stock emacs
    run("brew pin emacs-plus@30")

    # 8️⃣ Optional: sanity checks
    run("which emacs")
    run("ls -l $(which emacs)")
    run("emacs -

