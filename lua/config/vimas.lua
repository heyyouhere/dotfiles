vim.keymap.set("v", "<leader>z", function()
    local disasm_path = "/home/heyyouhere/Programming/projects/vimas/dis/dis"

    local filepath = vim.api.nvim_buf_get_name(0)
    local line1 = vim.fn.getpos("v")[2]
    local line2 = vim.fn.getpos(".")[2]
    local startLine = math.min(line1, line2)
    local endLine = math.max(line1, line2)

    local source = filepath .. ":" .. startLine .. "-" .. endLine

    local gomodPath = vim.fn.findfile("go.mod")
    local gomodDir = vim.fn.fnamemodify(gomodPath, ":h")
    vim.fn.chdir(gomodDir)
    local moduleName =  vim.fn.system({"go", "list", "-m"}):match("^%s*(.-)%s*$")
    local binPath = vim.fn.findfile(moduleName)
    if binPath == "" then
        print("no executable for " .. moduleName .. " found")
        return
    end
    local absBinPath = vim.fn.fnamemodify(binPath, ":p")

    local cmd = { disasm_path, absBinPath, source }
    local output = vim.fn.system(cmd)
    print(absBinPath .. " " .. source .. "\n" .. output)
end)
