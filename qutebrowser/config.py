# pylint: disable=C0111
config = config  # noqa: F821 pylint: disable=E0602

# =========================
#   COLOR PALETTE
# =========================
bg_color = "#1A202C"    # Dark blue-grey
fg_color = "#E0E0E0"    # Soft off-white
color0 = "#1A202C"
color8 = "#4A5568"
color6 = "#00BFFF"
color10 = "#00FF7F"
color12 = "#4169E1"
color13 = "#DA70D6"
color14 = "#00CED1"

# =========================
#   STATUS BAR
# =========================
c.colors.statusbar.normal.bg = "#00000000"
c.colors.statusbar.normal.fg = color14
c.colors.statusbar.command.bg = "#00000000"
c.colors.statusbar.command.fg = fg_color
c.colors.statusbar.url.fg = color13
c.colors.statusbar.url.success.https.fg = color13
c.colors.statusbar.url.hover.fg = color12

# =========================
#   TABS
# =========================
c.colors.tabs.bar.bg = "#00000000"
c.colors.tabs.even.bg = "#00000000"
c.colors.tabs.odd.bg = "#00000000"
c.colors.tabs.even.fg = color0
c.colors.tabs.odd.fg = color0
c.colors.tabs.selected.even.bg = fg_color
c.colors.tabs.selected.odd.bg = fg_color
c.colors.tabs.selected.even.fg = bg_color
c.colors.tabs.selected.odd.fg = bg_color
c.tabs.show = "multiple"
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0
c.tabs.width = '7%'

# =========================
#   COMPLETION & HINTS
# =========================
c.colors.completion.item.selected.match.fg = color6
c.colors.completion.match.fg = color6
c.colors.completion.item.selected.bg = bg_color
c.colors.completion.item.selected.fg = fg_color
c.colors.completion.category.bg = bg_color
c.colors.completion.category.fg = fg_color
c.colors.completion.odd.bg = bg_color
c.colors.completion.even.bg = bg_color
c.colors.completion.fg = fg_color
c.colors.hints.bg = bg_color
c.colors.hints.fg = fg_color
c.hints.border = fg_color

# =========================
#   DOWNLOADS & MESSAGES
# =========================
c.colors.downloads.bar.bg = bg_color
c.colors.downloads.start.bg = color10
c.colors.downloads.start.fg = fg_color
c.colors.downloads.stop.bg = color8
c.colors.downloads.stop.fg = fg_color
c.colors.messages.info.bg = bg_color
c.colors.messages.info.fg = fg_color
c.colors.messages.error.bg = bg_color
c.colors.messages.error.fg = fg_color

# =========================
#   FONTS
# =========================
c.fonts.default_family = []
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'
c.fonts.web.size.default = 20

# =========================
#   SEARCH ENGINES
# =========================
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!aw': 'https://wiki.archlinux.org/?search={}',
    '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
    '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
    '!yt': 'https://www.youtube.com/results?search_query={}',
}
c.completion.open_categories = [
    'searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem'
]

# =========================
#   PRIVACY & SECURITY
# =========================
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "no-3rdparty", "*")
config.set("content.cookies.store", True)
config.set("content.notifications.enabled", False, "*")
config.set("content.autoplay", False)
config.set("content.javascript.can_open_tabs_automatically", False, "*")
config.set("content.headers.do_not_track", True)
config.set('content.cookies.accept', 'all', 'https://pass.proton.me/')

# =========================
#   ADBLOCKING (python-adblock)
# =========================
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    # Default lists
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",

    # Extra blocklists for streaming sites & popups
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]

# Removed the YouTube-specific blocklist since we use yt-ads.js for that

# =========================
#   DARK MODE
# =========================
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# =========================
#   KEYBINDINGS
# =========================
 # pylint: disable=C0111

config = config  # noqa: F821 pylint: disable=E0602


# =========================

#   COLOR PALETTE

# =========================

bg_color = "#1A202C"    # Dark blue-grey

fg_color = "#E0E0E0"    # Soft off-white

color0 = "#1A202C"

color8 = "#4A5568"

color6 = "#00BFFF"

color10 = "#00FF7F"

color12 = "#4169E1"

color13 = "#DA70D6"

color14 = "#00CED1"


# =========================

#   STATUS BAR

# =========================

c.colors.statusbar.normal.bg = "#00000000"

c.colors.statusbar.normal.fg = color14

c.colors.statusbar.command.bg = "#00000000"

c.colors.statusbar.command.fg = fg_color

c.colors.statusbar.url.fg = color13

c.colors.statusbar.url.success.https.fg = color13

c.colors.statusbar.url.hover.fg = color12


# =========================

#   TABS

# =========================

c.colors.tabs.bar.bg = "#00000000"

c.colors.tabs.even.bg = "#00000000"

c.colors.tabs.odd.bg = "#00000000"

c.colors.tabs.even.fg = color0

c.colors.tabs.odd.fg = color0

c.colors.tabs.selected.even.bg = fg_color

c.colors.tabs.selected.odd.bg = fg_color

c.colors.tabs.selected.even.fg = bg_color

c.colors.tabs.selected.odd.fg = bg_color

c.tabs.show = "multiple"

c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}

c.tabs.indicator.width = 0

c.tabs.width = '7%'


# =========================

#   COMPLETION & HINTS

# =========================

c.colors.completion.item.selected.match.fg = color6

c.colors.completion.match.fg = color6

c.colors.completion.item.selected.bg = bg_color

c.colors.completion.item.selected.fg = fg_color

c.colors.completion.category.bg = bg_color

c.colors.completion.category.fg = fg_color

c.colors.completion.odd.bg = bg_color

c.colors.completion.even.bg = bg_color

c.colors.completion.fg = fg_color

c.colors.hints.bg = bg_color

c.colors.hints.fg = fg_color

c.hints.border = fg_color


# =========================

#   DOWNLOADS & MESSAGES

# =========================

c.colors.downloads.bar.bg = bg_color

c.colors.downloads.start.bg = color10

c.colors.downloads.start.fg = fg_color

c.colors.downloads.stop.bg = color8

c.colors.downloads.stop.fg = fg_color

c.colors.messages.info.bg = bg_color

c.colors.messages.info.fg = fg_color

c.colors.messages.error.bg = bg_color

c.colors.messages.error.fg = fg_color


# =========================

#   FONTS

# =========================

c.fonts.default_family = []

c.fonts.default_size = '13pt'

c.fonts.web.family.fixed = 'monospace'

c.fonts.web.family.sans_serif = 'monospace'

c.fonts.web.family.serif = 'monospace'

c.fonts.web.family.standard = 'monospace'

c.fonts.web.size.default = 20


# =========================

#   SEARCH ENGINES

# =========================

c.url.searchengines = {

    'DEFAULT': 'https://duckduckgo.com/?q={}',

    '!aw': 'https://wiki.archlinux.org/?search={}',

    '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',

    '!gh': 'https://github.com/search?o=desc&q={}&s=stars',

    '!yt': 'https://www.youtube.com/results?search_query={}',

}

c.completion.open_categories = [

    'searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem'

]


# =========================

#   PRIVACY & SECURITY

# =========================

config.set("content.webgl", False, "*")

config.set("content.canvas_reading", False)

config.set("content.geolocation", False)

config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")

config.set("content.cookies.accept", "no-3rdparty", "*")

config.set("content.cookies.store", True)

config.set("content.notifications.enabled", False, "*")

config.set("content.autoplay", False)

config.set("content.javascript.can_open_tabs_automatically", False, "*")

config.set("content.headers.do_not_track", True)

config.set('content.cookies.accept', 'all', 'https://pass.proton.me/')


# =========================

#   ADBLOCKING (python-adblock)

# =========================

c.content.blocking.enabled = True

c.content.blocking.method = 'adblock'

c.content.blocking.adblock.lists = [

    # Default lists

    "https://easylist.to/easylist/easylist.txt",

    "https://easylist.to/easylist/easyprivacy.txt",

    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",

    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",


    # Extra blocklists for streaming sites & popups

    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",

    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",

    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",

    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"

]


# Removed the YouTube-specific blocklist since we use yt-ads.js for that


# =========================

#   DARK MODE

# =========================

c.colors.webpage.darkmode.enabled = True

c.colors.webpage.darkmode.algorithm = 'lightness-cielab'

c.colors.webpage.darkmode.policy.images = 'never'

config.set('colors.webpage.darkmode.enabled', False, 'file://*')


# =========================

#   KEYBINDINGS

# =========================

config.bind('=', 'cmd-set-text -s :open')

config.bind('h', 'history')

config.bind('cs', 'cmd-set-text -s :config-source')

config.bind('tH', 'config-cycle tabs.show multiple never')

config.bind('sH', 'config-cycle statusbar.show always never')

config.bind('T', 'hint links tab')

config.bind('pP', 'open -- {primary}')

config.bind('pp', 'open -- {clipboard}')

config.bind('pt', 'open -t -- {clipboard}')

config.bind('qm', 'macro-record')

config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')

config.bind('tT', 'config-cycle tabs.position top left')

config.bind('gJ', 'tab-move +')

config.bind('gK', 'tab-move -')

config.bind('gm', 'tab-move')


# =========================

#   MPV INTEGRATION

# =========================

config.bind('m', 'hint links spawn mpv {hint-url}')


# =========================

#   MISC SETTINGS

# =========================

config.load_autoconfig()

c.auto_save.session = True

-> I have a keybinding issue with my qutebrowser config file. I use the same config on both mac and linux where I use aerospace on mac and sway on linux. The issue is that for my mac, the alt stuff is keybinded to switch between the 10 workspaces and on my linux machine, its all the super stuff. If I want to use the cmd button on my mac to act as my super button, I cant switch tabs on firefox as I use firefox as my primary browser and qutebrowser as a light weight browser when I am on the go and have less access to chargers to keep ram usage low and thus not speeding up fans and using more power/batter/

It sounds like you're running into a common problem when trying to use the same keybindings across different operating systems, especially with macOS's Cmd key and its interaction with window managers/tiling setups like aerospace and Sway.

The main issue is that qutebrowser keybindings are defined per-key, and the logical key you want (like Super on Linux) maps to a different physical/logical key on macOS (like Cmd), which is often already intercepted by the OS or a window manager.

Here's a breakdown of the problem and the recommended solution:

The Problem: Cmd Key Conflict 💻

On macOS:

    The Cmd key is often used for system-level shortcuts (copy, paste, switch tabs in common apps like Firefox, etc.) and is the natural equivalent of the Super (or Windows) key on Linux for window managers.

    Your aerospace configuration uses the Cmd key for workspace switching (workspaces 1-10).

    If you bind a qutebrowser command to Cmd+key, it might conflict with the OS, aerospace, or even a primary browser like Firefox. For example, Cmd+Tab is typically for application switching on macOS, and Cmd+1 through Cmd+9 are often for tab switching in web browsers.

You want to use Cmd as the Super key in qutebrowser but need to avoid conflicts with Firefox's tab switching and aerospace's workspace switching.

Recommended Solution: Use Alt as the "Super" Key in qutebrowser 💡

The most reliable way to avoid conflicts with common macOS Cmd keybindings (including Firefox's) while still having an easily accessible "Meta" key for qutebrowser commands is to use the Alt (or Option) key for your qutebrowser bindings.

You can then define your qutebrowser configuration to use the Alt key for commands that you would use Super for on Linux. Since qutebrowser interprets Alt as M- (Meta), you can define a consistent set of bindings that are less likely to conflict with system/app shortcuts.

1. Update your qutebrowser keybindings

Change your qutebrowser keybindings from using a hypothetical Super key (which you want to be Cmd on Mac) to using the M- (Alt/Option) key prefix.

For example, if you wanted to bind the command to open a link in a new tab to Super+t, you'd use M-t in qutebrowser, which corresponds to Alt+t on both Linux and macOS. This avoids Firefox's Cmd+1 to 9 tab switching.
Python

# =========================
#   KEYBINDINGS (Updated Example)
# =========================
# Original: config.bind('T', 'hint links tab')
# New: M-t (Alt+t) is less likely to conflict with OS/App shortcuts than Cmd+t
config.bind('M-t', 'hint links tab')
# You can keep other simple keybindings like 'T' if you don't need Alt
config.bind('T', 'hint links tab')

# Original: config.bind('gJ', 'tab-move +')
# New: Use Alt/Meta prefix (M-) for tab navigation to keep consistent
# with a 'Super' style keybinding, while avoiding Cmd
config.bind('M-J', 'tab-move +')
config.bind('M-K', 'tab-move -')

# Original: config.bind('tT', 'config-cycle tabs.position top left')
# This is a good keybinding as 'tT' is unlikely to conflict
config.bind('tT', 'config-cycle tabs.position top left')

# Original: config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
# This is fine as it uses Ctrl, which is generally safe
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')

2. Configure your aerospace Keybindings (Optional, but good practice)

If your aerospace configuration on macOS currently uses Cmd+J and Cmd+K for window management, you should ensure those bindings don't conflict with your new qutebrowser M− bindings. Since Alt (Meta) is generally available to applications like qutebrowser on macOS, this shouldn't be an issue unless aerospace is set to intercept the Alt key.

The benefit of this approach is consistency across browsers:

    Firefox tab switching remains Cmd+1 to 9.

    qutebrowser 'Super' commands use Alt+key.

    aerospace workspace switching remains Cmd+1 to 0.

This minimizes interference between your two browsers and your window manager on macOS.

my aerospace command uses the option key which is like alt on linux

That detail changes things! Since your aerospace command uses the Option key on macOS (which is equivalent to Alt or M- in your Linux/Sway setup) for workspace switching, you should avoid using the M- (Alt) key for your primary qutebrowser keybindings.

The core issue is that the Option key is being intercepted by aerospace before qutebrowser can see it, leading to the same kind of conflict you were worried about with the Cmd key.

The best strategy is to use a key that is typically ignored by the OS or WM but still available to applications like qutebrowser for your primary browser commands: the Control (Ctrl) key.

Solution: Use Control (C-) for Qutebrowser Bindings

The Control (C-) key is an excellent choice for application-specific commands on both macOS and Linux because it is generally:

    Ignored by Window Managers (aerospace/Sway): They usually reserve Cmd/Super and Alt/Option for system-level control.

    Safe from macOS App Conflicts: While Cmd is reserved for common macOS actions (like Cmd+T for new tab), Ctrl is less commonly used by default browser shortcuts.

    Consistent across OSes: Ctrl is the same key on both Mac and Linux.

Recommended Keybinding Changes

You should replace the conflicting Alt (Option) keybindings and any Cmd/Super-style bindings with C- (Control).
Desired Action (Super-style)	Current macOS Conflict	Recommended Qutebrowser Bindings	Example Keypress
Tab Movement	Option (aerospace)	config.bind('C-j', 'tab-move +')	Ctrl+J
Tab Movement	Option (aerospace)	config.bind('C-k', 'tab-move -')	Ctrl+K
Hint Tab Open	Cmd+T (Firefox)	config.bind('C-t', 'hint links tab')	Ctrl+T
Open Link with MPV	-	config.bind('C-m', 'hint links spawn mpv {hint-url}')	Ctrl+M

Example Update to Your Config

Here is how you would adjust the conflicting keybindings in your existing file:
Python

# =========================
#   KEYBINDINGS (Updated for C- prefix)
# =========================
# ... other bindings remain unchanged ...

# Use C-j/C-k for tab movement (avoids Option/Alt conflict with aerospace/Sway)
config.bind('C-j', 'tab-move +')  # Change gJ
config.bind('C-k', 'tab-move -')  # Change gK

# Use C-t for hint links tab (avoids Cmd+T conflict with Firefox/Mac OS)
config.bind('C-t', 'hint links tab') # A less common conflict than 'T' or 'Cmd-t'

# Use C-m for mpv integration (avoids 'm' being too general)
config.bind('C-m', 'hint links spawn mpv {hint-url}') # Change m

# You can keep your existing Tab/Statusbar toggles, as they use two normal keys:
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
# ... and other unique bindings:
config.bind('T', 'hint links tab') # You can keep this one as a secondary

By switching to the Control key as your "Meta" key in qutebrowser, you effectively side-step the Cmd and Option key interception issues on macOS while maintaining consistency with your Linux keymap.

Here is my aerospace.toml config: # You can use it to add commands that run after login to macOS user session.

# 'start-at-login' needs to be 'true' for 'after-login-command' to work

# Available commands: https://nikitabobko.github.io/AeroSpace/commands

after-login-command = []


# You can use it to add commands that run after AeroSpace startup.

# 'after-startup-command' is run after 'after-login-command'

# Available commands : https://nikitabobko.github.io/AeroSpace/commands

after-startup-command = [

    # JankyBorders has a built-in detection of already running process,

    # so it won't be run twice on AeroSpace restart

    'exec-and-forget borders active_color=0xff1688f0 inactive_color=0xff494d64 width=6.0',

]


# Start AeroSpace at login

start-at-login = true


# Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization

enable-normalization-flatten-containers = true

enable-normalization-opposite-orientation-for-nested-containers = true


# See: https://nikitabobko.github.io/AeroSpace/guide#layouts

# The 'accordion-padding' specifies the size of accordion padding

# You can set 0 to disable the padding feature

accordion-padding = 10


# Possible values: tiles|accordion

default-root-container-layout = 'tiles'


# Possible values: horizontal|vertical|auto

# 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,

#               tall monitor (anything higher than wide) gets vertical orientation

default-root-container-orientation = 'auto'


# Mouse follows focus when focused monitor changes

# Drop it from your config, if you don't like this behavior

# See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks

# See https://nikitabobko.github.io/AeroSpace/commands#move-mouse

# Fallback value (if you omit the key): on-focused-monitor-changed = []

on-focused-monitor-changed = ['move-mouse monitor-lazy-center']

on-focus-changed = 'move-mouse window-lazy-center'


# You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag

# Useful if you don't use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key

# Also see: https://nikitabobko.github.io/AeroSpace/goodness#disable-hide-app

automatically-unhide-macos-hidden-apps = true


# Possible values: (qwerty|dvorak)

# See https://nikitabobko.github.io/AeroSpace/guide#key-mapping

[key-mapping]

preset = 'qwerty'


# Gaps between windows (inner-*) and between monitor edges (outer-*).

# Possible values:

# - Constant:     gaps.outer.top = 8

# - Per monitor:  gaps.outer.top = [{ monitor.main = 16 }, { monitor."some-pattern" = 32 }, 24]

#                 In this example, 24 is a default value when there is no match.

#                 Monitor pattern is the same as for 'workspace-to-monitor-force-assignment'.

#                 See: https://nikitabobko.github.io/AeroSpace/guide#assign-workspaces-to-monitors

[gaps]

inner.horizontal = 5 

inner.vertical = 5 

outer.left = 5 

outer.bottom = 5 

outer.top = 5 

outer.right = 5 


# See https://nikitabobko.github.io/AeroSpace/guide#exec-env-vars

[exec] # Again, you don't need to copy all config sections to your config.

inherit-env-vars = true # If you don't touch "exec" section,

[exec.env-vars] # it will fallback to "default-config.toml"

PATH = '/opt/homebrew/bin:/opt/homebrew/sbin:${PATH}'


# 'main' binding mode declaration

# See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes

# 'main' binding mode must be always presented

[mode.main.binding]


# All possible keys:

# - Letters.        a, b, c, ..., z

# - Numbers.        0, 1, 2, ..., 9

# - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9

# - F-keys.         f1, f2, ..., f20

# - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,

#                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab

# - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,

#                   keypadMinus, keypadMultiply, keypadPlus

# - Arrows.         left, down, up, right


# All possible modifiers: cmd, alt, ctrl, shift


# All possible commands: https://nikitabobko.github.io/AeroSpace/commands


# You can uncomment this line to open up terminal with cmd + enter shortcut

# See: https://nikitabobko.github.io/AeroSpace/commands#exec-and-forget

# cmd-enter = 'exec-and-forget open -n /System/Applications/Utilities/Terminal.app'


# See: https://nikitabobko.github.io/AeroSpace/commands#layout

cmd-slash = 'layout accordion horizontal vertical'

cmd-backslash = 'layout tiles horizontal vertical'


# alt-enter = 'exec-and-forget open -n /Applications/Alacritty.app' # use Super + N to open new alacritty terminal

alt-enter = 'macos-native-fullscreen'

alt-q = 'close'

alt-e = 'macos-native-minimize'

alt-m = 'fullscreen'

cmd-left = 'workspace --wrap-around prev'

cmd-right = 'workspace --wrap-around next'

cmd-up = 'focus-monitor prev'

cmd-down = 'focus-monitor next'

cmd-shift-leftSquareBracket = 'move-workspace-to-monitor prev'

cmd-shift-rightSquareBracket = 'move-workspace-to-monitor next'

cmd-ctrl-left = 'move-node-to-monitor prev'

cmd-ctrl-right = 'move-node-to-monitor next'

cmd-ctrl-up = 'move-workspace-to-monitor prev'

cmd-ctrl-down = 'move-workspace-to-monitor next'

cmd-shift-c = 'reload-config'

cmd-shift-f = 'layout floating tiling'

f11 = 'fullscreen'


# See: https://nikitabobko.github.io/AeroSpace/commands#mode

cmd-shift-m = 'mode manage'

cmd-shift-r = 'mode resize'


# See: https://nikitabobko.github.io/AeroSpace/commands#focus

cmd-h = 'focus left'

cmd-j = 'focus down'

cmd-k = 'focus up'

cmd-l = 'focus right'


# See: https://nikitabobko.github.io/AeroSpace/commands#move

cmd-shift-h = 'move left'

cmd-shift-j = 'move down'

cmd-shift-k = 'move up'

cmd-shift-l = 'move right'


# See: https://nikitabobko.github.io/AeroSpace/commands#resize

cmd-shift-minus = 'resize smart -50'

cmd-shift-equal = 'resize smart +50'


# See: https://nikitabobko.github.io/AeroSpace/commands#workspace

alt-1  = 'workspace 1'

alt-2 = 'workspace 2'

alt-3 = 'workspace 3'

alt-4 = 'workspace 4'

alt-5 = 'workspace 5'

alt-6 = 'workspace 6'

alt-7 = 'workspace 7'

alt-8 = 'workspace 8'

alt-9 = 'workspace 9'

alt-0 = 'workspace 10'


alt-shift-1 = ['move-node-to-workspace 1', 'workspace 1']

alt-shift-2 = ['move-node-to-workspace 2', 'workspace 2']

alt-shift-3 = ['move-node-to-workspace 3', 'workspace 3']

alt-shift-4 = ['move-node-to-workspace 4', 'workspace 4']

alt-shift-5 = ['move-node-to-workspace 5', 'workspace 5']

alt-shift-6 = ['move-node-to-workspace 6', 'workspace 6']

alt-shift-7 = ['move-node-to-workspace 7', 'workspace 7']

alt-shift-8 = ['move-node-to-workspace 8', 'workspace 8']

alt-shift-9 = ['move-node-to-workspace 9', 'workspace 9']

alt-shift-0 = ['move-node-to-workspace 10', 'workspace 10']


# See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth

alt-tab = 'workspace-back-and-forth'

# See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor

alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'


# 'manage' binding mode declaration.

# See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes

[mode.manage.binding]

esc = 'mode main'

enter = 'mode main'

c = ['reload-config', 'mode main'] # reload config

r = ['flatten-workspace-tree', 'mode main'] # reset layout

#s = ['layout sticky tiling', 'mode main'] # sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2

f = [

    'layout floating tiling',

    'mode main',

] # Toggle between floating and tiling layout

backspace = ['close-all-windows-but-current', 'mode main']


h = ['join-with left', 'mode main']

j = ['join-with down', 'mode main']

k = ['join-with up', 'mode main']

l = ['join-with right', 'mode main']


[mode.resize.binding]

h = 'resize width -50'

j = 'resize height +50'

k = 'resize height -50'

l = 'resize width +50'

enter = 'mode main'

esc = 'mode main'

And here is my sway config: default_border none

gaps inner 5

gaps outer 3

gaps top 0

### Variables


# Logo key. Use Mod1 for Alt.

set $mod Mod4

#Your preferred terminal emulator

set $term kitty

# Your preferred application launcher

# Note: pass the final command to swaymsg so that the resulting window can be opened

# on the original workspace that the command was run on.

# Recommends: rofi-wayland

set $rofi_cmd rofi \

        -terminal '$term'

# Shows a combined list of the applications with desktop files and

# executables from PATH.

# TODO: add window with the next release of rofi-wayland

set $menu $rofi_cmd -show combi -combi-modes drun#run -modes combi


### Add this line here

exec "export QT_QPA_PLATFORMTHEME=qt5ct"


# Default wallpaper (more resolutions are available in /usr/share/backgrounds/sway/)

# Requires: desktop-backgrounds-compat, swaybg, jxl-pixbuf-loader

output * bg /home/tanish/GitHub/Tanish_Wallpapers/wallhaven-kwq9j6.jpg fill

#

# Example configuration:

#

#   output HDMI-A-1 resolution 1920x1080 position 1920,0

output eDP-1 resolution 1920x1080 position 0,0

output DP-6 resolution 1920x1080 position 1920,0

# You can get the names of your outputs by running: swaymsg -t get_outputs


### Idle configuration

#

exec swayidle -w \

          timeout 300 'swaylock -f -c 000000' \

          timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \

          timeout 1800 'systemctl suspend' \

          before-sleep 'swaylock -f -c 000000'

#

# This will lock your screen after 300 seconds of inactivity, then turn off

# your displays after another 300 seconds, and turn your screens back on when

# resumed. It will also lock your screen before your computer goes to sleep.


### Input configuration

#

input "2:14:SynPS/2_Synaptics_TouchPad" {

       dwt enabled

       tap enabled

       natural_scroll enabled

       middle_emulation enabled

}


input "1739:30385:CUST0001:00_06CB:76B1_Touchpad" {

    tap enabled

    accel_profile flat

    dwt enabled

    natural_scroll enabled

}


#

# You can get the names of your inputs by running: swaymsg -t get_inputs

# Read `man 5 sway-input` for more information about this section.


### Key bindings

#

# Basics:

#

    # Start a terminal

    bindsym $mod+Return exec $term


    # Kill focused window

    bindsym $mod+q kill


    # Start your launcher

    bindsym $mod+a exec $menu


    #open browser (firefox)

    bindsym $mod+b exec firefox


    #open browser (qutebrowser)

    bindsym $mod+u exec qutebrowser


    #open discord

    bindsym $mod+v exec flatpak run dev.vencord.Vesktop


    #open spotify

    bindsym $mod+o exec flatpak run com.spotify.Client


    # emacs

    bindsym $mod+c exec emacs


    #thunar

    bindsym $mod+t exec thunar


    #rofi

    bindsym $mod+n exec kitty nvim

    

    # Suspend the system

    bindsym $mod+Shift+s exec systemctl suspend


    # Drag floating windows by holding down $mod and left mouse button.

    # Resize them with right mouse button + $mod.

    # Despite the name, also works for non-floating windows.

    # Change normal to inverse to use left mouse button for resizing and right

    # mouse button for dragging.

    floating_modifier $mod normal


    # Reload the configuration file

    bindsym $mod+Shift+c reload


    # Exit sway (logs you out of your Wayland session)

    bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'


    # Power off the system

    bindsym $mod+Shift+q exec swaynag -t warning -m 'You pressed the shutdown shortcut. Do you really want to power off?' -B 'Yes, power off' 'systemctl poweroff'

#

# Moving around:

#

    # Move your focus around

    bindsym $mod+Left focus left

    bindsym $mod+Down focus down

    bindsym $mod+Up focus up

    bindsym $mod+Right focus right


    # Move the focused window with the same, but add Shift

   bindsym $mod+Shift+Left move left

    bindsym $mod+Shift+Down move down

    bindsym $mod+Shift+Up move up

    bindsym $mod+Shift+Right move right

#

# Workspaces:

#

    # Switch to workspace

    bindsym $mod+1 workspace number 1

    bindsym $mod+2 workspace number 2

    bindsym $mod+3 workspace number 3

    bindsym $mod+4 workspace number 4

    bindsym $mod+5 workspace number 5

    bindsym $mod+6 workspace number 6

    bindsym $mod+7 workspace number 7

    bindsym $mod+8 workspace number 8

    bindsym $mod+9 workspace number 9

    bindsym $mod+0 workspace number 10

    # Move focused container to workspace

    bindsym $mod+Shift+1 move container to workspace number 1

    bindsym $mod+Shift+2 move container to workspace number 2

    bindsym $mod+Shift+3 move container to workspace number 3

    bindsym $mod+Shift+4 move container to workspace number 4

    bindsym $mod+Shift+5 move container to workspace number 5

    bindsym $mod+Shift+6 move container to workspace number 6

    bindsym $mod+Shift+7 move container to workspace number 7

    bindsym $mod+Shift+8 move container to workspace number 8

    bindsym $mod+Shift+9 move container to workspace number 9

    bindsym $mod+Shift+0 move container to workspace number 10

    # Note: workspaces can have any name you want, not just numbers.

    # We just use 1-10 as the default.

#

# Layout stuff:

#

    # You can "split" the current object of your focus with

    # $mod+b or $mod+v, for horizontal and vertical splits

    # respectively.

    bindsym $mod+h splith

    bindsym $mod+l splitv


    # Switch the current container between different layout styles

    bindsym $mod+s layout stacking

    bindsym $mod+w layout tabbed

    bindsym $mod+e layout toggle split


    # Make the current focus fullscreen

    bindsym $mod+f fullscreen


    # Toggle the current focus between tiling and floating mode

    bindsym $mod+Shift+space floating toggle


    # Swap focus between the tiling area and the floating area

    bindsym $mod+space focus mode_toggle


    # Move focus to the parent container

    bindsym $mod+d focus parent

#

# Scratchpad:

#

    # Sway has a "scratchpad", which is a bag of holding for windows.

    # You can send windows there and get them back later.


    # Move the currently focused window to the scratchpad

    bindsym $mod+Shift+minus move scratchpad


    # Show the next scratchpad window or hide the focused scratchpad window.

    # If there are multiple scratchpad windows, this command cycles through them.

    bindsym $mod+minus scratchpad show

#

# Resizing containers:

#

mode "resize" {

    # left will shrink the containers width

    # right will grow the containers width

    # up will shrink the containers height

    # down will grow the containers height


    bindsym Left resize shrink width 10px

    bindsym Down resize grow height 10px

    bindsym Up resize shrink height 10px

    bindsym Right resize grow width 10px


    # Return to default mode

    bindsym Return mode "default"

    bindsym Escape mode "default"

}

bindsym $mod+r mode "resize"


# Include configs from 3 locations:

#  - /usr/share/sway/config.d

#  - /etc/sway/config.d

#  - $XDG_CONFIG_HOME/sway/config.d ($HOME/.config/sway/config.d)

#

# If multiple directories contain the files with the same name, the later

# directory takes precedence; `$XDG_CONFIG_HOME/sway/config.d/20-swayidle.conf`

# will always be loaded instead of `/usr/share/sway/config.d/20-swayidle.conf`

# or `/etc/sway/config.d/20-swayidle.conf`

#

# This mechanism permits overriding our default configuration per-system

# (/etc) or per-user ($XDG_CONFIG_HOME) basis. Just create the file you

# want to modify/override in the higher-level directory.

#

# For example, to disable the default bar from Fedora configs, you'll need to

#     $ echo -n > "$HOME/.config/sway/config.d/90-bar.conf"

#

# Note the quoting, the $() and the arguments quoting. All the parts are equally

# important to make the magic work. And if you want to learn the secret behind

# the trick, it's all in the `wordexp(3)`.

#

include '$(/usr/libexec/sway/layered-include "/usr/share/sway/config.d/*.conf" "/etc/sway/config.d/*.conf" "${XDG_CONFIG_HOME:-$HOME/.config}/sway/config.d/*.conf")'

This is great! Having your full aerospace and Sway configs confirms where the keybinding conflicts lie and allows for a comprehensive, consistent solution for qutebrowser.

Analysis of WM Keybindings

OS	WM	Modifiers/Keys	Action	Conflict Status
macOS	aerospace	Alt+1−0	Switch Workspaces	MAJOR CONFLICT for any M− (Alt) qutebrowser binding.
macOS	aerospace	Cmd+H/J/K/L	Focus Window Movement	MAJOR CONFLICT for any Cmd qutebrowser binding.
macOS	aerospace	Cmd+Shift+H/J/K/L	Move Window	MAJOR CONFLICT for any Cmd+Shift qutebrowser binding.
Linux	Sway	set $mod Mod4	Mod4 (Super/Win) is your main key.	No direct conflict with Alt or Ctrl by default.
Linux	Sway	Mod4+1−0	Switch Workspaces	No direct conflict with Ctrl or Alt keybindings.

Conclusion on Qutebrowser Key Choice

Since:

    Alt/Option (M-) is reserved by aerospace for workspace switching (alt+1−0).

    Cmd is reserved by aerospace for window focus/movement (cmd+H/J/K/L).

    Cmd is reserved by Firefox on macOS for tab switching (Cmd+1−9).

The safest and most consistent modifier to use for your qutebrowser commands that mimic WM-style actions (Mod+key) is the Control (C-) key.

Qutebrowser Keybinding Plan (Using C−)

Here are the specific changes to your qutebrowser config to achieve consistency and avoid conflicts.

1. The Core WM-Style Bindings (Tab Management)

Change your tab movement and window movement-style hints to use Ctrl.
Old Binding	New Binding	Command	Rationale
gJ	C−j	tab-move +	Avoids Cmd+J (aerospace focus down).
gK	C−k	tab-move -	Avoids Cmd+K (aerospace focus up).
T	C−t	hint links tab	Avoids Cmd+T (Firefox new tab) for a crucial action.
m	C−m	hint links spawn mpv {hint-url}	m is a common key, C−m is more dedicated.

Qutebrowser Code Changes:
Python

# =========================
#   KEYBINDINGS (Revised for C- prefix consistency)
# =========================
# ...

# Change tab movement keys to use Ctrl to avoid Cmd/Option conflicts
# These mimic the j/k movement keys you use in your WMs.
config.bind('C-j', 'tab-move +')
config.bind('C-k', 'tab-move -')

# Change hint links to open in a new tab to use Ctrl
config.bind('C-t', 'hint links tab') # Replaces T for a more "mod-key" feel

# Use Ctrl-m for mpv integration
config.bind('C-m', 'hint links spawn mpv {hint-url}') # Replaces m

# Note: You can keep other unique bindings as they are unlikely to conflict
config.bind('T', 'hint links all tab') # Secondary, non-mod binding
# ...

2. Simplifying Workspace Switching Keys

Your Sway config uses Mod4+1−0 and Mod4+Shift+1−0. Your aerospace config uses Alt+1−0 and Alt+Shift+1−0.

Since qutebrowser doesn't manage workspaces, the only qutebrowser binding that deals with this is gJ and gK for tab movement.

Recommendation: Stick with the C−j and C−k bindings in qutebrowser as detailed above. This is the most straightforward and conflict-free path.

3. Sway Configuration Note

For your Sway setup to use the same physical key for tab movement, you would just ensure your Sway bindings remain:
Ini, TOML

# Sway Config (Already Correct)
# Move your focus around - uses $mod (Mod4/Super)
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# The Qutebrowser C-j/C-k bindings will not conflict with this.

Summary of Final Qutebrowser Keybindings

Implement these changes in your qutebrowser config file:
Python

# =========================
#   KEYBINDINGS
# =========================
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
# config.bind('T', 'hint links tab') # Removed in favor of C-t, but can be kept as a backup
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tT', 'config-cycle tabs.position top left')

# NEW: Use C-j/C-k for tab movement (avoids all WM conflicts)
config.bind('C-j', 'tab-move +') # Replaces gJ
config.bind('C-k', 'tab-move -') # Replaces gK

# NEW: Use C-t for hint tab open (avoids Cmd+T on Mac)
config.bind('C-t', 'hint links tab') 

config.bind('gm', 'tab-move')

# NEW: Use C-m for MPV (avoids common key 'm')
config.bind('C-m', 'hint links spawn mpv {hint-url}')

# =========================
#   MPV INTEGRATION
# =========================
# The 'm' binding above is now C-m
# ...

The issue is that I want to use cmd 1 through 0 to change through tabs on qutebrowser, but I also dont want it to cause issues on my sway config. Also, I dont use mpv.

I understand. The goal is to use the Cmd + 1 through 0 keys for tab switching in qutebrowser on macOS, while ensuring these bindings don't conflict with your Sway setup (where your Mod4 key is Super or Win) or your aerospace setup. You also confirmed you don't need the MPV bindings.

Since Cmd on macOS is the Super/Mod4 equivalent for your window managers, binding Cmd+1−0 inside qutebrowser will conflict with your workspace switching in both aerospace (which uses Alt for this) and Sway (which uses Mod4/Super for this).

The most reliable solution is to use the set-cmd-alias feature in qutebrowser to create a consistent, OS-agnostic alias for tab switching, and then bind it to a non-conflicting key that is safe across both macOS and Linux.

The Ctrl key is the safest choice, as previously discussed. We'll use Ctrl+1 through 0 for qutebrowser tabs.

Here are the changes for your qutebrowser configuration:

Qutebrowser Configuration Changes

1. Remove Conflicting/Unused Bindings

We'll remove the MPV binding and the original tab movement bindings, as well as the unused T hint (in favor of a consistent Ctrl-based key).
Python

# =========================
#   KEYBINDINGS (Cleanup)
# =========================
# Remove old tab-move bindings (gJ, gK, gm) and mpv binding (m)
# The user wants to use C-1 through C-0 instead of gJ/gK for switching
config.unbind('gJ')
config.unbind('gK')
config.unbind('gm')

# Remove the single-key T hint (using C-t instead is safer)
config.unbind('T')

# Remove MPV binding, as requested
# The original config had 'm':
# config.bind('m', 'hint links spawn mpv {hint-url}')
config.unbind('m')

# ... other existing, non-conflicting bindings remain
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
# ...

2. Implement Tab-Switching Bindings

We will bind Ctrl+1 through 0 to switch tabs. This is safe on macOS (as Cmd+1−9 is reserved by macOS for browser tab switching, and Option/Alt+1−0 is reserved by aerospace for workspace switching). It is also safe in Sway as Mod4+1−0 is used for workspace switching.
Action	New Qutebrowser Binding	Rationale
Switch to Tab 1	C−1	Avoids Cmd/Mod4 conflict.
Switch to Tab 2	C−2	Avoids Cmd/Mod4 conflict.
...	...	...
Switch to Tab 9	C−9	Avoids Cmd/Mod4 conflict.
Switch to Tab 10	C−0	Avoids Cmd/Mod4 conflict.
Python

# =========================
#   KEYBINDINGS (New Tab Switching)
# =========================

# Bind Ctrl + 1 through 9 to switch directly to a specific tab index
config.bind('C-1', 'tab-focus 1')
config.bind('C-2', 'tab-focus 2')
config.bind('C-3', 'tab-focus 3')
config.bind('C-4', 'tab-focus 4')
config.bind('C-5', 'tab-focus 5')
config.bind('C-6', 'tab-focus 6')
config.bind('C-7', 'tab-focus 7')
config.bind('C-8', 'tab-focus 8')
config.bind('C-9', 'tab-focus 9')
config.bind('C-0', 'tab-focus 10') # Or to the last tab

# Use C-t for hint links tab (avoids Cmd+T on Mac)
config.bind('C-t', 'hint links tab')

# Tab movement (previous/next)
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')
config.bind('<Ctrl-Tab>', 'tab-next')

3. Final Qutebrowser Snippet

Replace the corresponding sections in your existing config with this revised code:
Python

# =========================
#   KEYBINDINGS
# =========================
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tT', 'config-cycle tabs.position top left')

# Safely bind Ctrl + 1-0 for tab switching
config.bind('C-1', 'tab-focus 1')
config.bind('C-2', 'tab-focus 2')
config.bind('C-3', 'tab-focus 3')
config.bind('C-4', 'tab-focus 4')
config.bind('C-5', 'tab-focus 5')
config.bind('C-6', 'tab-focus 6')
config.bind('C-7', 'tab-focus 7')
config.bind('C-8', 'tab-focus 8')
config.bind('C-9', 'tab-focus 9')
config.bind('C-0', 'tab-focus 10')

# Safely bind Ctrl+T for opening a hint in a new tab
config.bind('C-t', 'hint links tab')

# Add explicit tab-next/tab-prev
config.bind('<Ctrl-Tab>', 'tab-next')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')


# =========================
#   MPV INTEGRATION
# =========================

# =========================
#   MISC SETTINGS
# =========================
config.load_autoconfig()
c.auto_save.session = True

