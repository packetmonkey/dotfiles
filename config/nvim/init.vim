call plug#begin()
"" call plug#begin(stdpath('data') . '/plugged')

Plug 'christoomey/vim-sort-motion' " `gs` Sort objects and motions
Plug 'tpope/vim-commentary'        " `gc` toggle comment blocks
Plug 'junegunn/vim-easy-align'     " Fancy alignment
Plug 'tpope/vim-endwise'           " Auto-insert `end` in ruby
Plug 'tpope/vim-surround'          " 'Surround' motion
Plug 'tpope/vim-fugitive'          " Git functions (statusline branch)
Plug 'easymotion/vim-easymotion'   " Easy motion

" Fuzzy finding magic
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Ensure fzf is installed and latest
Plug 'junegunn/fzf.vim'                             " Integrate fzf with nvim

"" Auto complete LSP Magic
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " async completion framework
Plug 'neovim/nvim-lspconfig'                                  " Quickstart configurations for the Nvim LSP client
Plug 'Shougo/deoplete-lsp'                                    " async completion framework

"Plug 'w0rp/ale'
"" call minpac#add('ervandew/supertab')                " Tab completion
"Plug 'itchyny/lightline.vim'              " Fancy status line
"Plug 'maximbaz/lightline-ale'



"" Text Objects
Plug 'kana/vim-textobj-user'            " Custom text object support
Plug 'rhysd/vim-textobj-ruby'           " Ruby block text objects

"" Syntaxes
Plug 'rust-lang/rust.vim'                             " Rust
Plug 'plasticboy/vim-markdown'                        " Markdown
Plug 'hashivim/vim-terraform'                         " Terraform
Plug 'cespare/vim-toml'                               " TOML

"" Color Schemes
Plug 'jacoborus/tender'

call plug#end()

syntax on                              " Enable syntax highlighting
colorscheme tender
highlight Comment cterm=italic

filetype plugin on

set autoindent                         " Maintain indentation
set backspace=indent,eol,start         " Backspae though everything in insert mode
set backup                             " Create backup files
set backupdir=~/.local/share/nvim/backup " Place backup files here
set colorcolumn=80                     " Mark 80th column
set cursorline                         " Highlight our current line
set expandtab                          " Use spaces, not tabs
set nofoldenable                       " No folds by default
set hlsearch                           " Highlight search matches
set incsearch                          " Incremental searching
set laststatus=2                       " Always show the status line
set lazyredraw                         " Redraw only when we need to
set noshowmode                         " Redundant to lightline
set nowrap                             " Don't wrap lines
set number                             " Show what line we are on
set path+=spec,test                    " Include spec and test directories when searching
set relativenumber                     " Use relative line numbers
set ruler                              " Show cursor position
set scrolloff=3                        " Always show 3 lines of context
set shiftwidth=2                       " A tab is two spaces
set showcmd                            " Display incomplete commands
set showmatch                          " Highlight matching [{()}]
set smartcase                          " Searches are case insensitive unless there is a capital letter
set smartindent                        " Smartly increase indentation
set softtabstop=2                      " Backspace 2 spaces at a time
set spell                              " Enable spell checking
set tabstop=2                          " A tab is two spaces
set wildmenu                           " Visual autocomplete for command menu
set writebackup                        " Backup before overwriting a file


"Mappings

" Use space as our leader key
let mapleader="\<SPACE>"


" Fancy paste
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>

""" LETS MAKE SURE WE HAVE CONFIGURED ALL THE PLUGSIN THE WAY WE WANT AND USE

"" fzf 
map <Leader>f :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'

"" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
map ga <Plug>(EasyAlign)

let g:netrw_liststyle = 3    " Preferred list style
let g:netrw_banner = 0       " Hide the header hii
let g:netrw_browse_split = 4 " Open files in previous window
let g:netrw_winsize = 25     " Pane should be 25% wide
let g:netrw_dirhistmax = 0   " Don't create .netrwhist files

"" deoplete + lsp

" Rust
lua require'lspconfig'.rust_analyzer.setup({})
" lua require'lspconfig'.rust_analyzer.setup({
" \   settings = {
" \     "rust-analyzer" = {
" \       "rust-analyzer.cargo.loadOutDirsFromCheck": true;
" \       "rust-analyzer.procMacro.enable": true;
" \     }
" \   }
" \ })

autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:rustfmt_autosave = 1

" Ruby
lua require'lspconfig'.solargraph.setup{}
autocmd Filetype ruby setlocal omnifunc=v:lua.vim.lsp.omnifunc

let g:deoplete#enable_at_startup = 1

autocmd BufNewFile */diary/[0-9]*.md :silent 0r !echo "\# `date +'\%Y-\%m-\%d'`"
autocmd BufNewFile */diary/[0-9]*.md :r ~/Dropbox/wiki/diary/template.md

" Markdown
let g:markdown_syntax_conceal = 0
let g:vim_markdown_conceal = 0
