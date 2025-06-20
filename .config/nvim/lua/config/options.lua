vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.snacks_animate = false
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "nvim-cmp"
vim.g.ai_cmp = false

vim.opt.autoindent = true -- Maintain indentation
vim.opt.backspace = "indent,eol,start" -- Backspace though everything in insert mode
vim.opt.backup = false -- Don't create backup files
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.colorcolumn = "80" -- Mark 80th column
vim.opt.cursorline = true -- Highlight our current line
vim.opt.expandtab = true -- Use spaces, not tabs
vim.opt.foldenable = false -- No folds by default
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.incsearch = true -- Incremental searching
vim.opt.laststatus = 2 -- Always show the status line
-- vim.opt.lazyredraw     = true                     -- Redraw only when we need to
vim.opt.number = true -- Show what line we are on
-- vim.opt.path:append('spec,test')                  -- Include spec and test directories when searching
vim.opt.relativenumber = true -- Use relative line numbers
vim.opt.ruler = true -- Show cursor position
vim.opt.scrolloff = 3 -- Always show 3 lines of context
vim.opt.shiftwidth = 2 -- A tab is two spaces
vim.opt.showcmd = true -- Display incomplete commands
vim.opt.showmatch = true -- Highlight matching [{()}]
vim.opt.smartcase = true -- Searches are case insensitive unless there is a capital letter
vim.opt.swapfile = false -- Don't create swapfiles
vim.opt.smartindent = true -- Smartly increase indentation
vim.opt.softtabstop = 2 -- Backspace 2 spaces at a time
vim.opt.spell = true -- Enable spell checking
vim.opt.tabstop = 2 -- A tab is two spaces
vim.opt.termguicolors = true -- Enable 24 bit colors
vim.opt.undofile = true -- Use undo files
vim.opt.wildmenu = true -- Visual autocomplete for command menu
vim.opt.wrap = false -- Don't wrap lines
-- vim.opt.writebackup    = true                     -- Backup before overwriting a file
