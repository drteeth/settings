call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tomtom/tcomment_vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'rking/ag.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

colorscheme jellybeans
let mapleader = ","
map <Leader>n :NERDTreeToggle<CR>

nmap <C-f> :Ag<space>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Quickfix management
map <Space><Space> :ccl<cr>

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


set number
set autoindent

" Search with ag
set grepprg=ag

" Ignore stuff that can't be opened
set wildignore+=tmp/**

" Clear search highlight
map <C-h> :nohl<cr>

" FZF with ctrl-p
map <C-p> :FZF<cr>

" Highlight the status line
" highlight StatusLine ctermfg=blue ctermbg=yellow

" make splitting more sane
set splitbelow
set splitright

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
