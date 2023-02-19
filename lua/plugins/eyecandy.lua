-- dim unused panes
-- Sadly breaks when closing help windows...
-- use 'sunjon/shade.nvim'

return {
  -- notifications
  'rcarriga/nvim-notify',
  -- theme
  {
  'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end,
  },
  -- focus on cursor region, darken everything else
  { "folke/twilight.nvim", cmd = { "Twilight" } },
  "Pocco81/true-zen.nvim",
  -- icons
  "nvim-tree/nvim-web-devicons",
}

