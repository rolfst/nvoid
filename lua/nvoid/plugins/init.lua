local present, packer = pcall(require, "nvoid.plugins.packerInit")

local ok, user_plugins = pcall(require, 'custom.nvoidrc')
if not ok then
  user_plugins = {
    add = {},
  }
end

if not vim.tbl_islist(user_plugins.plugins.add) then
  user_plugins.plugins.add = {}
end

if not present then
   return false
end

local use = packer.use

return packer.startup(function()
-- Packer
   use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

-- Plenary
   use { "nvim-lua/plenary.nvim" }

-- Onedarker
   use { "Lunarvim/Onedarker" }

-- Nord
   use { "arcticicestudio/nord-vim" }

-- Tokyonight
   use { "folke/tokyonight.nvim" }

-- Doom One
   use { "NTBBloodbath/doom-one.nvim" }

-- Dracual
   use { "dracula/vim" }

-- Gruvbox
   use { "morhetz/gruvbox" }

-- Dark Plus
   use { "LunarVim/darkplus.nvim" }

-- Icons
   use {
    "kyazdani42/nvim-web-devicons",
    config = function ()
      require('nvoid.plugins.config.icons-config')
    end
  }

-- Feline
   use {
    "nvim-lualine/lualine.nvim",
    config = function ()
        require('nvoid.plugins.config.lualine')
    end
  }

-- Bufferline
   use {
    "akinsho/bufferline.nvim",
    config = function ()
      require('nvoid.plugins.config.bufferline')
    end
  }

-- Buffer Close
   use { "Asheq/close-buffers.vim" }

-- Indent Line
   use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require('nvoid.plugins.config.indentline')
    end
  }

-- Colorizer
   use {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require('nvoid.plugins.config.other').colorizer()
    end
  }

-- Git Sign
   use {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require('nvoid.plugins.config.other').git()
    end
  }

-- Tree Sitter
   use {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('nvoid.plugins.config.treesitter')
    end
  }

-- LSP
   use {
    "neovim/nvim-lspconfig",
    config = function ()
      require('nvoid.plugins.config.lsp')
    end
  }

-- Matchup
   use { "andymass/vim-matchup" }

-- Better Escape
   use {
      "max397574/better-escape.nvim",
      config = function ()
        require('nvoid.plugins.config.other').better()
      end
   }

-- LSP Install
   use { "williamboman/nvim-lsp-installer" }

-- CMP
   use {
    "hrsh7th/nvim-cmp",
    config = function ()
      require('nvoid.plugins.config.cmp')
    end
  }

-- LuaSnip
   use { "L3MON4D3/LuaSnip" }

-- CMP Extensions
   use { "saadparwaiz1/cmp_luasnip" }
   use { "hrsh7th/cmp-nvim-lua" }
   use { "hrsh7th/cmp-nvim-lsp" }
   use { "hrsh7th/cmp-buffer" }
   use { "hrsh7th/cmp-path" }

-- Auto Pairs
   use {
    "windwp/nvim-autopairs",
    config = function ()
      require('nvoid.plugins.config.other').autopairs()
    end
  }

-- Alpha
   use {
     'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
          require('nvoid.plugins.config.alpha')
      end
   }

-- Comment
   use {
    "winston0410/commented.nvim",
    config = function ()
      require('nvoid.plugins.config.other').commented()
    end
  }

-- Nvim Tree
   use {
    "kyazdani42/nvim-tree.lua",
    config = function ()
      require('nvoid.plugins.config.nvimtree')
    end
  }

-- Telescope
   use {
    "nvim-telescope/telescope.nvim",
    config = function ()
      require('nvoid.plugins.config.telescope')
    end
  }

-- Telescope File browser
   use { "nvim-telescope/telescope-file-browser.nvim" }

-- Term
   use {
    "akinsho/toggleterm.nvim",
    config = function ()
      require('nvoid.plugins.config.term')
    end
  }

-- Which Key
   use {
    "folke/which-key.nvim",
    config = function ()
      require('nvoid.plugins.config.which-key')
    end
  }

-- Trouble
   use {
    "folke/trouble.nvim",
    config = function ()
      require('nvoid.plugins.config.trouble')
    end
  }

-- Notify
use {
    "rcarriga/nvim-notify",
    config = function ()
      require('nvoid.plugins.config.other').notify()
    end
  }

----------------
  if user_plugins.plugins.add and not vim.tbl_isempty(user_plugins.plugins.add) then
    for _, plugin in pairs(user_plugins.plugins.add) do
      use(plugin)
    end
  end
end)
