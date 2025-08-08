-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
    { 'ThePrimeagen/harpoon' },
    { 'nvim-lua/plenary.nvim' },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end
    },
    { 'heyyouhere/gruber-darker.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'folke/lsp-colors.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },           -- Required
            { 'hrsh7th/cmp-nvim-lsp' },       -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    },
    { 'habamax/vim-godot' },
    { 'tpope/vim-commentary' },
    { 'cappyzawa/trim.nvim' },
    { 'stevearc/oil.nvim',   opts = {}, dependencies = { { "echasnovski/mini.icons", opts = {} } }, lazy = false, },
    { "vague2k/vague.nvim"},
{
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
        -- Setup orgmode
        require('orgmode').setup({
            org_agenda_files = '~/orgfiles/**/*',
            org_default_notes_file = '~/orgfiles/quicknote.org',
        })
    end,
},
})
