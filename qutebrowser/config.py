# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig()  # load settings done via the gui

# Monochrome color values
white = "#ffffff"
black = "#000000"
gray_dark = "#3a3a3a"
gray_medium = "#5c5c5c"
gray_light = "#9e9e9e"
gray_lighter = "#bcbcbc"
transparent = "#00000000"

# Statusbar
c.colors.statusbar.normal.bg = transparent
c.colors.statusbar.command.bg = transparent
c.colors.statusbar.command.fg = white
c.colors.statusbar.normal.fg = gray_lighter
c.colors.statusbar.passthrough.fg = gray_lighter
c.colors.statusbar.url.fg = gray_light
c.colors.statusbar.url.success.https.fg = gray_light
c.colors.statusbar.url.hover.fg = gray_medium

# Tabs
c.colors.tabs.even.bg = transparent
c.colors.tabs.odd.bg = transparent
c.colors.tabs.bar.bg = transparent
c.colors.tabs.even.fg = black
c.colors.tabs.odd.fg = black
c.colors.tabs.selected.even.bg = white
c.colors.tabs.selected.odd.bg = white
c.colors.tabs.selected.even.fg = black
c.colors.tabs.selected.odd.fg = black

# Hints
c.colors.hints.bg = black
c.colors.hints.fg = white
c.hints.border = white

# Completions
c.colors.completion.item.selected.match.fg = gray_medium
c.colors.completion.match.fg = gray_medium
c.colors.completion.odd.bg = black
c.colors.completion.even.bg = black
c.colors.completion.fg = white
c.colors.completion.category.bg = black
c.colors.completion.category.fg = white
c.colors.completion.item.selected.bg = black
c.colors.completion.item.selected.fg = white

# Messages
c.colors.messages.info.bg = black
c.colors.messages.info.fg = white
c.colors.messages.error.bg = black
c.colors.messages.error.fg = white

# Downloads
c.colors.downloads.error.bg = black
c.colors.downloads.error.fg = white
c.colors.downloads.bar.bg = black
c.colors.downloads.start.bg = gray_medium
c.colors.downloads.start.fg = white
c.colors.downloads.stop.bg = gray_light
c.colors.downloads.stop.fg = white

# Tooltips, Webpage, and more
c.colors.tooltip.bg = black
c.colors.webpage.bg = black

# Tabs and UI tweaks
c.tabs.show = "multiple"
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0
c.tabs.width = '7%'
c.tabs.title.format = "{audio}{current_title}"

# Fonts
c.fonts.web.size.default = 20
c.fonts.default_family = []
c.fonts.default_size = '11pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# Dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# Search engines
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!aw': 'https://wiki.archlinux.org/?search={}',
    '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
    '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
    '!yt': 'https://www.youtube.com/results?search_query={}',
}
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

# Session saving
c.auto_save.session = True

# Keybindings
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

# Privacy settings
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

# Adblocking
c.content.blocking.enabled = True
# Uncomment the following if using python-adblock
# c.content.blocking.method = 'adblock'
# c.content.blocking.adblock.lists = [ ... your lists here ... ]

