"シンタックスハイライトを有効にする。
filetype plugin indent on
syntax enable

" leaderを設定
let mapleader = "\<Space>"
" 一行選択
noremap <Leader>v 0v$h
" 保存
noremap <Leader>w :w<CR>
"NERDTreeのショートカット
nnoremap T :NERDTree<cr>
"FZFのショートカット
nnoremap <Space>f :FZF<cr>
"AGのショートカット
nnoremap <Space>a :Ag<cr>
"tabeのショートカット
nnoremap <Space>t :tabe<cr>

"上下移動の補完
noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $

"vim内での操作
"split
noremap ss :split<cr>
noremap vs :vsplit<cr>

"split-move
noremap sh :<C-w>h<cr>
noremap sj :<C-w>j<cr>
noremap sk :<C-w>k<cr>
noremap sl :<C-w>l<cr>
noremap sw :<C-w>w<cr>

"split-change
noremap sx :<C-w>x<cr>

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
set shiftwidth=2
set ts=4
set sts=4
set sw=4
set et

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
"行番号表示
set number
"ファイル名タブ補完
set wildmode=list:longest
"検索文字をハイライト表示
set hlsearch
"新しい行のインデントを現在と同じにする。
"set autoindent
"他で書き換えたら自動で読み直す
set autoread
"カーソル行の背景色を変える
set cursorline
" クリップボードをWindowsと連携
set clipboard=unnamedplus,unnamed,autoselect
" スクロールするときに下が見える
set scrolloff=5
"backspaceの反応がない場合の対処
set backspace=indent,eol,start

set encoding=utf8
set fenc=utf-8
