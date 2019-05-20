call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-sort-motion'     " 'gs' Sort objects and motions
Plug 'tpope/vim-commentary'            " 'gc' toggle comment blocks
Plug 'junegunn/vim-easy-align'         " Fancy alignment
Plug 'tpope/vim-endwise'               " Auto-insert `end` in ruby
Plug 'tpope/vim-surround'              " 'Surround' motion
Plug 'tpope/vim-fugitive'              " Git functions (statusline branch)
Plug 'airblade/vim-gitgutter'          " Git gutter
Plug 'bronson/vim-trailing-whitespace' " Detect and fix trailing white space
Plug 'justinmk/vim-sneak'              " Cheat moving arround
Plug 'thoughtbot/vim-rspec'            " Easy rspec runner
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'hwartig/vim-seeing-is-believing' " Vim inline ruby output

" Text Objects
Plug 'kana/vim-textobj-user'            " Custom text object support
Plug 'rhysd/vim-textobj-ruby'           " Ruby block text objects

Plug 'w0rp/ale'
" call minpac#add('ervandew/supertab')                " Tab completion
Plug 'itchyny/lightline.vim'              " Fancy status line
Plug 'maximbaz/lightline-ale'

" Syntaxes
" call minpac#add('vim-ruby/vim-ruby')                " Ruby
" call minpac#add('wellbredgrapefruit/tomdoc.vim')    " TomDoc syntax
" call minpac#add('kchmck/vim-coffee-script')         " Coffee Script
Plug 'tpope/vim-markdown'          " Markdown
Plug 'mzlogin/vim-markdown-toc'          " Markdown ToC generation
" call minpac#add('mustache/vim-mustache-handlebars') " Handlebars
" call minpac#add('ekalinin/Dockerfile.vim')          " Docker
" call minpac#add('rust-lang/rust.vim')               " Rust
" call minpac#add('wannesm/wmgraphviz.vim')           " DOT
" call minpac#add('tpope/vim-classpath')              " Java
" call minpac#add('chikamichi/mediawiki.vim')         " Wiki
Plug 'hashivim/vim-terraform'                         " Terraform
Plug 'cespare/vim-toml'                               " TOML

" Color Schemes
Plug 'jacoborus/tender'
Plug 'DankNeon/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'dracula/vim'

call plug#end()

syntax on                              " Enable syntax highlighting

set autoindent                         " Maintain indentation
set background=dark
set backspace=indent,eol,start         " Backspae though everything in insert mode
set backup                             " Create backup files
set backupdir=~/.config/nvim/_backup// " Where to put backup files
set colorcolumn=80                     " Mark 80th column
set cursorline                         " Highlight our current line
set directory=~/.config/nvim/_temp//   " Where to put swap files
set encoding=utf-8                     " UTF-8 for everything
set expandtab                          " Use spaces, not tabs
set foldenable                         " Enable folding
set foldlevelstart=10                  " Open most folds by default
set foldmethod=manual                  " Never fold anything for me
set foldmethod=syntax                  " Syntax highlighting detainees folds
set hlsearch                           " Highlight search matches
set ignorecase                         " Searches are case insensitive
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

colorscheme tender
highlight Comment cterm=italic

let g:sneak#label = 1

let g:markdown_fenced_languages = ['ruby', 'bash=sh', 'json']

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_quickfix = 1

" let g:ale_fixers = {
" \   'ruby': ['rubocop'],
" \}

let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}

let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'left': [
			\     [ 'mode', 'paste' ],
			\     [ 'fugitive' ],
			\     [ 'relativepath' ],
			\     [ 'modified' ],
			\   ],
			\   'right': [
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
			\     [ 'lineinfo' ],
			\   ]
			\ },
			\ 'inactive': {
			\   'left': [
			\     [ 'filename', 'modified' ]
			\   ],
			\   'right' : [
			\     [ 'lineinfo' ]
			\   ]
			\ },
			\ 'component': {
			\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
			\   'lineinfo': '%3l/%L:%-2v',
			\ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ 'component_expand' : {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
\ }

"Mappings
let mapleader="\<SPACE>"

" This needs to be a function that either calls this or in XML calls
" silent %!xmllint --encode UTF-8 --format -
map <Leader>i mmgg=G`m
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>w :w<CR>
map <Leader>fix :ALEFix<CR>
map <Leader>f :Files<CR>

" function! TestProject()
"   " Fugitive command to cd to project root defined by the presence of the
"   " .git directory
"   Gcd

"   " Get our spec on
"   !bundle exec rspec

"   " Go back home
" endfunction
" " map <Leader>r :!bundle exec rspec %<CR>
" map <Leader>r :call TestProject()<CR>
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
	autocmd!

	autocmd FileType ruby nmap <buffer> <Leader>X :%s/ # => .*$//g<CR>

	autocmd FileType ruby nmap <buffer> <Leader>x <Plug>(seeing-is-believing-mark-and-run)
	autocmd FileType ruby xmap <buffer> <Leader>x <Plug>(seeing-is-believing-mark-and-run)
	" autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
	" autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
	" autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

	" autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
	" autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END
