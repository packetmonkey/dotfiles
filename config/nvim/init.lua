local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')

vim.call('plug#', 'christoomey/vim-sort-motion')  -- `gs` Sort objects and motions
vim.call('plug#', 'tpope/vim-commentary')         -- `gc` toggle comment blocks

vim.call('plug#', 'junegunn/vim-easy-align')      -- Fancy alignment

vim.call('plug#', 'tpope/vim-surround')           -- 'Surround' motion
vim.call('plug#', 'easymotion/vim-easymotion')    -- Easy motion

-- Fuzzy finding magic
vim.call('plug#', 'junegunn/fzf')                 -- Ensure fzf is installed and latest
vim.call('plug#', 'junegunn/fzf.vim')             -- Integrate fzf with nvim

vim.call('plug#', 'neovim/nvim-lspconfig')        -- Quickstart configurations for the Nvim LSP client

-- "" Auto complete LSP Magic
-- vim.call('plug#', 'Shougo/deoplete.nvim', {['do'] = ':UpdateRemotePlugins'}) -- " async completion framework
-- vim.call('plug#', 'Shougo/deoplete-lsp')
-- vim.g['deoplete#enable_at_startup'] = 1

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Text Objects
vim.call('plug#', 'kana/vim-textobj-user')        -- Custom text object support
vim.call('plug#', 'rhysd/vim-textobj-ruby')       -- Ruby block text objects

-- Syntaxes
vim.call('plug#', 'rust-lang/rust.vim')           -- Rust
vim.g.rustfmt_autosave = 1                        -- Format on save

vim.call('plug#', 'tpope/vim-endwise')            -- Auto-insert `end` in ruby

vim.call('plug#', 'hashivim/vim-terraform')       -- Terraform
vim.g.terraform_fmt_on_save = 1                   -- Format on save

-- Color Schemes
vim.call('plug#', 'jacoborus/tender')             -- Tender
vim.call('plug#', 'AlexvZyl/nordic.nvim')         -- Nordic
vim.call('plug#', 'dracula/vim')                  -- Dracula
Plug('mhartington/oceanic-next')
Plug 'loctvl842/monokai-pro.nvim'

vim.call('plug#end')

-- Below v0.8.0 neovim can't handle group names with @ or . in them which
-- is used by some themes, so for default themes that use this group syntax
-- we need a fallback so on debian stable systems we don't see a wall of errors
-- on every launch
if vim.fn.has("nvim-0.8.0") == 1 then
  vim.cmd('colorscheme monokai-pro-spectrum')
else
  vim.cmd('colorscheme torte')
end

vim.cmd('highlight Comment cterm=italic gui=bolditalic guifg=#7f8ba4')
vim.cmd('filetype plugin on')

vim.opt.autoindent     = true                     -- Maintain indentation
vim.opt.backspace      = "indent,eol,start"       -- Backspace though everything in insert mode
vim.opt.backup         = false                    -- Create backup files
vim.opt.colorcolumn    = "80"                     -- Mark 80th column
vim.opt.cursorline     = true                     -- Highlight our current line
vim.opt.expandtab      = true                     -- Use spaces, not tabs
vim.opt.foldenable     = false                    -- No folds by default
vim.opt.hlsearch       = true                     -- Highlight search matches
vim.opt.incsearch      = true                     -- Incremental searching
vim.opt.laststatus     = 2                        -- Always show the status line
vim.opt.lazyredraw     = true                     -- Redraw only when we need to
vim.opt.number         = true                     -- Show what line we are on
vim.opt.path:append('spec,test')                  -- Include spec and test directories when searching
vim.opt.relativenumber = true                     -- Use relative line numbers
vim.opt.ruler          = true                     -- Show cursor position
vim.opt.scrolloff      = 3                        -- Always show 3 lines of context
vim.opt.shiftwidth     = 2                        -- A tab is two spaces
vim.opt.showcmd        = true                     -- Display incomplete commands
vim.opt.showmatch      = true                     -- Highlight matching [{()}]
vim.opt.smartcase      = true                     -- Searches are case insensitive unless there is a capital letter
vim.opt.smartindent    = true                     -- Smartly increase indentation
vim.opt.softtabstop    = 2                        -- Backspace 2 spaces at a time
vim.opt.spell          = true                     -- Enable spell checking
vim.opt.tabstop        = 2                        -- A tab is two spaces
vim.opt.wildmenu       = true                     -- Visual autocomplete for command menu
vim.opt.wrap           = false                    -- Don't wrap lines
vim.opt.writebackup    = true                     -- Backup before overwriting a file

-- Mappings
vim.g.mapleader = " "                                                                     -- Use space for the leader key
vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', {})                               -- Find files
vim.api.nvim_set_keymap('n', '<Leader>g', ':Rg<CR>', {})                                  -- Grep files
vim.api.nvim_set_keymap('n', '<Leader>p', ':set paste<CR><esc>"*]p:set nopaste<cr>', {})  -- Paste from clipgoard
vim.api.nvim_set_keymap('n', '<Leader>q', ':quit<cr>', {})                                -- easy quit
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<cr>', {})                               -- easy write
vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<cr>', {})                                 -- easy write quit

vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- These need to be defined after the above map leader

-- LSP Clients
require'lspconfig'.rust_analyzer.setup{}          -- Rust

vim.opt.signcolumn = "yes" -- otherwise it bounces in and out, not strictly needed
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }), -- not needed but good practice
  callback = function()
    vim.lsp.start {
      name = "standard",
      cmd = { "bundle", "exec", "standardrb", "--lsp" },
    }
  end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.yaml.j2", "*.yml.j2"},
  command = "set filetype=yaml"
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "yaml", "markdown_inline", "ruby", "bash"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
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
    --   local max_filesize = 100 * 1024 -- 100 KB
    --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then
    --     return true
    --   end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
