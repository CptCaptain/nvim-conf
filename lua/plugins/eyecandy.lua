-- dim unused panes
-- Sadly breaks when closing help windows...
-- use 'sunjon/shade.nvim'

return {
  -- notifications
  'rcarriga/nvim-notify',
  -- theme
  {
  'navarasu/onedark.nvim',
    priority = 1000,
  },
  -- focus on cursor region, darken everything else
  { "folke/twilight.nvim", cmd = { "Twilight" } },
  "Pocco81/true-zen.nvim",
  -- icons
  "nvim-tree/nvim-web-devicons",
}

