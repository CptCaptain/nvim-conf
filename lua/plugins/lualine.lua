-- status line
return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = function ()
    require("lualine").setup()
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    }
  end,
}
