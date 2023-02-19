local wk = require('which-key')
wk.register({
  ["<leader>"] = {
    q = {
      name = "persistence",
      s = { "<cmd>lua require('persistence').load()<cr>" , "restore the session for the current directory" },
      l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "restore the last session" },
      d = { "<cmd>lua require('persistence').stop()<cr>", "stop Persistence => session won't be saved on exit" },
    },
    f = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "find_files" },
      g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
      b = { "<cmd>Telescope buffers<cr>", "buffers" },
      h = { "<cmd>Telescope help_tags<cr>", "help_tags" },
      n = { "<cmd>enew<cr>", "New File" },
    }
  },
})

return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
    }
  end
}
