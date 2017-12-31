packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('christoomey/vim-sort-motion')      " 'gs' Sort objects and motions
call minpac#add('tpope/vim-fugitive')               " Awesome git plugin
call minpac#add('tomtom/tcomment_vim')              " Toggle comment blocks
call minpac#add('tpope/vim-rails')                  " Ruby on Rails helpers
call minpac#add('junegunn/vim-easy-align')          " Fancy Alignment
call minpac#add('tpope/vim-endwise')                " Auto-close structures
call minpac#add('tpope/vim-surround')               " 'Surround' motion

call minpac#add('bronson/vim-trailing-whitespace')  " Detect and fix trailing whitespace
call minpac#add('ctrlpvim/ctrlp.vim')               " Fuzzy Search
call minpac#add('easymotion/vim-easymotion')        " Cheat moving around
call minpac#add('sjl/gundo.vim')                    " Graphical undo tree

" Text Objects
call minpac#add('kana/vim-textobj-user')            " Custom text object support
call minpac#add('rhysd/vim-textobj-ruby')           " Ruby block text objects
call minpac#add('jasonlong/vim-textobj-css')        " CSS block text objects
call minpac#add('glts/vim-textobj-comment')         " Comment text object
call minpac#add('w0rp/ale')
call minpac#add('ervandew/supertab')                " Tab completion
call minpac#add('itchyny/lightline.vim')            " Fancy status line


" Syntaxes
call minpac#add('vim-ruby/vim-ruby')                " Ruby
call minpac#add('wellbredgrapefruit/tomdoc.vim')    " TomDoc syntax
call minpac#add('kchmck/vim-coffee-script')         " Coffee Script
call minpac#add('plasticboy/vim-markdown')          " Markdown
call minpac#add('mustache/vim-mustache-handlebars') " Handlebars
call minpac#add('ekalinin/Dockerfile.vim')          " Docker
call minpac#add('rust-lang/rust.vim')               " Rust
call minpac#add('cespare/vim-toml')                 " TOML
call minpac#add('wannesm/wmgraphviz.vim')           " DOT
call minpac#add('tpope/vim-classpath')              " Java
call minpac#add('chikamichi/mediawiki.vim')         " Wiki

" Color Schemes
call minpac#add('jacoborus/tender', {'type': 'opt'})

filetype plugin indent on

syntax on

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


"" Ignore Search Patterns
set wildignore+=.sass-cache,.bundle,tmp,bundle,uploads,nore+=node_modules,bin
set wildignore+=tags,*restart.txt,*.log,*.otf,.DS_Store,*.pdf
set wildignore+=tags,*restart.txt,*.log,*.otf,.DS_Store
set wildignore+=*.class

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

colorscheme tender
highlight Comment cterm=italic

" Lightline Configuration
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

" CtrlP Configuration
let g:ctrlp_use_caching = 0

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

"Mappings
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
