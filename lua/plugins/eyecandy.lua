-- dim unused panes
-- Sadly breaks when closing help windows...
-- use 'sunjon/shade.nvim'

return {
  -- notifications
  'rcarriga/nvim-notify',
  {
  'JellyApple102/easyread.nvim',
    lazy = false,
    config = function ()
      require("easyread").setup({})
    end,
  },
  -- theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require 'kanagawa'.load('wave')
    end,
  },
  -- focus on cursor region, darken everything else
  { "folke/twilight.nvim", cmd = { "Twilight" } },
  "Pocco81/true-zen.nvim",
  -- icons
  "nvim-tree/nvim-web-devicons",
}

