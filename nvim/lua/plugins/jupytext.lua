-- ~/.config/nvim/lua/plugins/jupytext.lua
return {
  "goerz/jupytext.nvim",
  version = "0.2.0",
  -- Make opts a function that returns the options table
  opts = function()
    -- Now, inside this function, the 'jupytext' plugin should be available
    -- to be required, as lazy.nvim will execute this function AFTER the plugin is loaded.
    local jupytext_api = require("jupytext")

    return {
      jupytext = "jupytext",
      format = "markdown",
      update = true,
      filetype = jupytext_api.get_filetype, -- Access via the loaded API
      new_template = jupytext_api.default_new_template(), -- Access via the loaded API
      sync_patterns = { "*.md", "*.py", "*.jl", "*.R", "*.Rmd", "*.qmd" },
      autosync = true,
      handle_url_schemes = true,
    }
  end,
  -- Add any other configurations like keys, dependencies here if needed
  -- For example, if you want some basic keybindings:
  -- keys = {
  --   { "<leader>jp", "<cmd>JupytextPair<CR>", desc = "Jupytext Pair" },
  --   { "<leader>js", "<cmd>JupytextSync<CR>", desc = "Jupytext Sync" },
  --   { "<leader>jo", "<cmd>JupytextOpenIpynb<CR>", desc = "Jupytext Open .ipynb" },
  -- },
}
