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
    require "user.barbar"
    require "user.toggleterm"
    require "user.dap"
    require "user.dap-ui"

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
require "user.barbar"
require "user.toggleterm"
require "user.dap"
require "user.dap-ui"


vim.cmd "colorscheme everforest"

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
end
