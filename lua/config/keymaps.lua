local map = vim.keymap.set

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

map("n", "<leader>wq", "<cmd>wqa<CR>")

-- Better viewing
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "g,", "g,zvzz")
map("n", "g;", "g;zvzz")

-- Better escape using jk in insert mode
map("i", "jk", "<Esc>")

-- Better escape using jk in terminnal mode
map("t", "jk", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
-- map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Jump back and forth in jump list
map("n", "<S-l>", "<C-i>", { desc = "Jump forwards" })
map("n", "<S-h>", "<C-o>", { desc = "Jump backwards" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Better indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP')

-- Resize window using <shift> arrow keys
map("n", "<M-H>", "<cmd>vertical resize +4<CR>")
map("n", "<M-L>", "<cmd>vertical resize -4<CR>")
map("n", "<M-K>", "<cmd>horizontal resize +4<CR>")
map("n", "<M-J>", "<cmd>horizontal resize -4<CR>")

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- Clear search highlight on pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

