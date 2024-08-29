-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope (fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  -- Dir telescope (telescope for search in dir)
  use {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Treesitter context (show context of the cursor, like VS Code "sticky" context)
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup()
    end
  }

  -- Treesitter rainbow (colorize brackets and stuff)
  use { 'HiPhish/rainbow-delimiters.nvim' }

  -- NvimTree
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-tree/nvim-web-devicons' }

  -- Undo tree
  use { 'mbbill/undotree' }

  -- Mason (managing lsp servers)
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        registries = {
          -- 'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        }
      })
    end,
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  -- Mason lsp config
  use {
    'williamboman/mason-lspconfig.nvim',
  }

  -- LSP config with dependencies
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v1.*",
        run = "make install_jsregexp"
      },
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          require "lsp_signature".on_attach()
        end
      }
    }
  }

  -- Autoclose backets and stuff...
  use { 'm4xshen/autoclose.nvim' }

  -- Code action menu (better than lsp's one)
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  -- Copilot the bro
  use { 'github/copilot.vim' }

  -- Which key
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require('which-key').setup {}
    end
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Comment
  use { 'tpope/vim-commentary' }

  -- Indent lines
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Colorizer
  use { 'norcalli/nvim-colorizer.lua' }

  -- Window swapper
  use { 'xorid/swap-split.nvim' }

  -- Neogit
  use { 'NeogitOrg/neogit' }

  -- Spectre, search and replace plugin powered with regex
  use { 'nvim-pack/nvim-spectre' }

  -- Transparent background utility
  use { 'xiyaowong/nvim-transparent' }

  -- Diffview plugin for neogit (does not work)
  use { 'sindrets/diffview.nvim' }

  -- TMUX navigator
  use {
    'alexghergh/nvim-tmux-navigation',
    as = 'nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup{}
    end
  }

  -- NVIM java
  -- use {
  --   'nvim-java/nvim-java',
  --   requires = {
  --     'nvim-java/lua-async-await',
  --     'nvim-java/nvim-java-core',
  --     'nvim-java/nvim-java-test',
  --     'nvim-java/nvim-java-dap',
  --     'nvim-java/nvim-java-refactor',
  --     'MunifTanjim/nui.nvim',
  --     'neovim/nvim-lspconfig',
  --     'mfussenegger/nvim-dap',
  --     config = function()
  --       require('java').setup()
  --     end
  --   }
  -- }

  -- Git blame
  use { 'f-person/git-blame.nvim' }

  -- nvim dap vscode
  use {
    'mxsdev/nvim-dap-vscode-js',
    requires = {
      'mfussenegger/nvim-dap',
    }
  }

  -- vscode js debug
  use {
    'microsoft/vscode-js-debug',
    opt = true,
    run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
  }

  -- ALL COLORSCHEMES --

  use { 'sainnhe/sonokai', as = 'sonokai' }

  use { 'ellisonleao/gruvbox.nvim' }

  use { 'EdenEast/nightfox.nvim' }

  use { 'folke/tokyonight.nvim' }

  use { 'Shatur/neovim-ayu' }

  use { "catppuccin/nvim", as = "catppuccin" }
end)
