call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Plug 'tomtom/tcomment_vim'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'rking/ag.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'qpkorr/vim-bufkill'
Plug 'fntlnz/atags.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'rust-lang/rust.vim'

" thoughtbot...
Plug 'christoomey/vim-run-interactive'
Plug 'pbrisbin/vim-mkdir'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/deoplete.nvim'

call plug#end()

colorscheme jellybeans

let mapleader = ","

map <Leader>n :NERDTreeToggle<CR>

" use the system clipboard
set clipboard+=unnamedplus

" use buffkill instead of :bd

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Exclude Javascript files in :Rtags via rails.vim due to warnings when
" parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
function! ReindexCtags()
	let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'

	if exists(l:ctags_hook)
		exec '!'. l:ctags_hook
	else
		exec "!ctags -R ."
	endif
endfunction
nmap <Leader>ct :call ReindexCtags()<CR>

nmap <C-f> :Ag<space>

" Emacs-like beginning and end of line. Doesn't work in nvim?
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Quickfix management
map <Space><Space> :ccl<cr>

" Test runner (vim-test)
nmap <silent> <Leader>s :TestNearest<CR>
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>a :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>

" ctags
let g:atags_build_commands_list = [
    \"ctags -R -f tags.tmp",
    \"awk 'length($0) < 400' tags.tmp > tags",
    \"rm tags.tmp"
    \]
" Generate tags everytime a file is being written.
autocmd BufWritePost * call atags#generate()

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" default tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1


" fzf layout
" let g:fzf_layout = { 'right': '~40%' }

filetype plugin indent on

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

set number
" set relativenumber
set autoindent

" Search with ag
set grepprg=ag

" Ignore stuff that can't be opened
set wildignore+=tmp/**

" Clear search highlight
map <C-s> :nohl<cr>

" FZF with ctrl-p
map <C-p> :FZF<cr>

" Highlight the status line
" highlight StatusLine ctermfg=blue ctermbg=yellow

" make splitting more sane
set splitbelow
set splitright

" use a terminal for test
let test#strategy = "neoterm"
" let test#strategy = "dispatch"
" let test#strategy = "neovim"

" Gary Bernhardt Rename curent file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>r :call RenameFile()<cr>

" fat fingers
command! Q q " Bind :Q to :q
command! Qall qall
command! E e
command! W w
command! Wq wq
command! Bd BD
command! Bp bp

" autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_open_list = 2
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'

" let g:neomake_serialize = 1
" let g:neomake_serialize_abort_on_error = 1
" let g:neomake_elixir_enabled_makers = ['mix']
" let g:neomake_elixir_mix_maker = {
"   \ 'args': ['compile'],
"   \ 'errorformat':
"   \ '** %s %f:%l: %m,' .
"   \ '%f:%l: warning: %m'
"   \ }
