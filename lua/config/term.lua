vim.keymap.set("n", "<leader>tt", ':ToggleTerm<CR>')
vim.keymap.set("t", "<C-x>", '<C-\\><C-n>')

local toggle = require("toggleterm")
toggle.setup({
    direction = "horizontal",
    hide_numbers = false
})

local terminal = require("toggleterm.terminal").Terminal

-- python3
vim.keymap.set("n", "<leader>tp", function ()
    terminal:new({
        size = 100,
        cmd = "python3",
        hidden = true
    }):toggle()
end)

-- btop
vim.keymap.set("n", "<leader>tb",function ()
    terminal:new({
        size = 100,
        cmd = "btop",
        direction = "float",
        hidden = true
    }):toggle()
end)

-- lazygit
vim.keymap.set("n", "<leader>tg", function ()
    terminal:new({
        size = 100,
        cmd = "lazygit",
        direction = "float",
        hidden = true
    }):toggle()
end)
