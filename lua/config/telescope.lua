local builtin = require 'telescope.builtin'
-- telescope
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { noremap = false, silent = false })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = false, silent = false })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { noremap = false, silent = false })
vim.keymap.set('n', '<leader>fl', builtin.lsp_references, { noremap = false, silent = false })
