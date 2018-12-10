" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

"Plug in for file tree
Plug 'scrooloose/nerdtree'

call plug#end()

" adds line numbers
set number
" allows for mouse movement
set mouse=a
" allows search before pressing enter
set incsearch
" hilights searched words
set hlsearch
" auto loads file changes
set autoread

" map Ctrl+n to open nerd tree
map <C-n> :NERDTreeToggle<CR>
