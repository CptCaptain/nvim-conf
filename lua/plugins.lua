local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  -- Base LSP configs
  -- https://github.com/neovim/nvim-lspconfig 
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  
  -- theme
  use 'navarasu/onedark.nvim'

  use {
    'rmagatti/goto-preview',
    config = function ()
      require("goto-preview").setup{
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })

        };
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true; -- Focus the floating window when opening it.
        dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        default_mappings = true, -- enable default keymappings
      }
    end
  }


  -- telescope 
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
  } 

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- view symbols used in file
  use 'simrat39/symbols-outline.nvim'

  -- rust tools, duh
  use 'simrat39/rust-tools.nvim'

  use {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
      }
    end
  }

  -- Markdown support
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
  use 'jghauser/follow-md-links.nvim'

  -- dim unused panes
  use 'sunjon/shade.nvim'

   use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
      }
    end
  }
  --[[ seems busted
  -- zen out to focus
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
      }
    end
  }
  --]]
  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  })
  -- keymap remembrance
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
      }
    end
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- tabline
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- notifications
  use 'rcarriga/nvim-notify'


  -- snippets
  use ({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v1.*",
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })

  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- git
  use 'kdheepak/lazygit.nvim'

  -- quick movement
  use 'ggandor/leap.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)



