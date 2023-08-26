vim.keymap.set("n", "<leader>h", ':lua require("harpoon.mark").add_file() <CR>')
vim.keymap.set("n", "<leader>hm", ':lua require("harpoon.ui").toggle_quick_menu() <CR>')
vim.keymap.set("n", "<leader>1", ':lua require("harpoon.ui").nav_file(1) <CR>')
vim.keymap.set("n", "<leader>2", ':lua require("harpoon.ui").nav_file(2) <CR>')
vim.keymap.set("n", "<leader>3", ':lua require("harpoon.ui").nav_file(3) <CR>')
vim.keymap.set("n", "<leader>4", ':lua require("harpoon.ui").nav_file(4) <CR>')
vim.keymap.set("n", "<leader>[", ':lua require("harpoon.ui").nav_prev() <CR>')
vim.keymap.set("n", "<leader>]", ':lua require("harpoon.ui").nav_next() <CR>')
