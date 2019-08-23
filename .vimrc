set nocompatible
set expandtab
set number
set relativenumber
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set ignorecase
set smartcase
set history=200
set splitright

filetype off



"Split window right

"Filter command history like Up & Down
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"Highlight page size limit
highlight ColorColumn ctermbg=gray
set colorcolumn=80


"Config backspace
"set backspace=indent,eol,start

"Autorefresh file
set autoread
au CursorHold,CursorHoldI * checktime
set updatetime=1000

"Config cursor
set cursorline
autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'whatyouhide/vim-gotham'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Search for visually selected text
vnoremap // y/<C-R>"<CR>

"Search and replace the word under the cursos
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Press Space to turn off highlighting and clear any message already  displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set hlsearch
set incsearch

hi Search ctermbg=LightYellow
hi Search ctermfg=Red
"

call vundle#end()
filetype plugin indent on
syntax on
syntax enable
set background=dark

"Control certain syntax highlighting
let g:javascript_plugin_jsdoc = 1

"Plugin 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

set foldmethod=syntax

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>


" Folding
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

"CtrlP Configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Config F9 and F10 to move between the previous/next buffer with this mapping
map <F9> :bprevious<CR>
map <F10> :bnext<CR>

"Clipboard
set clipboard=unnamed
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>

"Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
end

nnoremap ss i<space><esc>


"Emmer vim HTMl/CSS Plugin Confing
let g:user_emmet_mode='a'    "only enable normal mode functions.
autocmd FileType html,css,vue EmmetInstall

"Remap line motion command real lines and display lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

"
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]


"Dont jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>-i<Space>



" no other configuration than this needed for solarized

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif




"Search for the Current Selction
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
