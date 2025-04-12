local M = {}

local splash_sets = {
  {
    art = {
      "      /\\",
      "     /__\\_  _",
      "    (    )\\( )",
      "     \\__/  |/",
      "     _||_  |   ",
      "    /____\\ |",
      "   (======)|",
      "    }====={",
      "   /      \\",
      "  /_/\\__/\\_\\",
      "   Igris | Shadow Knight",
    },
    quotes = {
      "“Command me, my king.” — Igris",
      "“Steel does not fear death.”",
      "“I will cut down your enemies.”",
    },
  },
  {
    art = {
      "       ,-.       _,---._ __  / \\ ",
      "      /  )    .-'       `./ /   \\",
      "     (  (   ,'            `/    /|",
      "      \\  `-\"             \\'\\   / |",
      "       `.              ,  \\ \\ /  |",
      "        /`.          ,'-`----Y   |",
      "       (            ;        |   '",
      "       |  ,-.    ,-'         |  /",
      "       |  | (   |            | /",
      "       )  |  \\  `.___________|/",
      "       `--'   `--'           ",
      "         Beru | Shadow Ant King",
    },
    quotes = {
      "“I exist to serve only my liege.” — Beru",
      "“Do not fear... I am here to protect you.”",
      "“Your majesty, your command is my existence.”",
    },
  },
  {
    art = {
      "       /\\_/\\",
      "     =( °w° )=",
      "      )   (  //",
      "     (__ __)//",
      "     //     \\\\",
      "    ((       ))",
      "     \\\\_____//",
      "     Bellion | Grand Marshal",
    },
    quotes = {
      "“For the Shadow Monarch, I kneel.” — Bellion",
      "“You are the ruler I’ve awaited.”",
      "“My blade shall strike at your enemies’ hearts.”",
    },
  },
}

function M.show_splash()
  vim.schedule(function()
    vim.cmd("enew")
    local buf = vim.api.nvim_get_current_buf()

    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = true
    vim.bo[buf].readonly = false

    local pick = splash_sets[math.random(#splash_sets)]
    local content = vim.deepcopy(pick.art)
    table.insert(content, "")
    table.insert(content, pick.quotes[math.random(#pick.quotes)])
    table.insert(content, "")
    table.insert(content, "Press <Enter> to rise with shadows...")

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false

    vim.api.nvim_win_set_cursor(0, { #content, 0 })

    vim.keymap.set("n", "<CR>", ":bd!<CR>", { buffer = buf, silent = true })
  end)
end

return M
