return {
    -- lualine configuration
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, {
                function()
                    return "😄"
                end,
            })
        end,
    },
  -- fzf-lua configuration (replacing Telescope)
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>fp",
                function() 
                    require("fzf-lua").files({ 
                        cwd = require("lazy.core.config").options.root 
                    }) 
                end,
                desc = "Find Plugin File",
            },
        },
        config = function()
            require("fzf-lua").setup({
                -- You can customize fzf-lua options here
                winopts = {
                    height = 0.8,
                    width = 0.8,
                    preview = {
                        layout = "vertical",
                        vertical = "up:45%"
                    }
                }
            })
        end
    },
}
