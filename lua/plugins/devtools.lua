vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

return {
  {
    'gelguy/wilder.nvim',
    event = { "CmdlineEnter" },
    dependencies = {
      'roxma/nvim-yarp',
      'roxma/vim-hug-neovim-rpc',
      'romgrk/fzy-lua-native',
    },
    config = function ()
      local wilder = require('wilder')
      wilder.setup({modes = {':', '/', '?'}})
      -- Disable Python remote plugin
      wilder.set_option('use_python_remote_plugin', 0)

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          wilder.vim_search_pipeline()
        )
      })

      wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.popupmenu_renderer({
          highlighter = wilder.lua_fzy_highlighter(),
          left = {
            ' ',
            wilder.popupmenu_devicons()
          },
          right = {
            ' ',
            wilder.popupmenu_scrollbar()
          },
        }),
        ['/'] = wilder.wildmenu_renderer({
          highlighter = wilder.lua_fzy_highlighter(),
        }),
      }))
    end
  },
  -- view symbols used in file
  {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  opts = {
    -- Your setup opts here
  },
},
  {
    'mbbill/undotree',
    event = { "BufReadPost" },
  },
  -- Statusline component that shows current code context
  {
    "SmiteshP/nvim-navic",
    config = function ()
      local navic = require("nvim-navic")
      require("lspconfig").clangd.setup {
        on_attach = function(client, bufnr)
          navic.attach(client, bufnr)
        end
      }
    end
  },
  -- git signs
  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require("gitsigns").setup()
    end
  },
  -- package management for LSP et al.
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  -- rust tools, duh
  {
    'simrat39/rust-tools.nvim',
    lazy = true,
    ft = 'rust',
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = { "IncRename" },
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "TroubleToggle" },
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end
  },
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local ls = require("luasnip")
      local has_words_before = function ()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      return {
        completion = {
          completeopt = "menu,menuone,noinsert,noselect,preview",
        },
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif ls.expand_or_locally_jumpable() then
              ls.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_prev_item()
              elseif ls.jumpable(-1) then
              ls.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  --- automatically activate poetry env
}
