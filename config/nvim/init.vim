" Enable modern Vim features not compatible with Vi spec.
set nocompatible

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
" Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
" Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
" Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-bufkill'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'tpope/tpope-vim-abolish'
Plug 'alx741/vim-hindent'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'bitc/vim-hdevtools'
" Plug 'prettier/vim-prettier', {
    " \ 'do': 'npm install',
    " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
Plug 'rust-lang/rust.vim'
call plug#end()

" my configs
set number
set colorcolumn=80,100,120
set hidden

" Set true colors for vim
set termguicolors

" Colorscheme
set background=dark
colorscheme hybrid

" Tmux with mouse scrolling https://github.com/neovim/neovim/issues/6690#issuecomment-299407490
set mouse=a

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set wildignore+=*/node_modules/*,*/vendor/*,*/tmp/*,*/.DS_store

" fzf
:nnoremap <C-p> :GFiles<CR>
:nnoremap <C-t> :Ag<CR>

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%'),
  \                 <bang>0)
  \ call getcwd()

" needed for nerd commenter
filetype plugin on
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:rustfmt_autosave = 1

" http://vim.wikia.com/wiki/Avoid_the_escape_key
:imap jj <Esc>
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" nerdtree
" open when vim starts
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store']
" hotkey
map <C-n> :NERDTree<CR>
" close vim if nerdtree is the only thing left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Backspace to alternate-file
:nnoremap <BS> <C-^>

" Move cursor by display lines when they are wrapped
nnoremap j gj
nnoremap k gk
noremap 0 g0
noremap $ g$
vnoremap j gj
vnoremap k gk
set linebreak

let g:deoplete#enable_at_startup = 1

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


" Work-specific settings {{{
"   if filereadable($HOME . "/.vimrc_work")
"     source $HOME/.vimrc_work
"   endif
" }}}
