vim.g.mapleader = " "
vim.keymap.set("n" ,"<leader>e", ':Explore<CR>')
vim.keymap.set("n", "<leader>p", ':w | !clear; python3 % <CR>')
vim.keymap.set("n", "<leader>r", ':w | !clear; cargo run <CR>')

vim.opt.number = true
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
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Disable backup files
vim.opt.backup = false

-- Ignore case in searches
vim.opt.ignorecase = true

-- Show command being typed
vim.opt.showcmd = true

-- Set cursor shape
vim.opt.guicursor = 'n-v-c:block-Cursor'
