" vim: sw=4 ts=4 et
scriptencoding utf-8
call plug#begin()
    " system
    Plug 's3rvac/AutoFenc'
    Plug 'benekastah/neomake'

    " appearance
    Plug 'andviro/vim-colors-solarized'
    Plug 'bling/vim-airline'
    Plug 'wincent/terminus'

    " usability
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'simnalamburt/vim-mundo'
    Plug 'Raimondi/delimitMate'
    Plug 'terryma/vim-multiple-cursors'

    " snippets
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'noahfrederick/vim-skeleton'

    " VCS
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'
    Plug 'phleet/vim-mercenary'

    " devel
    Plug 'fatih/vim-go'
    Plug 'andviro/flake8-vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'kchmck/vim-coffee-script'
    Plug 'elzr/vim-json'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
    Plug 'mtscout6/vim-cjsx'
    Plug 'marijnh/tern_for_vim', { 'do': 'npm update' }
    Plug 'othree/tern_for_vim_coffee'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'
    Plug 'groenewege/vim-less'
    Plug 'digitaltoad/vim-jade'
    Plug 'stephpy/vim-yaml'
    Plug 'chase/vim-ansible-yaml'
    Plug 'Chiel92/vim-autoformat'
    Plug 'rdnetto/YCM-Generator', {'branch' : 'stable'}
call plug#end()

" system
"
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set clipboard+=unnamedplus
set backupdir-=.
if finddir(&backupdir) == ''
    silent call mkdir(&backupdir, "p")
endif
set undofile
set autoread
set autowrite
set hidden
set backup
set viewoptions=cursor,folds,slash,unix
set title
set history=1000
set tabpagemax=50
set viminfo^=!
set sessionoptions-=options

" files
set wildignore+=RCS,CVS,*~,*.aux,*.bak,*.dvi,*.toc
set wildignore+=*.idx,*.log,*.swp,*.tar,*.o,*.cm?,*.d
set wildignore+=*.haux,*.htoc,*.image.tex,*.pyc,*.out,*\\,v
set wildignore+=*.bbl,*.blg,*.out
set wildignore+=.git,.hg,*.svn
set wildignore+=*.sqlite

" search
set smartcase
set ignorecase
set incsearch
set nohlsearch
set infercase

"navigation
set scrolloff=3
set nostartofline
set cursorline


" editing
set whichwrap=<,>,h,l
set nowrap

set listchars=tab:\|\ ,eol:·,nbsp:~
"set listchars=tab:❘\ ,eol:·,nbsp:~
"set listchars=tab:⋮\ ,eol:·,nbsp:~
set list
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set virtualedit=block
set autoindent
set smartindent
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set formatoptions+=j " Delete comment character when joining commented lines
let mapleader = ";"

" windows
set splitbelow
set noequalalways
set helpheight=10
set nowildmenu
set completeopt-=preview

" i18n
set fileencodings=utf-8,cp1251,koi8-r
set spelllang=ru,en
set keymap=russian-yawerty
set iminsert=0
set imsearch=-1

" appearance
set laststatus=2
set ruler
set showcmd
set wildmenu
set background=dark
set display+=lastline
let g:solarized_termcolors = 16
let g:solarized_visibility = "low"
let g:solarized_contrast = "normal"
colorscheme solarized
"highlight NonText cterm=none ctermbg=none ctermfg=23
"highlight SpecialKey cterm=none ctermbg=none ctermfg=23
"
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" IM switch
imap <C-\> <C-^>
imap <C-_> <C-^>
imap <C-Space> <C-^>
cmap <C-\> <C-^>
cmap <C-_> <C-^>
cmap <C-Space> <C-^>
nmap <silent> <C-\> :let &l:iminsert = !&l:iminsert<CR>
nmap <silent> <C-/> :let &l:iminsert = !&l:iminsert<CR>
nmap <silent> <C-_> :let &l:iminsert = !&l:iminsert<CR>
nmap <silent> <C-Space> :let &l:iminsert = !&l:iminsert<CR>

" general key bindings
nnoremap <silent> <C-H> <C-O>
nnoremap <silent> <C-L> <C-I>
nnoremap <silent> <M-l> :nohlsearch<CR><C-L>
nnoremap <silent> <Tab> :b#<CR>
map <Space> <C-D>
nnoremap <BS> <C-O>
"nmap <S-H> <C-O>
"nmap <S-L> <C-I>
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>
nnoremap <silent> <C-W>q :bprev <BAR> bdelete #<CR>

" Neovim terminal
if has("nvim")
    tnoremap <A-q> <C-\><C-n><C-w>q
endif

" emacs-like insert mode
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
inoremap <C-B>      <Left>
cnoremap <C-D>      <Del>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
inoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>

" utility functions
fun! init#restore_cursor() 
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction 

" autocommands
augroup vimrc
au!
    " usability
    au QuickfixCmdPost make,grep :cwin 5
    au BufWinEnter * call init#restore_cursor()
    au FocusLost * if &modifiable && &modified | write | endif
    au CursorMovedI * if pumvisible() == 0|pclose|endif 
    au InsertLeave * if pumvisible() == 0|pclose|endif
    au BufEnter * silent! lcd <afile>:p:h

    " filetype-specific
    au BufNewFile,BufRead *.json setf javascript
    au BufNewFile,BufRead *.j2 setlocal ft=jinja
    au BufNewFile,BufRead *.tag setlocal ft=html
    au BufRead,BufNewFile *.txt setlocal ft=asciidoc
    au BufRead *.hva setlocal ft=tex
    au BufWrite *.html :Autoformat
augroup END"}}}

" coffeescript
let g:coffee_lint_options = '-f ' . $HOME . '/.vim/coffeelint.json'
augroup coffeeScript
au!
au BufWritePost *.coffee CoffeeLint! | 5cwin
augroup end

" nerdcommenter
vmap <silent> K <plug>NERDCommenterInvert
let g:NERDCustomDelimiters = {
    \ 'spice': { 'left': '* ' },
    \ 'fsharp': { 'left': '// ' },
    \ 'python': { 'left': '# ' },
    \ 'snippets': { 'left': '# ' },
    \ 'jinja': { 'left': '{# ', 'right': ' #}' }
\ }"}}}

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_detect_iminsert=1
nmap <silent> <A-1> <Plug>AirlineSelectTab1
nmap <silent> <A-2> <Plug>AirlineSelectTab2
nmap <silent> <A-3> <Plug>AirlineSelectTab3
nmap <silent> <A-4> <Plug>AirlineSelectTab4
nmap <silent> <A-5> <Plug>AirlineSelectTab5
nmap <silent> <A-6> <Plug>AirlineSelectTab6
nmap <silent> <A-7> <Plug>AirlineSelectTab7
nmap <silent> <A-8> <Plug>AirlineSelectTab8
nmap <silent> <A-9> <Plug>AirlineSelectTab9

" vim-skeleton
let g:skeleton_replacements = {}

function! g:skeleton_replacements.CLASS()
    let l:filen = tolower(expand("%:t:r"))
    return substitute(l:filen, "\\([a-zA-Z]\\+\\)", "\\u\\1\\e", "g")
endfunction
function! g:skeleton_replacements.NAME()
    return tolower(expand("%:t:r"))
endfunction

" jedi
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0
let g:jedi#goto_assignments_command = '<CR>'
let g:jedi#goto_definitions_command = '<Leader><CR>'
let g:jedi#rename_command = '<Leader>R'
let g:jedi#usages_command = '<Leader>n'

" ultisnips / YCM
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
inoremap <expr><c-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><c-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
"nnoremap <silent> <CR> :YcmCompleter GoTo<CR>
"nnoremap <silent> K :YcmCompleter GetDoc<CR>
let g:UltiSnipsExpandTrigger="<C-L>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<c-h>"

" [GM]undo
map <Leader>u :GundoToggle<CR>

" neomake
nmap <leader>b :<C-u>silent wa<CR>:Neomake!<CR>
let g:neomake_open_list=1
let g:neomake_place_signs=1
let g:neomake_list_height=7

" fugitive

nmap <silent> <Leader>gs :Gstatus<CR>
nmap <silent> <Leader>gc :Gcommit<CR>
nmap <silent> <Leader>gC :Gcommit -a<CR>
nmap <silent> <Leader>ga :Git add %<CR>
nmap <silent> <Leader>gp :Git push --all<CR>
nmap <silent> <Leader>gu :Git pull<CR>

" NERDTree

nnoremap <silent> <Leader><Tab> :NERDTreeToggle<CR>

" FZF
"nnoremap <silent> <C-P> :<C-u>FZF<CR>
nnoremap <silent> <C-P> :<C-u>call fzf#run({
            \ 'source': 'ag --ignore ".git" --follow --nocolor --nogroup --hidden -g ""', 
            \ 'sink' : 'e',
            \ 'window' : 'vertical aboveleft 40new'
            \ })<CR>
