local basic_flask = {
    "from flask import Flask",
    "",
    "app = Flask(__name__)",
    "",
    "",
    "@app.route('/')",
    "def hello():",
    "    return '<h1>Hello, World!</h1>'",
    "",
    "",
    "app.run(host='0.0.0.0', port=80)",
}


local basic_html ={
        "<!DOCTYPE html>",
        "<html>",
        "    <head>",
        "        <title> HTML </title>",
        "        <meta charset=\"UTF-8\">",
        "     </head>",
        "     <body>",
        "           ",
        "           ",
        "           ",
        "     </body>",
        "     <link rel=\"stylesheet\" href=\"mystyle.css\">",
        "     <script type='text/javascript' src=\"script.js\"></script>",
        "</html>"
}

local MIT_lines = {
"    MIT License",
"",
"Copyright (c) 2023 Maxim Kalanchekaev",
"",
"Permission is hereby granted, free of charge, to any person obtaining a copy",
"of this software and associated documentation files (the \"Software\"), to deal",
"in the Software without restriction, including without limitation the rights",
"to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
"copies of the Software, and to permit persons to whom the Software is",
"furnished to do so, subject to the following conditions:",
"",
"The above copyright notice and this permission notice shall be included in all",
"copies or substantial portions of the Software.",
"",
"THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR",
"IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
"FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
"AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
"LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
"OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE",
"SOFTWARE.",
}



function template(lines)
    local api = vim.api
    local current_buf = api.nvim_get_current_buf()
    local cursor_pos = {0,0}

    local cur_line = api.nvim_win_get_cursor(0)[1]
    local start = cur_line
    if cur_line == 1 and #api.nvim_get_current_line() == 0 then
        start = cur_line - 1
    end
    api.nvim_buf_set_lines(current_buf, start, cur_line, false, lines)
    cursor_pos[1] = start ~= 0 and cur_line + cursor_pos[1] or cursor_pos[1]
end




function HTML()
    template(basic_html)
end

function FLASK()
    template(basic_flask)
end


function MIT()
    template(MIT_lines)
end
