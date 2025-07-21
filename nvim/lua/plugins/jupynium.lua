-- lua/plugins/jupynium.lua

return {
  -- Jupynium.nvim plugin specification
  {
    "kiyoon/jupynium.nvim",
    -- Remove 'build' command since you're using pipx manually
    -- build = "pip3 install --user .",
    dependencies = {
      "rcarriga/nvim-notify",    -- optional
      "stevearc/dressing.nvim",  -- optional, UI for :JupyniumKernelSelect
      -- Remove "saghen/blink.cmp" from here
    },
    config = function()
      require("jupynium").setup({
        -- Your Jupynium specific configurations
        -- jupyter_command = "jupyter notebook",
      })

    end,
  },
}
