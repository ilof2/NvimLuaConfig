if vim.g.vscode then
    -- VSCode extension
    require "user.options"
    require "user.keymaps"
    require "user.plugins"
    require "user.cmp"
    require "user.lsp"
    require "user.telescope"
    require "user.treesitter"
    require "user.autopairs"
    require "user.comment"
    require "user.gitsigns"
    require "user.nvim-tree"
    require "user.lualine"
    require "user.toggleterm"
    require "user.dap"
    require "user.dap-ui"
    require "user.harpoon"

else
    -- ordinary Neovim
require "user.options"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.keymaps"
require "user.colorscheme"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.dap"
require "user.dap-ui"
require "user.harpoon"
require "user.lsp"


-- vim.cmd "colorscheme everforest"
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
end
