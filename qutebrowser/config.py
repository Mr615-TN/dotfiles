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

