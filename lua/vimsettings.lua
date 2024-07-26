vim.opt.shiftwidth = 2
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

--Sets how many lines of history VIM has to remember
vim.opt.history = 500

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

-- smartly indent
vim.opt.autoindent = true
vim.opt.smartindent = true


vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

vim.opt.scrolloff = 5

vim.opt.splitright = true

