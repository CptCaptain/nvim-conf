local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
  vim.cmd.wincmd("w")
  require("alpha").start(false)
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
end


vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
return {
    'nvim-tree/nvim-tree.lua',
    cmd = { "NvimTreeOpen" },
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  config = function () 
    require("nvim-tree").setup({
      on_attach = on_attach,
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
    version = 'nightly' -- optional, updated every week. (see issue #1193)
}
