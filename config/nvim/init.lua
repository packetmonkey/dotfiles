local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('christoomey/vim-sort-motion')                             -- `gs` Sort objects and motions
Plug('tpope/vim-commentary')                                    -- `gc` toggle comment blocks
Plug('junegunn/vim-easy-align')                                 -- Fancy alignment
Plug('tpope/vim-surround')                                      -- 'Surround' motion
Plug('easymotion/vim-easymotion')                               -- Easy motion
Plug('ibhagwan/fzf-lua')                                        -- Integrate fzf with nvim using lua
Plug('nvim-tree/nvim-web-devicons')                             -- Integrated with fzf-lua for fancy icons
Plug('neovim/nvim-lspconfig')                                   -- Quick start configurations for the Nvim LSP client
Plug('L3MON4D3/LuaSnip', {['do'] = 'make install_jsregexp'})    -- Snippet engine for auto completing LSP snippets in nvim-cmp
Plug('hrsh7th/cmp-nvim-lsp')                                    -- Allow nvim-cmp to autocomplete from LSP
Plug('hrsh7th/cmp-path')                                        -- Allow nvim-cmp to autocomplete file paths
Plug('hrsh7th/cmp-cmdline')                                     -- Allow nvim-cmp to autocomplete VIM commands
Plug('hrsh7th/nvim-cmp')                                        -- Fancy autocomplete, Must be after lsp, and other cmp-* plugins
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- Fancy syntax parsing and highlighting
Plug('nvim-lua/plenary.nvim')                                   -- Healper methods, Dependency of epwalsh/obsidian.nvim
Plug('epwalsh/obsidian.nvim')                                   -- Obsidian.md integration

-- Text Objects
Plug('kana/vim-textobj-user')        -- Custom text object support
Plug('rhysd/vim-textobj-ruby')       -- Ruby block text objects

-- Syntaxes
Plug('rust-lang/rust.vim')           -- Rust
Plug('tpope/vim-endwise')            -- Auto-insert `end` in ruby
Plug('hashivim/vim-terraform')       -- Terraform

-- Color Schemes
Plug('jacoborus/tender')             -- Tender
Plug('AlexvZyl/nordic.nvim')         -- Nordic
Plug('dracula/vim')                  -- Dracula
Plug('mhartington/oceanic-next')
Plug('loctvl842/monokai-pro.nvim')

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

vim.cmd('filetype plugin on')
vim.cmd('highlight Comment cterm=italic gui=bolditalic guifg=#7f8ba4')

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
vim.api.nvim_set_keymap('n', '<Leader>f', ':FzfLua files<CR>', {})                        -- Find files
vim.api.nvim_set_keymap('n', '<Leader>g', ':FzfLua live_grep<CR>', {})                    -- Grep files
vim.api.nvim_set_keymap('n', 'ga',        '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', '<Leader>p', ':set paste<CR><esc>"*]p:set nopaste<cr>', {})  -- Paste from clipgoard
vim.api.nvim_set_keymap('n', '<Leader>q', ':quit<cr>', {})                                -- easy quit
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<cr>', {})                               -- easy write
vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<cr>', {})                                 -- easy write quit

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "yaml", "markdown", "markdown_inline", "ruby", "bash", "gitcommit"},

  sync_install = false, -- Install parsers asynchronously
  auto_install = true,  -- Install missing parsers when entering buffer

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
    },
    {
      { name = 'buffer' },
    }
  )
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {
      { name = 'path' }
    },
    {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    }
  )
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities
}

vim.opt.signcolumn = "yes" -- otherwise it bounces in and out, not strictly needed
require('lspconfig')['standardrb'].setup {
  capabilities = capabilities,
  cmd = { "bundle", "exec", "standardrb", "--lsp" },
}
