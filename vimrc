"set guifont=Terminus:h10
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak "because breaking words is to damn ugly
set number " display number of lines
set relativenumber "display the number of rows above and below
set hidden
set cursorline " highlight current line
set showmatch "show matching brackets and stuff
set nohlsearch "do not highlight after search
set incsearch "Makes search act like search in modern browsers
set smartcase " When searching try to be smart about cases 
set foldcolumn=1 "show fold sctructure
"set iskeyword-=_
"set iskeyword-=-
syntax on
filetype plugin on

set t_Co=256
colorscheme wombat256i

"" kill background for transparency and use darkgrey for highlight
"au ColorScheme * hi Normal ctermbg=none
"au ColorScheme * hi Visual ctermbg=darkgrey


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
" select the lines below and enter exe mode (:)
" send the selection with w !bash
" line will look like :'<,'>:w !bash
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
  Plug 'w0rp/ale'
  Plug 'junegunn/fzf.vim'
" async completion - Pandas is lame with Jedi, no fault with vim completion...
  Plug 'lifepillar/vim-mucomplete'
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
" display indention levels with thin vertical lines
  Plug 'yggdroot/indentline'
  " Prose mode!
  Plug 'junegunn/goyo.vim'
  " Lightline
  Plug 'itchyny/lightline.vim'
  " Easy align
  Plug 'junegunn/vim-easy-align'
call plug#end()

" configure jedi to python3
let g:jedi#force_py_version = 3
" show arguments inline
let g:jedi#show_call_signatures = "1"


set noshowmode shortmess+=c
set completeopt-=preview
set completeopt+=longest,menuone,noinsert,noselect
let g:jedi#popup_on_dot = 0  " It may be 1 as well
let g:mucomplete#enable_auto_at_startup = 1

"let g:completor_python_binary = '/usr/bin/python'

" set RainbowParentheses to work
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"let g:slimux_select_from_current_window = 1
vnoremap <Leader>ss :SlimuxREPLSendSelection<CR>
nnoremap <leader>ss :SlimuxREPLSendLine<CR>
nnoremap <leader>sb :SlimuxREPLSendBuffer<CR>


" fzf configs
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>

" prose mode
function! ProseMode()
  "set formatoptions=1an
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  "if !has('gui_running')
    "let g:solarized_underline = 1
    "let g:solarized_termcolors=256
  "endif
  "colors solarized
endfunction
command! ProseMode call ProseMode()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:tex_conceal = ""

set laststatus=2

 "Lightline
let g:lightline = {
\ 'colorscheme': 'one',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

"" Improve documentation for Ale
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

