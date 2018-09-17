" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Declare the list of plugins.
" Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'majutsushi/tagbar'
Plug 'eagletmt/neco-ghc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-dadbod'
Plug 'clojure-vim/acid.nvim'
Plug 'tpope/vim-eunuch'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set guicursor=
colorscheme gruvbox
set background=dark
set number

set mouse=a
filetype plugin indent on
syntax on
set shiftwidth=4 tabstop=4 expandtab
set ignorecase
set smartcase
set clipboard=unnamedplus

set inccommand=nosplit

"paste multiple times
xnoremap p pgvy

"split mappings - easier switching between splits
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

nnoremap <C-H> :tabprev<CR>
nnoremap <C-L> :tabnext<CR>

"More natural spliting
set splitbelow
set splitright

"Format JSON in a readable way
com! FormatJSON %!python -m json.tool

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

let g:python3_host_prog = '/usr/local/bin/python3'

" nerdtree settings
nnoremap <C-N> :NERDTreeToggle<CR>

let g:ale_fixers = {}
let g:ale_fixers['go'] = ['gofmt']
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_javascript_prettier_options = '--no-semi --single-quote'

let g:ale_fixers.python = ['autopep8']
let g:ale_python_autopep8_options = '--max-line-length 300'
let g:ale_python_mypy_options = '--python-version=3.6 --ignore-missing-imports'
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8 --max-line-length 300'
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>l :lopen<CR>
nnoremap <Leader>c :lclose<CR>

" enable max python highlighting
let g:python_highlight_all = 1

nnoremap <C-P> :FZF<CR>

" enable jsx syntax in js files (not only jsx)
let g:jsx_ext_required = 0

" tags folder relative to where nvim is open
set tags=.tags
" genereate python tags in project
nnoremap <Leader>t :! ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./.tags .<CR>
" use esc to go back to normal mode in term mode
tnoremap <Esc> <C-\><C-n>
