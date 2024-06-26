set encoding=utf-8

augroup MyAutoCmd
  autocmd!
augroup END

" allow syntax high-light filetype plugin indent on
filetype plugin indent on
" syntax enable

" use space for <Leader>
let mapleader = "\<Space>"
noremap <Leader>v 0v$h
nnoremap T :NERDTree<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
" nnoremap <Leader>z :VimFiler<cr>
nnoremap <Leader>z :Vaffle<cr>
nnoremap <Leader>a :Agu<cr>
nnoremap <Leader>f :FZF<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>l :BLines<cr>
nnoremap <Leader>q :set number<cr>
nnoremap <Leader>w :set nonumber<cr>
nnoremap <Leader>r :QuickRun<cr>
nnoremap <Leader>t :tabe %<cr>
nnoremap <Leader>e :IndentLinesToggle<cr>
" nnoremap <Leader>e :IndentGuidesToggle<cr>
nnoremap <Leader>d :StripWhitespace<cr>
" ale toggle
nnoremap <Leader>1 :ALEToggle<cr>

 "quick chenge window size
nnoremap [winsize] <Nop>
nmap <C-E> [winsize]
nnoremap [winsize]k :resize -3<CR>
nnoremap [winsize]j :resize +3<CR>
nnoremap [winsize]h :vertical resize -10<CR>
nnoremap [winsize]l :vertical resize +10<CR>

" autocmd VimEnter * execute 'Defx'
" nnoremap <silent> <Leader>i :<C-u> Defx <CR>

"indentline"
let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"vim-indent-guides"
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
set ts=1 sw=1 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

noremap j gj
noremap k gk
noremap gr gT

noremap : ;
noremap ; :

let g:user_emmet_leader_key='<c-t>'

" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
" vim color
colorscheme pablo
hi clear

" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" smartindentで増減する幅
set shiftwidth=2

" new line -> NonText tab -> SpecialKey
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey guibg=NONE guifg=#808080

" same brackets
set showmatch

" screen file name
set statusline=%F
" change log
set statusline+=%m
" check read only
set statusline+=%r
" if help page show [HELP]
set statusline+=%h
" if preview window show[Prevew]
set statusline+=%w
" right justification
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" row number representation
set statusline+=[LOW=%l/%L]
" show status line (0:none、1:2 < show)
set laststatus=2
" search word
set incsearch
" search case insentivie
set ignorecase
" gommand line history
set history=500
" file name compelement
set wildmode=list:longest
" search high-light
set hlsearch
" same new line indent
set autoread
" change background color of the cursor line
set clipboard=unnamed
" see under 5 rows
set scrolloff=5
set backspace=indent,eol,start
" no set swp
set noswapfile
" line number
set number

" file encoding
if has('g:_rc_encoding_vim_loaded') && g:_rc_encoding_vim_loaded
  finish
endif

" The automatic recognition of the character code.

" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
if has('vim_starting')
  set encoding=utf-8
endif

" Setting of terminal encoding."{{{
if !has('gui_running')
  if &term ==# 'win32' &&
        \ (v:version < 703 || (v:version == 703 && has('patch814')))
    " Setting when use the non-GUI Japanese console.

    " Garbled unless set this.
    set termencoding=cp932
    " Japanese input changes itself unless set this.  Be careful because the
    " automatic recognition of the character code is not possible!
    set encoding=japan
  else
    if $ENV_ACCESS ==# 'linux'
      set termencoding=euc-jp
    elseif $ENV_ACCESS ==# 'colinux'
      set termencoding=utf-8
    else  " fallback
      set termencoding=  " same as 'encoding'
    endif
  endif
elseif my#iswin()
  " For system.
  set termencoding=cp932
endif
"}}}

" The automatic recognition of the character code."{{{
if !exists('did_encoding_settings') && has('iconv')
  let s:enc_euc = 'euc-jp'
  " let s:enc_jis = 'iso-2022-jp'

  " Does iconv support JIS X 0213?
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    " let s:enc_jis = 'iso-2022-jp-3'
  endif

  " Build encodings.
  let &fileencodings = 'ucs-bom'
  if &encoding !=# 'utf-8'
    let &fileencodings .= ',' . 'ucs-2le'
    let &fileencodings .= ',' . 'ucs-2'
  endif
  " let &fileencodings .= ',' . s:enc_jis
  let &fileencodings .= ',' . 'utf-8'

  if &encoding ==# 'utf-8'
    let &fileencodings .= ',' . s:enc_euc
    let &fileencodings .= ',' . 'cp932'
  elseif &encoding =~# '^euc-\%(jp\|jisx0213\)$'
    let &encoding = s:enc_euc
    let &fileencodings .= ',' . 'cp932'
    let &fileencodings .= ',' . &encoding
  else  " cp932
    let &fileencodings .= ',' . s:enc_euc
    let &fileencodings .= ',' . &encoding
  endif
  let &fileencodings .= ',' . 'cp20932'

  unlet s:enc_euc
  " unlet s:enc_jis

  let did_encoding_settings = 1
endif
"}}}

if has('kaoriya')
  " For Kaoriya only.
  set fileencodings=guess
endif

" When do not include Japanese, use encoding for fileencoding.
function! s:ReCheck_FENC() abort "{{{
  let is_multi_byte = search("[^\x01-\x7e]", 'n', 100, 100)
  if &fileencoding =~# 'iso-2022-jp' && !is_multi_byte
    let &fileencoding = &encoding
  endif
endfunction"}}}

autocmd MyAutoCmd BufReadPost * call s:ReCheck_FENC()

" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

let g:_rc_encoding_vim_loaded = 1

set grepprg=ag\ --nogroup\ -uiS
set grepformat=%f:%l:%m

" use FZF in vim
set rtp+=/usr/local/opt/fzf

" use Ag -u
command! -bang -nargs=* Agu call fzf#vim#ag(<q-args>, '-u', <bang>0)

" syntax
set ts=2 sts=2 sw=2 et
autocmd MyAutoCmd Filetype yaml setlocal ts=2 sts=2 sw=2 et

set wildmenu wildmode=list:longest,full

" " syntastic execution rubocop
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
" let g:syntastic_ruby_checkers = ['rubocop']

" vimconfig
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" 行番号の色を設定
hi LineNr ctermbg=239 ctermfg=97
hi CursorLineNr ctermbg=99 ctermfg=0
" set cursorline
hi clear CursorLine

"Ignore whitespace with vimdiff
if &diff
  set diffopt-=internal
  set diffopt+=iwhite
endif

" plugin
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'rking/ag.vim',
  Plug 'cocopon/vaffle.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tomtom/tcomment_vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'thinca/vim-quickrun'
  Plug 'simeji/winresizer'
  Plug 'qpkorr/vim-renamer'
  Plug 'alvan/vim-closetag'
  Plug 'neoclide/coc.nvim'
call plug#end()
