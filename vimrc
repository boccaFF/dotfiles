"set guifont=Terminus:h10
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak "because breaking words is to damn ugly
set number " display number of lines
"set relativenumber "display the number of rows above and below
set cursorline " highlight current line
set showmatch "show matching brackets and stuff
set nohlsearch "do not highlight after search
set incsearch "Makes search act like search in modern browsers
set smartcase " When searching try to be smart about cases 
syntax on
filetype plugin on

set t_Co=256
colorscheme wombat256i

"
"" kill background for transparency and use darkgrey for highlight
"au ColorScheme * hi Normal ctermbg=none
"au ColorScheme * hi Visual ctermbg=darkgrey
"
"
" Highlight the text after 80 columns for specified FileTypes
autocmd FileType r,python silent! highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType r,python silent! match OverLength /\%81v.\+/
" do not go crazy in makefiles...
autocmd FileType make setlocal noexpandtab

" Configure tab, ident and stuff
set expandtab
set autoindent
set smarttab
set ts=2 sw=2 sts=2
autocmd FileType python setlocal ts=4 sw=4 sts=4 "except for python

let mapleader = " "

" download vimplug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
" automatically pops up auto-completion
  Plug 'vim-scripts/AutoComplPop'
  " uses tab to select auto-completion
  Plug 'ervandew/supertab'
" python completion
" TODO: find lighter completion engine for slower machines
  "Plug 'davidhalter/jedi-vim'
" colorschems library (use ln -s .vim/plugged/colorschemes/colors .vim/colors)
  Plug 'flazz/vim-colorschemes'
" Color parenthesis according to hierarchy
  Plug 'kien/rainbow_parentheses.vim'
  " Easy commenting
  Plug 'scrooloose/nerdcommenter'
  " Vim + Tmux repel
  Plug 'epeli/slimux'
" check trailing whitespace
	Plug 'bronson/vim-trailing-whitespace'
call plug#end()

" configure jedi to python3
let g:jedi#force_py_version = 3
" show arguments inline
let g:jedi#show_call_signatures = "2"
"let g:jedi#show_call_signatures = "0"
"autocmd FileType python call jedi#configure_call_signatures()

"let g:ycm_python_binary_path = '/usr/bin/python3'


" set RainbowParentheses to work
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"let g:slimux_select_from_current_window = 1
vnoremap <Leader>ss :SlimuxREPLSendSelection<CR>
nnoremap <leader>ss :SlimuxREPLSendLine<CR>
nnoremap <leader>sb :SlimuxREPLSendBuffer<CR>

