

-- a: 1;
-- bb          : 2;
-- dddddd
-- ccccccc     : 3;

-- a         = 1
-- dddddd
-- bb        = 2
-- ccccccc   = 3



function format_string_by_char(char)
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local buffer = vim.fn.bufnr("%")

  local lines = vim.api.nvim_buf_get_lines(buffer, start_line - 1, end_line, false)
    local max_char_position = 0
    for _, line in ipairs(lines) do
        for i = 1, #line do
            local c = line:sub(i,i)
            if c == char then
                if i > max_char_position then
                    max_char_position = i
                end
            end
        end
    end

    local new_lines = {}
    for _, line in ipairs(lines) do
        local new_line = ''
        for i = 1, #line do
            local c = line:sub(i,i)
            if c == char then
                for _=0, max_char_position - i, 1 do
                    new_line = new_line .. " "
                end
            end
            new_line = new_line .. c
        end
        new_lines[#new_lines+1] = new_line
    end
    local counter = 1
    for line = start_line, end_line do
        vim.api.nvim_buf_set_lines(0, line - 1, line, false, {new_lines[counter]})
        counter = counter + 1
    end
end


-- Key mapping to invoke the get_visual_selection function
-- vim.api.nvim_set_keymap('v', '_', ':lua format_string_by_char("=")<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('v', ';', ':lua format_string_by_char(":")<CR>', { noremap = true })
