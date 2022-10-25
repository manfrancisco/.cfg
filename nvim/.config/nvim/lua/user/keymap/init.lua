local map = function(m, k, v)
    vim.api.nvim_set_keymap(m, k, v, { noremap = true, silent = true })
end
-- Map terminal mode
local tmap = function(k, v)
    vim.api.nvim_set_keymap('t', k, v, { silent = true })
end
-- Map normal mode
local nmap = function(k, v) map('n', k, v) end
-- Map insert mode
local imap = function(k, v) map('i', k, v) end
-- Map visual mode
local vmap = function(k, v) map('v', k, v) end
-- Map visual block mode
local xmap = function(k, v) map('x', k, v) end
-- Map command mode
local cmap = function(k, v) map('c', k, v) end

-- Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Normal --
-- Paste from system clipboard
nmap("<C-v>", '"+p')

-- Join lines
nmap("<leader>j", "<S-j>")

-- Add newlines without entering insert mode
-- TODO: Find a way to do this without breaking the quickfix menu
-- nmap("<CR>", "o<ESC>k")
-- Note: mapping Shift+Return requires special treatment in most terminals. See https://stackoverflow.com/a/42461580/1291990
nmap("<S-CR>", "O<ESC>j")

-- Undo
nmap("R", "<C-r>")

-- Nvim-tree
nmap("<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
nmap("<leader>ff", ":Telescope find_files<CR>")
nmap("<leader>ft", ":Telescope live_grep<CR>")
nmap("<leader>fp", ":Telescope projects<CR>")
nmap("<leader>fb", ":Telescope buffers<CR>")

-- LSP
nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>rs", ":LspRestart<CR>")
nmap("<leader>rk", ":LspStop<CR>")

-- Rust
-- Save and run `cargo fmt`
nmap("<leader>rf", ":w<CR>:!cargo fmt<CR>")

-- Unhighlight search results
nmap("<leader>n", ":nohlsearch<CR>")

-- Write
nmap("<leader>w", ":w<CR>")

-- Quit
nmap("<leader>q", ":confirm q<CR>")
nmap("<leader>Q", ":confirm qall<CR>")

-- Close the quickfix menu
nmap("<leader>v", ":ccl<CR>")

-- Open window below
nmap("<leader>W", "<C-w>s")

-- Better window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Close a buffer without closing the window
-- Goes back one buffer, splits that buffer, goes forward (to the original buffer) and closes it, leaving you with the previous buffer open.
nmap("<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- Move lines up and down
nmap("<S-j>", ":m+1<CR>==")
nmap("<S-k>", ":m-2<CR>==")
vmap("<S-j>", ":m '>+1<CR>gv=gv")
vmap("<S-k>", ":m '<-2<CR>gv=gv")

-- Resize with arrows
nmap("<C-Up>", ":resize -2<CR>")
nmap("<C-Down>", ":resize +2<CR>")
nmap("<C-Left>", ":vertical resize -2<CR>")
nmap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
nmap("<S-l>", ":bnext<CR>")
nmap("<S-h>", ":bprevious<CR>")

-- Insert --
-- Paste in insert mode
imap("<C-v>", '<ESC>"+p<ESC>')

-- Press jk fast to exit insert mode 
imap("jk", "<ESC>")
imap("kj", "<ESC>")

-- Start new line and jump down to it
imap("<S-CR>", "<ESC>o");

-- Visual --
-- Copy and paste in visual mode
vmap("<C-c>", '"+y')
vmap("<C-v>", '"+p')

-- Press j and k together to exit visual mode
vmap("jk", "<ESC>")
vmap("kj", "<ESC>")

-- Stay in visual mode after indent
vmap("<", "<gv")
vmap(">", ">gv")

-- Move text up and down
-- vmap("<A-j>", ":m .+1<CR>==")
-- vmap("<A-k>", ":m .-2<CR>==")
-- vmap("p", '"_dP')

-- Visual Block --
-- Move text up and down
-- xmap("J", ":move '>+1<CR>gv-gv")
-- xmap("K", ":move '<-2<CR>gv-gv")
-- xmap("<A-j>", ":move '>+1<CR>gv-gv")
-- xmap("<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
-- tmap("<C-h>", "<C-\\><C-N><C-w>h")
-- tmap("<C-j>", "<C-\\><C-N><C-w>j")
-- tmap("<C-k>", "<C-\\><C-N><C-w>k")
-- tmap("<C-l>", "<C-\\><C-N><C-w>l")

