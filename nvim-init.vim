call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'tomtom/tcomment_vim'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'rking/ag.vim'
Plug 'nanotech/jellybeans.vim'

" thoughtbot...
Plug 'christoomey/vim-run-interactive'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'
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

call plug#end()

colorscheme jellybeans

let mapleader = ","

map <Leader>n :NERDTreeToggle<CR>

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

filetype plugin indent on

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

set number
set relativenumber
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
" let test#strategy = "neoterm"
" let test#strategy = "dispatch"
let test#strategy = "neovim"

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
command! Bd bd
command! Bp bp
