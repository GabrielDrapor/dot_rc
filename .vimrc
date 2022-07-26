nnoremap j 4j
nnoremap k 4k
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <C-B> <C-W>p
nnoremap gi :GitGutterSignsToggle<CR>
nnoremap gn :set number! number?<CR>
nnoremap gu :GitGutter<CR>
nnoremap gb :Black<CR>
nnoremap gp :Prettier<CR>
nnoremap ha :Ack <cword><cr>
nnoremap zz zA
nnoremap r zR
nnoremap <C-Q> <C-W>q<CR>
nnoremap tt :CtrlP<CR>
nnoremap ff :FZF<CR>
nnoremap hh :History<CR>
nnoremap ga :Ag <C-R><C-W><CR>
nnoremap cc :TComment<CR>
nnoremap gt :!ctags --python-kinds=i -R .<CR>

call plug#begin()
Plug 'universal-ctags/ctags'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'trusktr/seti.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'itchyny/lightline.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'vim-python/python-syntax'
Plug 'solarnz/thrift.vim'
call plug#end()


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set tabstop=4
set backspace=indent,eol,start
set hlsearch
set expandtab
set autoindent
set foldmethod=indent
set foldlevel=4
set noswapfile
set completeopt-=preview
set autoread
set laststatus=2
" set listchars=tab:»■,trail:↤
" set list
set wildmenu
set wildmode=longest:list,full
set termguicolors
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:omni_sql_no_default_maps = 1
let g:black_linelength = 120
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']


autocmd BufReadPost *.py
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

au BufNewFile *.py 0r ~/.vim/skeleton/py_skeleton

syntax on
" colorscheme wombat256grf
colorscheme github

let g:lightline = { 'colorscheme': 'github' }
let g:github_colors_soft = 1
set background=dark
let g:github_colors_block_diffmark = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre *.py :call TrimWhitespace()
autocmd BufWritePre *.thirft :call TrimWhitespace()

" for js
" let g:prettier#config#tab_width = 2
" let g:prettier#config#print_width = 80
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#trailing_comma = 'all'

filetype plugin on
