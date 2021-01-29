filetype off
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
let g:ycm_global_ycm_extra_conf = 'C:\Users\HP\vimfiles\bundle\YouCompleteMe\third_party\ycmd\.ycm_extra_conf.py'


source $VIMRUNTIME/vimrc_example.vim

call plug#begin('~/vimfiles/plugged')

" Plugin to add text objects and extend the functionality of built-in text objects
Plug 'wellle/targets.vim'

" Plugin similar to surround but better and less known
Plug 'machakann/vim-sandwich'

" Plugin for easy motion in vim
Plug 'easymotion/vim-easymotion'

" incsearch in vim with a plugin for improved effectiveness
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Plugin to manage buffers, files, windows, tabs
"Plug 'vim-ctrlspace/vim-ctrlspace'

" Vim airline and themes
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Colorscheme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'sjl/badwolf'
Plug 'crusoexia/vim-monokai'
Plug 'lifepillar/vim-solarized8'

" To use compiler with vim
Plug 'xuhdev/SingleCompile'

"To search efficiently 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-ctrlspace/vim-ctrlspace'

" ecnerwala's plugins
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'mxw/vim-jsx'
Plug 'tikhomirov/vim-glsl'

call plug#end()

set belloff=all
set wildmode=list,longest,full
" To have fullscreen on entering GVim
au GUIEnter * simalt ~x
set hls
set is
set cb=unnamed
set gfn=Consolas:h12
set ts=4
set sw=4
set si
set encoding=utf-8
set nocompatible
set hidden
set signcolumn=no
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
"colorscheme monokai
colorscheme solarized8
set background=light
cd C:\Users\HP\VimCpp

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>
autocmd BufNewFile *.cpp 0r C:\Users\HP\VimCpp\vimtemplate.cpp

set nu rnu

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


" Compiling hotkeys 
nmap <F10> :SCCompileRun<cr>


nmap <leader>y ggVG"+y''

" To remove search highlight after search is over
nnoremap <silent> <cr> :noh<CR>

"Abbreviations
iabbrev re for(ll i = 0; i < n; i++)cin >> v[i];
iabbrev ve vector<ll>v(n);
