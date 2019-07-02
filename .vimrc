" dein vim
if &compatible
    set nocompatible     " Be iMproved
endif
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
    call dein#begin('$HOME/.cache/dein')

    " plugin list
    let g:dein_dir = expand('~/.vim/dein')
    let s:toml = g:dein_dir . '/dein.toml'
    let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

    " write the plugin in TOML file
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

" setting
" 置換系
" ノーマルモード時だけ ; と : を入れ替える
" 前前前世から僕は君を探し始めたよ
nnoremap ; :
nnoremap : ;
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" dictionary 設定
" Ctrl-x + Ctrl-k で辞書が起動する
set dictionary=/usr/share/dict/words

" color scheme
autocmd ColorScheme * highlight Comment ctermfg=102
autocmd ColorScheme * highlight Visual  ctermfg=4
" hi Visual  ctermfg=4
colorscheme molokai
" 256色環境
set t_Co=256

" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" マウスの有効化
if has('mouse')
    set mouse=n
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" ペーストの設定
" set paste でペーストするけどノーマルモードにするときは pasteモードを自動で解除
autocmd InsertLeave * set nopaste

" python の補完(jedi-vim)
" Tab で補完
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
" 1 個目の候補が入力される設定解除
let g:jedi#popup_select_first = 0
" 上の説明文はいらない
autocmd FileType python setlocal completeopt-=preview
" .を入力すると補完が始まる設定を解除
let g:jedi#popup_on_dot = 0

" clang を用いたコード補完(vim-clang)
" C のソースコードのときのオプション
let g:clang_c_options = '-std=c11'
" C++ のソースコードのときのオプション
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++'
" ファイルを保存するときにシンタックスのチェックを行う
let g:clang_check_syntax_auto = 1


"
" markdown に関する設定
"
" plasticboy/vim-markdown の設定
" シンタックスハイライト用
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_auto_insert_bullets = 0
" let g:vim_markdown_new_list_item_indent = 0

" kannokanno/previm の設定
" markdown をブラウザでプレビュー
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
" ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

" tyru/open-browser.vim の設定
" カーソル下のurlや文字列を開いたり検索したりする
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

