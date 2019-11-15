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
   nnoremap <silent> <leader>pb :Buffers<CR>
   nnoremap <silent> <leader>/ :Rg<CR>

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

Plug 'vadimr/bclose.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
  let g:test#strategy = "neoterm"
  let g:test#preserve_screen = 0
  let g:neoterm_shell = '$SHELL -l' " use the login shell
  let g:neoterm_default_mod = 'vert'
  let g:neoterm_autoscroll = 1      " autoscroll to the bottom when entering insert mode
  let g:neoterm_keep_term_open = 0  " when buffer closes, exit the terminal too.
  let g:test#ruby#use_spring_binstub = 0 " ignore spring 
  let g:test#ruby#use_binstubs = 0 "ignore binstubs

  set splitbelow
  set splitright

  nnoremap <silent> <LocalLeader>tb :TestFile<CR>
  nnoremap <silent> <LocalLeader>tt :TestNearest<CR>
  nnoremap <silent> <LocalLeader>ta :TestSuite<CR>
  nnoremap <silent> <LocalLeader>tr :TestLast<CR>
  nnoremap <silent> <LocalLeader>tv :TestVisit<CR>

" Plug 'scrooloose/syntastic'
"   let g:syntastic_enable_signs          = 1
"   let g:syntastic_enable_highlighting   = 1
"   let g:syntastic_cpp_check_header      = 1
"   let g:syntastic_enable_balloons       = 1
"   let g:syntastic_echo_current_error    = 1
"   let g:syntastic_check_on_wq           = 0
"   let g:syntastic_error_symbol          = '✘'
"   let g:syntastic_warning_symbol        = '!'
"   let g:syntastic_style_error_symbol    = ':('
"   let g:syntastic_style_warning_symbol  = ':('
"   let g:syntastic_vim_checkers          = ['vint']
"   let g:syntastic_elixir_checkers       = ['elixir']
"   let g:syntastic_javascript_checkers   = ['eslint']
"   let g:syntastic_ruby_checkers         = ['rubocop']
"   " let g:syntastic_enable_elixir_checker = 0

  " augroup syntasticCustomCheckers
  "   autocmd!
  "   autocmd FileType ruby nnoremap <leader>` :SyntasticCheck rubocop<CR>
  " augroup END

Plug 'LnL7/vim-nix'

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
nnoremap <leader>bd :Bclose<CR>
nnoremap <leader>w <c-w>
nnoremap <leader>wd <c-w>q

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Switch between the last two files
nnoremap <Leader><Tab> <C-^>

" " Remove trailing whitespaces in current buffer
" nnoremap <Leader><BS>s :1,$s/[ ]*$//<CR>:nohlsearch<CR>1G

" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"

