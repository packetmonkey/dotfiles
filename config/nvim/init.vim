"NeoBundle Configuration {{{
if has('vim_starting')
  set runtimepath+=/Users/evan/.config/nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/evan/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'              " Awesome git plugin
NeoBundle 'ervandew/supertab'               " Tab completion
NeoBundle 'w0rp/ale'
NeoBundle 'tomtom/tcomment_vim'             " Toggle comment blocks
NeoBundle 'itchyny/lightline.vim'           " Fancy status line
NeoBundle 'tpope/vim-rails'                 " Ruby on Rails helpers
NeoBundle 'junegunn/vim-easy-align'         " Fancy Alignment
NeoBundle 'tpope/vim-surround'              " 'Surround' motion
NeoBundle 'bronson/vim-trailing-whitespace' " Detect and fix trailing whitespace
NeoBundle 'tpope/vim-endwise'               " Auto-close structures
NeoBundle 'kien/ctrlp.vim'                  " Fuzzy Search
NeoBundle 'scrooloose/nerdtree'             " File explorer
NeoBundle 'tpope/vim-dispatch'              " Run things async
NeoBundle 'easymotion/vim-easymotion'       " Cheat moving around
NeoBundle 'christoomey/vim-sort-motion'     " 'gs' Sort objects and motions
NeoBundle 'vim-scripts/ReplaceWithRegister' " 'gr' Replace with register motion

" Text Objects
NeoBundle 'kana/vim-textobj-user'           " Custom text object support
NeoBundle 'rhysd/vim-textobj-ruby'          " Ruby block text objects
NeoBundle 'jasonlong/vim-textobj-css'       " CSS block text objects

" Syntaxes
NeoBundle 'vim-ruby/vim-ruby'                " Ruby
NeoBundle 'wellbredgrapefruit/tomdoc.vim'    " TomDoc syntax
NeoBundle 'kchmck/vim-coffee-script'         " Coffee Script
NeoBundle 'plasticboy/vim-markdown'          " Markdown
NeoBundle 'mustache/vim-mustache-handlebars' " Handlebars
NeoBundle 'ekalinin/Dockerfile.vim'          " Docker
NeoBundle 'rust-lang/rust.vim'               " Rust
NeoBundle 'cespare/vim-toml'                 " TOML
NeoBundle 'wannesm/wmgraphviz.vim'           " DOT
NeoBundle 'tpope/vim-classpath'              " Java
NeoBundle 'dag/vim-fish'                     " fish Script
NeoBundle 'chikamichi/mediawiki.vim'         " Wiki

" Color Schemes
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/badwolf'
NeoBundle 'tomasr/molokai'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'wesgibbs/vim-irblack'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'rakr/vim-one'
NeoBundle 'dracula/vim.git'
NeoBundle 'jacoborus/tender'
NeoBundle 'trevordmiller/nova-vim'
NeoBundle 'w0ng/vim-hybrid'


call neobundle#end()

filetype plugin indent on

                                       " If there are uninstalled bundles found on startup,
                                       " this will conveniently prompt you to install them.
NeoBundleCheck
                                       " }}}
                                       " Editor Configuration {{{
syntax on
set background=dark
set laststatus=2                       " Always show the status line
set encoding=utf-8                     " UTF-8 for everything
set relativenumber                     " Use relative line numbers
set number                             " Show what line we are on
set ruler                              " Show cursor position
set scrolloff=3                        " Always show 3 lines of context
set cursorline                         " Highlight our current line
set spell                              " Enable spell checking
set backup                             " Create backup files
set writebackup                        " Backup before overwriting a file
set backupdir=~/.config/nvim/_backup// " Where to put backup files
set directory=~/.config/nvim/_temp//   " Where to put swap files
set wildmenu                           " Visual autocomplete for command menu
set showcmd                            " Display incomplete commands
set nowrap                             " Don't wrap lines
set tabstop=2                          " A tab is two spaces
set shiftwidth=2                       " A tab is two spaces
set softtabstop=2                      " Backspace 2 spaces at a time
set expandtab                          " Use spaces, not tabs
set backspace=indent,eol,start         " Backspae though everything in insert mode
set colorcolumn=80                     " Mark 80th column
set autoindent                         " Maintain indentation
set smartindent                        " Smartly increase indentation
set hlsearch                           " Highlight search matches
set incsearch                          " Incremental searching
set ignorecase                         " Searches are case insensitive
set smartcase                          " Searches are case insensitive unless there is a capital letter
set foldmethod=manual                  " Never fold anything for me
set foldenable                         " Enable folding
set foldlevelstart=10                  " Open most folds by default
set foldmethod=syntax                  " Syntax highlighting detainees folds
set noshowmode                         " Redundant to lightline
set lazyredraw                         " Redraw only when we need to
set showmatch                          " Highlight matching [{()}]
set path+=spec,test                    " Include spec and test directories when searching

"" Ignore Search Patterns
set wildignore+=.sass-cache,.bundle,tmp,bundle,uploads,nore+=node_modules,bin
set wildignore+=tags,*restart.txt,*.log,*.otf,.DS_Store,*.pdf
set wildignore+=tags,*restart.txt,*.log,*.otf,.DS_Store
set wildignore+=*.class

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

colorscheme tender
highlight Comment cterm=italic

" }}}
" Lightline Configuration {{{
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
\ }


let g:ale_fixers = {
\   'ruby': ['rubocop']
\}
" }}}
" CtrlP Configuration {{{
let g:ctrlp_use_caching = 0

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
" }}}
"Mappings {{{
let mapleader="\<SPACE>"

nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>z za

" Easily navigate syntax problems
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Make it really easy to edit vim configs
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Make it easier to bounce around windows
" map <Leader>w <C-w>w

" Open new tab and fuzzy find new file
" map <leader>T :tabnew<cr><leader>f

" Open next window
" map <leader>W :tabnext<cr>

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" This needs to be a function that either calls this or in XML calls
" silent %!xmllint --encode UTF-8 --format -
map <Leader>i mmgg=G`m
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>w :w<CR>

tnoremap <Esc> <C-\><C-n>


au BufNewFile,BufRead *.gradle set filetype=groovy



" Markdown
" Highlight words to avoid in tech writing
"   http://css-tricks.com/words-avoid-educational-writing/

highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
	match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
autocmd FileType markdown call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md,*.markdown call MatchTechWordsToAvoid()
autocmd InsertEnter *.md,*.markdown call MatchTechWordsToAvoid()
autocmd InsertLeave *.md,*.markdown call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md,*.markdown call clearmatches()

" vim:foldmethod=marker:foldlevel=0
