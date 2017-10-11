set t_Co=256

syntax on
filetype off
set nocompatible
set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'fholgado/minibufexpl.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'davidhalter/jedi-vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

Plugin 'kien/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'

Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'alvan/vim-closetag'
Plugin 'rizzatti/dash.vim'
Plugin 'tomtom/tlib_vim'
" Plugin 'endel/flashdevelop.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mtscout6/syntastic-local-eslint.vim'

call vundle#end()

set background=dark
try
    let g:solarized_termcolors=256
    colorscheme solarized " set colorscheme
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert " backup colorscheme
endtry

let mapleader="," " set leader for future use

set ru " display ruler
set nu " display line number
set sc " show uncomplete command
set sm " show the match parenthesis
set bs=2 " allow backspace to delete
set mouse=i " allow to use mouse

set whichwrap=<,>,[,],b,s " allow move between lines
set backspace=eol,start,indent " extend backspace
set fileformats=unix,dos,mac

set ignorecase " ignore case, please notice the next option
set smartcase " ignore case when the pattern only contains small letters
set hls " highlight all the items which match search pattern
set is " open incsearch, do searching along with typing
nmap <leader>s :nohlsearch<enter>

map <Up> gk
map <Down> gj
imap <Up> <C-o>gk
imap <Down> <C-o>gj

" for persistent undo
set undofile
set undodir=~/.vim/undodir

" for remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" for different filetype
filetype plugin indent on
set tabstop=4
" http://vim.wikia.com/wiki/Indenting_source_code
" without tabs:
set expandtab shiftwidth=4 softtabstop=4 smartindent smarttab
" with tabs:
" set sw=4 ts=4 si
" autocmd FileType c,cpp,java set sw=4 ts=4 si
" autocmd FileType html,htmldjango,javascript,css set et sw=4 sts=4 si sta
" autocmd FileType python,ruby,php set et sw=4 sts=4 si sta
autocmd FileType html,javascript,css set shiftwidth=2 softtabstop=2


" for display tab
set list
set listchars=tab:>\ ,trail:.

" for remove unwanted whitespaces
" autocmd FileType c,cpp,java,python,ruby,html,javascript,css,bib,tex,php autocmd BufWritePre <buffer> :%s/\s\+$//e
" autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd InsertLeave * :s/\s\+$//e

set clipboard=unnamed

" for NERDTree
noremap <leader>t :NERDTree<enter>
let NERDTreeIgnore=["\.pyc$", "\.o$"]

" for tComment
noremap <leader>c :TComment<enter>

" for minibufexplorer
let g:miniBufExplMapWindowNavArrows=1
noremap <c-t> :bn<enter>

" for YouCompleteMe
let g:ycm_path_to_python_interpreter="~/.pyenv/shims/python"
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_confirm_extra_conf=0
set completeopt=menuone

" for vim-airline
set laststatus=2

" for vim-expand-region
map h <Plug>(expand_region_shrink)
map l <Plug>(expand_region_expand)

" for ctrlp
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_user_command = [".git", "git ls-files --cached --others --exclude-standard -- %s"]


" for dash
noremap <leader>k :Dash<enter>
noremap <leader>K :Dash!<enter>

" for vim-gitgutter
let g:gitgutter_max_signs=20000

" other settings
noremap L <c-w><c-w>
autocmd FileType python setlocal completeopt-=preview
let g:syntastic_python_flake8_args="--ignore=E501,E402,F403"
let g:jedi#completions_command="<C-c>"
let g:jedi#popup_on_dot=0
let g:syntastic_mode_map={"passive_filetypes": ["actionscript"]}
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_args = "--quiet"

" spf13
set virtualedit=onemore
cmap w!! w !sudo tee % >/dev/null

set so=2

