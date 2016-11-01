"-----------------------------------------------------------------------------
" Vim Starter Configuration (Dotfiles)
"
"-----------------------------------------------------------------------------

set nocompatible
let &t_Co=256
syntax enable
filetype plugin indent on

"-----------------------------------------------------------------------------
" Vundle Config
"-----------------------------------------------------------------------------

" Setting up Vundle
" Found here: http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let has_vundle=1
let vundle_readme=expand('~/.dotfiles/vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.dotfiles/vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.dotfiles/vim/bundle/vundle
    let has_vundle=0
endif

" Vundle setup config
set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc()

" Requirment for syntastic
execute pathogen#infect()
" Required Bundle
Bundle 'gmarik/vundle'
" Additional Bundles go here"
" autocomplete
Bundle 'Valloric/YouCompleteMe'
" tabular
Bundle 'godlygeek/tabular'
" syntastic
Bundle 'scrooloose/syntastic'
" colors
Bundle 'dracula/vim'

" Installing plugins the first time
" If exists, skip
if has_vundle == 0
    echo "Installing Bundles, please gnore key map error messages"
    echo ""
    :BundleInstall
endif

"-----------------------------------------------------------------------------
" Encoding and general usability
"-----------------------------------------------------------------------------

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set encoding=utf-8
set visualbell

" Cursor tracking
set ruler

" Line numbering
set number

" If a file has been changed outside of Vim, reload it inside of Vim
set autoread

" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
  if v:version >= 700
    set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
  else
    set list listchars=tab:»·,trail:·,extends:…
  endif
else
  if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
  else
    set list listchars=tab:>-,trail:.,extends:>
  endif
endif

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,81),",")

"-----------------------------------------------------------------------------
" Syntastic basic settings
"-----------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

:command Sc SyntasticCheck

" ctrl-w E to toggle syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"-----------------------------------------------------------------------------
" Search, highlight, spelling, etc.
"-----------------------------------------------------------------------------

set incsearch

set number
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermfg=white

" Enable syntax highlighting, if one exists
if has("syntax")
    syntax on
endif


"-----------------------------------------------------------------------------
" Spacing
"-----------------------------------------------------------------------------

set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab

