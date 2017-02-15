"Pathogen"
execute pathogen#infect()
autocmd FileType python map <C-H> :call Flake8()<CR>

"Colors on a mac"
filetype off
syntax on
filetype plugin indent on
se term=xterm
colorscheme slate
let &t_Co=256

se shiftwidth=4
se expandtab
se tabstop=4
se softtabstop=4
se autoindent
se hlsearch
se nu
se modeline
se ls=2
se ruler
se hidden
se cursorline
hi MatchParen ctermbg=darkcyan ctermfg=white
hi CursorLine   cterm=underline ctermbg=None ctermfg=NONE guibg=darkred guifg=white
hi Visual cterm=reverse ctermbg=None ctermfg=None

" " " " " " " " " " " "

"Show all buffers and quickswitch"
map <C-L> :buffers<CR>:b<Space>
"Kill current buffer
map <C-K> :bn\|bd # <CR>
"Next buffer
map <C-N> :execute "bn" <CR>
"Previous buffer
map <C-P> :execute "bp" <CR>
"Alternate buffer
map <C-J> :b# <CR>
"Resize windows {vertically|horizontally} {smaller|bigger} (in that order)
map <C-Left> :vertical resize -1 <CR>
map <C-Right> :vertical resize +1 <CR>
map <C-Down> :resize -1 <CR>
map <C-Up> :resize +1 <CR>
map <Esc>[D :vertical resize -1 <CR>
map <Esc>[C :vertical resize +1 <CR>
map <Esc>[B :resize -1 <CR>
map <Esc>[A :resize +1 <CR>

" " " " " " " " " " " "

" Using tabs as buffers -> IMPROPER
"Move tabs to the left or right with gt and gT"
"map gT :execute "tabmove" tabpagenr() - 2 <CR>
"map gt :execute "tabmove" tabpagenr() <CR>

"Switch tabs using ctrl-h and ctrl-l"
"map <C-H> :execute "tabNext" <CR>
"map <C-L> :execute "tabnext" <CR>

" " " " " " " " " " " "

"Switch moving in wrapped lines and moving between lines"
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"Don<F3>'t allow wq command because I need a magic dialing wand or else I accidentally quit all the time"
cmap wq WQ_IS_BOD
