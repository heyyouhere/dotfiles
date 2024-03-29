local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').gdscript.setup({})
lsp.setup()
