return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      -- Configure the specific mini.nvim modules you want to use.
      local visits = require("mini.visits")
      visits.setup()

      -- fzf-lua integration: frecency files
      vim.keymap.set("n", "<leader>fr", function()
        local items = {}
        for _, v in ipairs(visits.list_paths()) do
          table.insert(items, v.path)
        end
        require("fzf-lua").fzf_exec(items, { prompt = "Frecency> " })
      end, { desc = "Frecency files via mini.visits" })
    end,
  },
}
