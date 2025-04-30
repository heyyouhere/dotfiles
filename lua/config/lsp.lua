vim.opt.signcolumn = 'yes'
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

vim.keymap.set("n", "<leader>f", ':lua vim.lsp.buf.format()<CR>')
