local map = vim.api.nvim_set_keymap

map("i", "jk", "<ESC>:w<cr>", {})

map("n", "<leader>F", ":Telescope live_grep<cr>", {})
