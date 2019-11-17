let g:mapleader = "\<Space>"
let g:maplocalleader = ","

call plug#begin('~/.nvim/plugged')
Plug 'nanotech/jellybeans.vim'
  let g:jellybeans_use_term_background_color = 0

Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " let g:coc_global_extensions = ['coc-solargraph']

  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  " inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <C-d> <Plug>(coc-range-select)
  xmap <silent> <C-d> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
      
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
Plug 'tpope/vim-fugitive'
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

