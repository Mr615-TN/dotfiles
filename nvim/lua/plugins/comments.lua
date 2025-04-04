-- lua/plugins/comment.lua

-- You can add any setup or configurations here if you need them later.
-- For now, leaving it empty as you mentioned no options.
return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup() -- Set up the plugin after it's loaded
    end,
  },
}
