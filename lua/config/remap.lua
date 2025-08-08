vim.keymap.set("n", "<leader>e", ':Oil<CR>')
vim.keymap.set("n", "<leader>w", ':w<CR>')
vim.keymap.set("n", "<leader>n",  ':noh<CR>')

-- jump windows
vim.keymap.set('n', '<C-w>s', '<C-w>s<C-w>w:Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>v', '<C-w>v<C-w>w:Oil<CR>', { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set("n", "<leader>d", ':lua vim.diagnostic.goto_next()<CR>zz')
vim.keymap.set("n", "<leader>D", ':lua vim.diagnostic.goto_prev()<CR>zz')


-- Flash on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Set the undodir option to the undo directory
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

-- Enable persistent undo
vim.opt.undofile = true

-- Set line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set color scheme and background
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

vim.api.nvim_create_user_command('Wq',function()
  vim.cmd(":wq")
end,{})

-- Disallow arrows and ESC
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Esc>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Esc>', '<Nop>', { noremap = true, silent = true })
vim.opt.termguicolors = true
vim.cmd("set guicursor=a:blinkwait5-blinkon5-blinkoff5")
