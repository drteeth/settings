let g:mapleader = "\<Space>"
let g:maplocalleader = ","

call plug#begin('~/.nvim/plugged')
Plug 'nanotech/jellybeans.vim'
  let g:jellybeans_use_term_background_color = 0

Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  nnoremap <leader>gg :call CocAction('jumpDefinition', 'drop')<cr>
Plug 'dense-analysis/ale'
  nnoremap <leader>ln :ALENext<cr>
  nnoremap <leader>lp :ALEPrevious<cr>

Plug 'scrooloose/nerdtree'
  nnoremap <silent> <leader>pt :NERDTreeToggle<cr>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
   nnoremap <silent> <leader>pf :Files<CR>
   nnoremap <silent> <leader>bb :Buffers<CR>

Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'jquery'

Plug 'gavocanov/vim-js-indent'
Plug 'jimenezrick/vimerl'
  let erlang_show_errors = 0

Plug 'elixir-lang/vim-elixir'
Plug 'ekalinin/Dockerfile.vim'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
  let test#strategy = 'neovim'
  " let test#neovim#term_position = "topright"

  nnoremap <silent> <LocalLeader>tb :TestFile<CR>
  nnoremap <silent> <LocalLeader>tt :TestNearest<CR>
  nnoremap <silent> <LocalLeader>ta :TestSuite<CR>
  nnoremap <silent> <LocalLeader>tr :TestLast<CR>
  nnoremap <silent> <LocalLeader>tv :TestVisit<CR>

call plug#end()

set clipboard=unnamed,unnamedplus
set number         " show line numbers
set noswapfile     " disable creating of *.swp files
set hidden         " hide buffers instead of closing
set lazyredraw     " speed up on large files

set undolevels=5000     " set maximum undo levels

set nofoldenable    " disable folding

" Pretend we're in spacemacs
nnoremap <leader>fs :w<CR>
nnoremap <leader>qq :qa<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>w <c-w>
nnoremap <leader>wd <c-w>q

set laststatus=2 " always show status line
set showcmd      " always show current command

" set nowrap        " disable wrap for long lines
" set textwidth=0   " disable auto break long lines

set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)

" set ignorecase " ignore case of letters
" set smartcase  " override the 'ignorecase' when there is uppercase letters
" set gdefault   " when on, the :substitute flag 'g' is default on

colorscheme jellybeans
set cursorline     " highlight current line
" set colorcolumn=80 " highlight column
" highlight! ColorColumn ctermbg=233 guibg=#131313

" Language-specific
highlight! link elixirAtom rubySymbol

" " Toggle quickfix
" map <silent> <F8> :copen<CR>

" Disable search highlighting
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
"
" " Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" " Remove trailing whitespaces in current buffer
" nnoremap <Leader><BS>s :1,$s/[ ]*$//<CR>:nohlsearch<CR>1G

" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"

