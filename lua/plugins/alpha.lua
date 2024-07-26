return {
  'goolord/alpha-nvim',
  lazy = false,
  config = function ()
    local theme = require'alpha.themes.dashboard'
    theme.section.buttons.val = {
      theme.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      theme.button("SPC f f", "  Find file"),
      theme.button("SPC f h", "  Recently opened files"),
      theme.button("SPC f p", "  Recently opened projects"),
      theme.button("SPC f r", "  Frecency/MRU"),
      theme.button("SPC f g", "  Find word"),
      theme.button("SPC f m", "  Jump to bookmarks"),
      theme.button("SPC q l", "  Open last session"),
      theme.button("SPC q s", "  Open last session for directory"),
    }

    require'alpha'.setup(theme.config)
  end
}
