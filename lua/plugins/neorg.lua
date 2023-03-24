return {
  "nvim-neorg/neorg",
  event = { "VeryLazy" },
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {
      }, -- Loads default behaviour
      ["core.norg.concealer"] = {
        config = {
          folds=false,
        },
      }, -- Adds pretty icons to your documents
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/neorg/notes",
            main = "~/neorg/main",
            work = "~/neorg/work",
          },
          default_workspace = "main",
        },
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}

