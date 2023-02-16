-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


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

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

--Sets how many lines of history VIM has to remember
vim.opt.history=500

--Set to auto read when a file is changed from the outside
vim.opt.autoread = true
-- TODO figure out how this works or sth
-- vim.opt.au=FocusGained,BufEnter * checktime

--Always show current position
vim.opt.ruler = true

--Ignore case when searching
vim.opt.ignorecase = true

--When searching try to be smart about cases
vim.opt.smartcase = true

--Highlight search results
vim.opt.hlsearch = true

--Makes search act like search in modern browsers
vim.opt.incsearch = true

--Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

--For regular expressions turn magic on
vim.opt.magic = true

--Show matching brackets when text indicator is over them
vim.opt.showmatch = true

--Use spaces instead of tabs
vim.opt.expandtab = true

--Be smart when using tabs ;)
vim.opt.smarttab = true


-- empty setup using defaults
require("nvim-tree").setup()
require("telescope").setup{
    defaults = {
    -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    -- grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    -- qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
}
require("_telescope") -- local telescope settings
require("lspconfig").pyright.setup{}
require("onedark").setup{
  style = "warmer",
}
require("onedark").load()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "python", "rust", "c", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
        -- local max_filesize = 100 * 1024 -- 100 KB
        -- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        -- if ok and stats and stats.size > max_filesize then
            -- return true
        -- end
    -- end,


    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}
