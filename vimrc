"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow mouse scrolling
set mouse=a

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points

"turn on syntax highlighting
syntax on

"turn on line numbering
set number

"indent settings
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab ts=4 sw=1 ai

"display tabs and trailing spaces
set list
set listchars=tab:··,trail:·,nbsp:·

set formatoptions-=o "dont continue comments when pushing o/O

"Syntax highlighting for ini files
au BufNewFile,BufRead *.ini,*/.hgrc,*/.hg/hgrc setf ini 
au BufNewFile,BufRead *.uut setfiletype=ini

"set the color scheme
set t_Co=256
colorscheme distinguished

"Status line settings
set laststatus=2        "always show the status line
set statusline=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


"Set leader
let mapleader=","

"Lines should only be 80 chars long
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
    if !exists('w:longlinehl')
        let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
        echo "Long lines highlighted"
    else
        call matchdelete(w:longlinehl)
        unl w:longlinehl
        echo "Long lines unhighlighted"
    endif
endfunction


"" Start NeoBundle Stuff
"if has('vim_starting')
"    set nocompatible     " Be iMproved
"
"" Required:
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"
"" Required:
"call neobundle#begin(expand('~/.vim/bundle/'))
"
"" Let NeoBundle manage NeoBundle
"" Required:
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"" My Bundles here:
"NeoBundle 'scrooloose/syntastic'
"" Doesn't work : [
"" NeoBundle 'Valloric/YouCompleteMe'
"
"call neobundle#end()
"
"" Required:
"filetype plugin indent on
"
"" If there are unintalled bundles found on startup,
"" this will conveniently prompt you to install them.
"NeoBundleCheck
""End NeoBundle Stuff
