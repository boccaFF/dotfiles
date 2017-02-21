set guifont=Terminus:h10
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak "because breaking words is to damn ugly
set number " display number of lines
set relativenumber "display the number of rows above and below
set cursorline " highlight current line
set showmatch "show matching brackets and stuff
set nohlsearch "do not highlight after search
set incsearch "Makes search act like search in modern browsers
set smartcase " When searching try to be smart about cases 

colorscheme wombat256i

" kill background for transparency and use darkgrey for highlight
au ColorScheme * hi Normal ctermbg=none 
au ColorScheme * hi Visual ctermbg=darkgrey

" Highlight syntax
syntax on
filetype plugin on

" Highlight the text after 80 columns for specified FileTypes
autocmd BufRead,BufNewFile *.m,*.oct set filetype=octave
autocmd BufRead,BufNewFile *.py3 set filetype=python
autocmd FileType r,octave,python silent! highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
autocmd FileType r,octave,python silent! match OverLength /\%81v.\+/ 

" Configure tab, ident and stuff
set expandtab 
set autoindent 
set smarttab
set ts=2 sw=2 sts=2 
autocmd FileType python setlocal ts=4 sw=4 sts=4 "except for python

let mapleader = "\<Space>"

"set omnifunc=syntaxcomplete#Complete
set clipboard=unnamed

call plug#begin('~/.vim/plugged')
  " Color parenthesis according to hierarchy
  Plug 'kien/rainbow_parentheses.vim'
  " Download a fuck ton of colorschemes
  Plug 'flazz/vim-colorschemes'
  " Surrounding commands
  Plug 'tpope/vim-surround'
  " Easy align
  Plug 'junegunn/vim-easy-align'
  " Easy commenting
  Plug 'scrooloose/nerdcommenter'
  " Octave stuff
  Plug 'octave.vim--'
  " lighline - For showing some stuff in the line
  Plug 'itchyny/lightline.vim'
  " code completion
  Plug 'Valloric/YouCompleteMe'
  " integrate vim + REPL trough tmux
  Plug 'epeli/slimux'
call plug#end()


" Configuring plugins
"" Congigurations of Syntastic as suggested in their git, statusline disabled 
"" because of lightline
"set statusline += %#warningmsg#
"set statusline += %{SyntasticStatuslineFlag()}
"set statusline += %*
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" set RainbowParentheses to work
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" send current file to Conque
let g:ConqueTerm_SendFileKey = '<F10>'
" keep updating despite not focused
let g:ConqueTerm_ReadUnfocused = 1 

" close preview window after insertion
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

let g:slime_target = "tmux"

vnoremap <Leader>ss :SlimuxREPLSendSelection<CR>
nnoremap <leader>sb :SlimuxREPLSendBuffer<CR>
nnoremap <leader>sl :SlimuxREPLSendLine<CR>
