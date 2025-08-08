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
    ensure_installed = { 'lua_ls', 'rust_analyzer' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})


require'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    [vim.fn.expand "${3rd}/love2d/library"] = true,
                    checkThirdParty = "Apply"
                },
            },
        },
    },
}

require'lspconfig'.pylsp.setup{
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = {
                    maxLineLength = 100  -- Set your desired line width here
                },
                pycodestyle = {
                    maxLineLength = 100  -- Set your desired line width here
                },
                pyflakes = {
                    maxLineLength = 100  -- Set your desired line width here
                }
            }
        }
    }
}

vim.keymap.set("n", "<leader>f", ':lua vim.lsp.buf.format()<CR>')
