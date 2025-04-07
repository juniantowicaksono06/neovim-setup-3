-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.codeium_disable_bindings = 1 -- Disable default bindings

-- Shortcut for saving (Ctrl + s)
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

-- Shortcut for quitting (Ctrl + q)
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-q>", "<Esc>:q<CR>", { noremap = true, silent = true })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope File search
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>f", "<cmd>Telescope live_grep<CR>", opts)

map("n", "<leader>[", "<cmd>bprevious<CR>", opts)
map("n", "<leader>]", "<cmd>bnext<CR>", opts)

-- Telescope Git-related commands
map("n", "<C-g>b", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<C-g><C-b>", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<C-g>log", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<C-g>st", "<cmd>Telescope git_status<CR>", opts)
map("n", "<C-g>sh", "<cmd>Telescope git_stash<CR>", opts)

-- Telescope search function or variable
map("n", "<leader>t", "<cmd>Telescope lsp_document_symbols<CR>", opts)

-- Telescope list all buffers
map("n", "<leader>r", "<cmd>Telescope buffers<CR>", opts)

-- Split
map("n", "<leader>h", "<cmd>horizontal split<CR>", opts)
map("n", "<leader>v", "<cmd>vertical split<CR>", opts)

-- Exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", "<Esc>", { noremap = true, silent = true })

-- Custom keybindings
vim.keymap.set("i", "<C-w>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-;>", function()
  return vim.fn
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

-- Word wrap Config
-- Enable word wrap
vim.opt.wrap = true

-- Ensure words are not broken in the middle
vim.opt.linebreak = true

-- Indent wrapped lines for better readability
vim.opt.breakindent = true

-- Optional: Set a visual marker for wrapped lines
vim.opt.showbreak = "↪ "

-- Keybinding to toggle word wrap
vim.keymap.set("n", "<F3>", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  print("Word Wrap: " .. (vim.opt.wrap:get() and "ON" or "OFF"))
end, { desc = "Toggle Word Wrap" })

-- Disable auto formatter
vim.g.autoformat = false

-- Require a Prettier config file for the formatter to be used
-- vim.g.lazyvim_prettier_needs_config = true

-- Make neovim transparent
vim.opt.termguicolors = true
vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd [[ hi NormalNC guibg=NONE ctermbg=NONE ]]

