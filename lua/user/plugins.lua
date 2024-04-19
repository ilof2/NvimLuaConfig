local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)


  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use "windwp/nvim-autopairs"
  use "akinsho/toggleterm.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"  -- The completion pluggin
  use "hrsh7th/cmp-path"  -- path completions
  use "hrsh7th/cmp-buffer"  -- buffer completions
  use "hrsh7th/cmp-cmdline"  -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"  -- snnipet completions
  use "hrsh7th/cmp-nvim-lsp"  -- Autopairs
  use "numToStr/Comment.nvim"  -- Easily comment stuff
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    }
  }

  -- Telescope
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  -- TreeSitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use "lewis6991/gitsigns.nvim"

  -- colorschemes
  use "lunarvim/colorschemes"
  use "sainnhe/everforest"
  use { "ellisonleao/gruvbox.nvim" }

  -- Python
  use { "nvim-neotest/nvim-nio" }
  use "jmcantrell/vim-virtualenv"
  use 'integralist/vim-mypy'
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use "ravenxrz/DAPInstall.nvim"
--  use "cossonleo/neo-smooth-scroll.nvim"

  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end

end)

