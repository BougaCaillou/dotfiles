-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ "n", "v" }, ";", ":")

-- Move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Center page while scrolling or searching
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without touching nvim clipboard
vim.keymap.set("x", "<leader>p", '"_dP')
-- Delete without touching nvim clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y') -- yanks the current line

-- Nope
vim.keymap.set("n", "Q", "<nop>")

-- Close everything
vim.keymap.set("n", "<leader>Q", ":qa<CR>", { desc = "Close all" })

-- Substitute current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fold current block
vim.keymap.set("n", "<leader>fb", "$zf%")

-- Indent line in normal and visual mode
vim.keymap.set("n", "<S-h>", "<<")
vim.keymap.set("n", "<S-l>", ">>")
vim.keymap.set("v", "<S-h>", "<gv")
vim.keymap.set("v", "<S-l>", ">gv")

-- Expand a one line javascript block into a multi line block
vim.keymap.set("n", "<leader>im", 'f}<Left>i,<Esc>F{ciB<CR><C-r>"<BS><CR><Esc>=<Up>:s/, /,\\r/g<CR>=iB')
