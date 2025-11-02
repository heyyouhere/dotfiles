vim.opt.signcolumn = 'yes'

vim.lsp.config('lua_ls', {
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
})

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = {
                    enabled = true,
                    maxLineLength = 100,
                },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
            },
        }
    }
})

-- Setup nvim-cmp
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
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({}),
})

-- Setup mason and mason-lspconfig
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'pylsp' },
    -- automatic_enable is true by default, so installed servers will be enabled automatically
})

-- Your keymaps
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set('i', '<M-s>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set('n', '<M-s>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
