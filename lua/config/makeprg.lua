vim.keymap.set("n", "<leader>m", ':make!<CR>');

vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    pattern = "*.lua",
    callback = function()
    local current_file = vim.fn.expand("%:p:h")
    local main_lua_path = current_file .. "/main.lua"

    local cmd = ":set makeprg="
    if vim.fn.filereadable(main_lua_path) == 1 then
        cmd = cmd .. "love\\ ."
    else
        cmd = cmd .. "lua\\ %"
    end
        vim.cmd(cmd)
    end,
})

vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    pattern = "*.py",
    callback = function()
        local cmd = ":set makeprg=python3\\ %"
        vim.cmd(cmd)
    end,
})

vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    pattern = "*.go",
    callback = function()
        local cmd = ":set makeprg="
        cmd = cmd .. "go\\ build;\\ go\\ run\\ %"
        vim.cmd(cmd)
    end,
})
