-- Load the splash screen before plugins
local status_ok, splash = pcall(require, "config.splash")
if status_ok and splash and splash.show_splash then
  splash.show_splash()
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
