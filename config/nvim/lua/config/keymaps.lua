local map = vim.api.nvim_set_keymap

map("i", "jk", "<ESC>:w<cr>", {})

-- Telescope
map("n", "<leader>tF", ":Telescope live_grep<cr>", {})
map("n", "<leader>tp", ":Telescope find_files<cr>", {})
