" vim: sw=4 ts=4 et
call plug#begin()
    " system
    Plug 'tpope/vim-sensible'
    Plug 's3rvac/AutoFenc'
    Plug 'benekastah/neomake'

    " appearance
    Plug 'altercation/vim-colors-solarized'
    Plug 'bling/vim-airline'

    " usability
    Plug 'scrooloose/nerdcommenter'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'simnalamburt/vim-mundo'
    Plug 'jiangmiao/auto-pairs'

    " snippets
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'noahfrederick/vim-skeleton'

    " git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'

    " devel
    Plug 'fatih/vim-go'
    Plug 'andviro/flake8-vim'
    Plug 'davidhalter/jedi-vim'
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
call plug#end()

" general settings
set background=dark
set backupdir-=.
set clipboard+=unnamedplus
set incsearch
set undofile
set smartcase
set ignorecase
set autoread
set autowrite
set nohlsearch
set spelllang=ru,en
set hidden
set infercase
set nostartofline
set splitbelow
set noequalalways
set helpheight=10
set whichwrap=<,>,h,l
set listchars=tab:>-,eol:·,nbsp:~
set completeopt-=preview
set list
set number
set backup
set nowildmenu
set wildignore+=RCS,CVS,*~,*.aux,*.bak,*.dvi,*.toc
set wildignore+=*.idx,*.log,*.swp,*.tar,*.o,*.cm?,*.d
set wildignore+=*.haux,*.htoc,*.image.tex,*.pyc,*.out,*\\,v
set wildignore+=*.bbl,*.blg,*.out
set wildignore+=.git,.hg,*.svn
set wildignore+=*.sqlite
colorscheme solarized
let mapleader = ";"

" general key bindings
nmap <silent> <C-H> :bp<CR>
nmap <silent> <C-L> :bn<CR>
nnoremap <silent> <M-l> :nohlsearch<CR><C-L>
nnoremap <silent> <Tab> :b#<CR>
map <Space> <C-D>
nnoremap <BS> <C-O>
nmap <S-H> <C-O>
nmap <S-L> <C-I>
nnoremap <silent> <C-j> :tabnext<CR>
nnoremap <silent> <C-k> :tabprevious<CR>

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
"let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline_detect_iminsert=1
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" ctrlp
let g:ctrlp_key_loop = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_reuse_window = 'netrw\|quickfix'
let g:ctrlp_extensions = ['session']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules)$'
\ }
let g:ctrlp_cmd = 'CtrlPLastMode'
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = 'find %s -type f'
endif


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
nnoremap <silent> <Leader><CR> :YcmCompleter GoTo<CR>
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

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gC :Gcommit -a<CR>
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gp :Gpush --all<CR>
nmap <Leader>gu :Gpull<CR>
