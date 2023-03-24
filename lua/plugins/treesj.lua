return {
  'Wansmer/treesj',
  cmd = { "TSJToggle" },
  -- keys = { '<leader>m' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
