local wk = require('which-key')
wk.register({
  ["<leader>"] = {
    -- copy and paste to system clipboard
    y = { "\"+y", "Yank to clipboard", mode = { "n", "v" } },
    p = { "\"+p", "Paste from clipboard", mode = { "n", "v" } },
    u = { "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", "Toggle Undotree" },
    s = { "<cmd>SymbolsOutline<cr>", "Toggle Symbols"},
    o = {"<cmd>Portal jumplist backward<cr>", "Portal backward" },
    i = { "<cmd>Portal jumplist forward<cr>", "Portal forward" },
    m = { "<cmd>TSJToggle<cr>", "Toggle Splitline", mode = { "n", "v" } },
  ["<leader>"] = {
      s = { "<cmd>source ~/.config/nvim/snippets/snips.lua <cr>", "Source LuaSnips" },
    },
    n = {
      name = "Tree",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree" },
      f = { "<cmd>NvimTreeFindFile<cr>", "Find current file" },
    },
    q = {
      name = "Persistence",
      s = { "<cmd>lua require('persistence').load()<cr>" , "restore the session for the current directory" },
      l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "restore the last session" },
      d = { "<cmd>lua require('persistence').stop()<cr>", "stop Persistence => session won't be saved on exit" },
    },
    f = {
      name = "Telescope",
      b = { "<cmd>Telescope buffers<cr>", "buffers" },
      f = { "<cmd>Telescope find_files<cr>", "find_files" },
      g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
      h = { "<cmd>Telescope help_tags<cr>", "help_tags" },
      m = { "<cmd>Telescope marks<cr>", "marks" },
      n = { "<cmd>enew<cr>", "New File" },
      r = { "<cmd>Telescope oldfiles<cr>", "MRU" },
      p = { "<cmd>Telescope projects<cr>", "Recent Projects" },
    },
    d = {
      name = "Debug",
      t = {
        name = "Test",
        r = { "<cmd>lua require('dap-python').test_method()<cr>", "Run Test" },
        m = { "<cmd>lua require('dap-python').test_method()<cr>", "Test method" },
      },
      h = {
        name = "Hover",
        h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
        v = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Visual Hover" },
      },
      u = {
        name = "UI",
        h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
        f = { "local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", "Float" },
        p = { "<cmd>lua require('dap.ui.widgets').preview()<cr>", "Preview" },
        t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
      },
      r = {
        name = "Repl",
        o = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle" },
        l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
      },
      b = {
        name = "Breakpoints",
        c = {
          "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
          "Breakpoint Condition",
        },
        m = {
          "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
          "Log Point Message",
        },
      },
      c = { "<cmd>lua require('dap').scopes()<CR>", "Scopes" },
      i = { "<cmd>lua require('dap').toggle()<CR>", "Toggle" },
    },
  },
  ["<c-k>"] = {
    function ()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end,
    "Expand Snippet",
    mode = { "i", "s" },
  },
  -- more debug hot keys
  ["<F5>"] = {
    "<cmd>lua require('dap').continue()<cr>", "Continue"
  },
  ["<F10>"] = {
    "<cmd>lua require('dap').step_over()<cr>", "Step over"
  },
  ["<F11>"] = {
    "<cmd>lua require('dap').step_into()<cr>", "Step into"
  },
  ["<F12>"] = {
    "<cmd>lua require('dap').step_out()<cr>", "Step out"
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
