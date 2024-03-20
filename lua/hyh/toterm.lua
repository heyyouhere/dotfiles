vim.keymap.set("n", "<leader>tt",  ':ToggleTerm<CR>')
vim.keymap.set("t", "<Esc>",  '<C-\\><C-n>')



local toggle = require("toggleterm")
toggle.setup({
    direction = "horizontal",
    hide_numbers = false
})



local terminal = require("toggleterm.terminal").Terminal
function _PYTERM()
   local pyterm = terminal:new({size = 100, cmd = "python3", hidden = true})
   pyterm:toggle()
end
vim.keymap.set("n", "<leader>tp",  ':lua _PYTERM()<CR>')

function _BTOPTERM()
   local btopterm = terminal:new({size = 100, cmd = "btop",direction="float",  hidden = true})
   btopterm:toggle()
end
vim.keymap.set("n", "<leader>tb",  ':lua _BTOPTERM()<CR>')
