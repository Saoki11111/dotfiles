set encoding=utf-8
scriptencoding utf-8

augroup MyAutoCmd
  autocmd!
augroup END

" vim: foldmethod=marker
"シンタックスハイライトを有効にする。
filetype plugin indent on
syntax enable

" leaderを設定
let mapleader = "\<Space>"
" 一行選択
noremap <Leader>v 0v$h

" NERDTreeのショートカット
nnoremap T :NERDTree<cr>
" Agのショートカット
nnoremap <Space>a :Ag<cr>
" fzfのショートカット
nnoremap <Space>f :FZF<cr>
" 行番号表示
nnoremap <Space>q :set number<cr>
nnoremap <Space>w :set nonumber<cr>
" Buffers
nnoremap <Space>b :Buffers<cr>
" 現在のファイルをvimタブで開く
nnoremap <Space>t :tabe %<cr>

"上下移動の補完
noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
noremap gr gT

" ;でコマンド入力
noremap : ;
noremap ; :

"agの設定
if executable('ag')
  set grepprg=ag\ --nogroup\ -iS
  set grepformat=%f:%l:%m
elseif executable('grep')
  set grepprg=grep\ -Hnd\ skip\ -r
  set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
else
  set grepprg=internal
endif

augroup VimGrepAutoCmd
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

"vimの色
colorscheme pablo
hi clear
set expandtab

"改行文字とタブ文字の色設定（NonTextが改行、SpecialKeyがタブ）
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey guibg=NONE guifg=#808080

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" syntastic から rubocop を実行する設定
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"ファイル名の表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2
"検索文字の表示
set incsearch
"検索のとき大文字小文字の区別をしない。
set ignorecase
"コマンドラインモードの履歴を指定の数保存する。
set history=500
"ファイル名タブ補完
set wildmode=list:longest
"検索文字をハイライト表示
set hlsearch
"新しい行のインデントを現在と同じにする。
set autoindent
"他で書き換えたら自動で読み直す
set autoread
"カーソル行の背景色を変える
set cursorline
" クリップボードをWindowsと連携
set clipboard=unnamed
" スクロールするときに下が見える
set scrolloff=5
"backspaceの反応がない場合の対処
set backspace=indent,eol,start

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
  let s:enc_jis = 'iso-2022-jp'

  " Does iconv support JIS X 0213?
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " Build encodings.
  let &fileencodings = 'ucs-bom'
  if &encoding !=# 'utf-8'
    let &fileencodings .= ',' . 'ucs-2le'
    let &fileencodings .= ',' . 'ucs-2'
  endif
  let &fileencodings .= ',' . s:enc_jis
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
  unlet s:enc_jis

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

" use Ag -u
command! -bang -nargs=* Agu call fzf#vim#ag(<q-args>, '-u', <bang>0)

" syntax
set ts=2 sts=2 sw=2 et
autocmd MyAutoCmd Filetype yaml setlocal ts=2 sts=2 sw=2 et

set wildmenu wildmode=list:longest,full
