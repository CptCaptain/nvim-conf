local ls = require("luasnip")

require('which-key').register({
  ["<c-k>"] = {
    function ()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end,
    "Expand Snippet",
    mode = { "i", "s" },
  }
})

require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
