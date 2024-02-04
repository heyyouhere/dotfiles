vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ':Explore<CR>')
vim.keymap.set("n", "<leader>q", ':q! <CR>')
vim.keymap.set("n", "<leader>w", ':w <CR>')
--vim.cmd('set autochdir')

vim.keymap.set("n", "<leader>pr", ':w | vsplit | terminal python3 % <CR>')
vim.keymap.set("n", "<leader>pi", ':w | vsplit | terminal python3 -i % <CR>')
vim.keymap.set("n", "<leader>rr", ':w | vsplit | terminal cargo run <CR>')
vim.keymap.set("n", "<leader>rb", ':w | vsplit | terminal cargo build <CR>')
vim.keymap.set("n", "<leader>n",  ':noh <CR>')
vim.keymap.set("n", "<leader>w",  '<C-w>')
vim.keymap.set("n", "<leader>ws", '<C-w>s<C-w>j | :Explore<CR>')
vim.keymap.set("n", "<leader>wv", '<C-w>v<C-w>l | :Explore<CR>')
vim.keymap.set("n", "<leader>t",  '<C-w>v<C-w>l | :terminal <CR> i')
vim.keymap.set("t", "<Esc>",  '<C-\\><C-n>')



vim.opt.relativenumber = true


-- Set the undodir option to the undo directory
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

-- Enable persistent undo
vim.opt.undofile = true

-- Set line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set color scheme and background
vim.cmd('colorscheme default')
vim.opt.background = 'dark'

-- Set indentation settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Set statusline and show filename
vim.opt.laststatus = 2

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars:append({ eol = '$', space = '⋅' })
-- Enable filetype detection, plugins and indentation
vim.cmd('filetype on')
vim.cmd('set linebreak')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Enable syntax highlighting

-- Disable backup files
vim.opt.backup = false

-- Ignore case in searches
vim.opt.ignorecase = true

-- Show command being typed
vim.opt.showcmd = true

-- Set cursor shape
vim.opt.guicursor = 'n-v-c:block-Cursor'

-- Sometimes it is usefull, i forget to release Shift
vim.api.nvim_create_user_command('W',function()
  vim.cmd(":w")
end,{})
