" Leader
let mapleader = " "

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

call plug#begin()

" thoughtbot
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'kchmck/vim-coffee-script'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'

" Derek Prior
Plug 'christoomey/vim-rfactory'
Plug 'christoomey/vim-tmux-navigator'
Plug 'croaky/vim-colors-github'
Plug 'derekprior/vim-leaders'
Plug 'derekprior/vim-trimmer'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Ben
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nanotech/jellybeans.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'qpkorr/vim-bufkill'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'benekastah/neomake'
Plug 'elixir-lang/vim-elixir'
Plug 'lambdatoast/elm.vim'
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

call plug#end()

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

set noshowmode        " powerline shows the mode
set hlsearch          " highlight searches (:noh to turn off)
set ignorecase        " case insensitive searching
set smartcase         " overrides ignorecase when pattern contains caps
set winwidth=80       " minimum width for active split
set clipboard=unnamed " use OS clipboard
set nofoldenable

" Whitespace stuff
set nowrap

" Color scheme
colorscheme jellybeans
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

augroup localEx
  autocmd!

  " File Type Settings
  autocmd filetype qf setlocal wrap

  " Help System Speedups
  autocmd filetype help nnoremap <buffer><CR> <c-]>
  autocmd filetype help nnoremap <buffer><bs> <c-T>
  autocmd filetype help nnoremap <buffer>q :q<CR>
  autocmd filetype help set nonumber

  autocmd! BufReadPost,BufWritePost * Neomake
augroup END

" git shortcuts
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gdiff<CR>

" open various consoles
noremap <leader>gg :call system("tmux split-window -v -c '#{pane_current_path}' -p 30 'gitsh'")<CR>
noremap <leader>gc :call system("tmux split-window -v -c '#{pane_current_path}' -p 30 'dev-console'")<CR>
noremap <leader>gp :call system("tmux split-window -v -c '#{pane_current_path}' -p 30 'dev-db-console'")<CR>

" simple vertical splits
map <leader>v <C-w>v

" Mappings for quick search & replace.
" Do a / search first, then leave pattern empty in :s// to use last
map <Leader>sra :%s///g<Left><Left>
map <Leader>src :%s///gc<Left><Left><Left>

" Hide highlighted terms
map <silent> <leader><CR> :noh<CR>

" vim-test mappings
let g:test#strategy = 'neoterm'

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_elixir_enabled_makers = ['mix']
let g:neomake_elixir_mix_maker = {
  \ 'args': ['compile'],
  \ 'errorformat':
  \ '** %s %f:%l: %m,' .
  \ '%f:%l: warning: %m'
  \ }

nnoremap <silent> <BS> :TmuxNavigateLeft<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* RFind call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

if has('nvim')
  " Escape to exit terminal mode
  tnoremap <silent> <Esc> <C-\><C-n>

  " Navigate out of terminal mode splits
  tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
  tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
  tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

  " Enter terminal insert mode as soon as I enter a terminal split
  autocmd BufEnter term://* startinsert
end

" Ben
let g:deoplete#enable_at_startup = 1

map <Leader>n :NERDTreeToggle<CR>
nmap <C-f> :RFind<space>

" FZF with ctrl-p
map <C-p> :FZF<cr>

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Quickfix management - does it work with leader set to space?
" map <Space><Space> :ccl<cr>

" remove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

" fzf layout
" let g:fzf_layout = { 'right': '~40%' }

" Search with rg
set grepprg=rg\ --vimgrep

" fat fingers
command! Q q " Bind :Q to :q
command! Qall qall
command! E e
command! W w
command! Wq wq
command! Bd BD
command! Bp bp
