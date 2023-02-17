-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")

-- automatically source plugins on change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require("vimsettings")

require("nvim-tree").setup()
require("telescope").setup{ }
require("_telescope") -- local telescope settings

require("lspconfig").pyright.setup{}
require("symbols-outline").setup()

require('leap').add_default_mappings()

require("onedark").setup{
  style = "warmer",
}
require("onedark").load()
require("fidget").setup()
require'lualine'.setup()
require'bufferline'.setup()
require('shade').setup()


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "python", "rust", "c", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
   additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

vim.notify = require("notify")


require('dap-python').setup()

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
