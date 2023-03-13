local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
function SAVE_AND_CLOSE_BUFFER()
    vim.cmd(":w!")
    vim.cmd(":BufferClose")
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>qq", ":qall!<CR>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -4<CR>", opts)
keymap("n", "<S-Down>", ":resize +4<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -4<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +4<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bnext<CR>", opts)
keymap("n", "<S-l>", ":bprevious<CR>", opts)

-- Save shorcuts
keymap("n", "<leader>w", ":w!<CR>", opts)
keymap("n", "<leader>wq", ":lua SAVE_AND_CLOSE_BUFFER()<CR>", opts)
keymap("n", "<leader>Q", ":BufferClose!<CR>", opts)


-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", '<', '<<', opts)
keymap("n", '>', '>>', opts)

-- Move text up and down
keymap("v", "p", '"_dP', opts)

-- GitSigns --
keymap('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
keymap('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
keymap('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
keymap('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', opts)
--[[ keymap('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>') ]]
--[[ keymap('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>') ]]
keymap('n', '<leader>hh', '<cmd>Gitsigns preview_hunk<CR>', opts)
keymap('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
keymap('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
keymap('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opts)
--[[ keymap('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>') ]]
--[[ keymap('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>') ]]
keymap("n", "<leader>,", ":nohlsearch<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope --
--[[ keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts) ]]
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
--[[ keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files({search_dirs = {'%:p'}})<cr>", opts) ]]
keymap("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader><tab>", ":NvimTreeToggle<cr>", opts)
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)




-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<leader>bp', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]]
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
keymap("n", "<leader>ff", ":Format<cr>", opts)

-- Debug --
keymap("n", "<leader>d", "<Cmd>DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>e", "<Cmd>DapStepOver<CR>", opts)
keymap("n", "<leader>ds", "<Cmd>DapLoadLaunchJSON<CR>", opts)
keymap("n", "<leader>s", "<Cmd>DapContinue<CR>", opts)
keymap("n", "<leader>ie", "<Cmd>DapStepInto<CR>", opts)

-- Run in Terminal shortcuts --
keymap("n", "<leader>tp", ":Term cmd=python<cr>", opts)
keymap("n", "<leader>tg", ":Term cmd=lazygit<cr>", opts)

