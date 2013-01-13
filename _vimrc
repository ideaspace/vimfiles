" Base {
    let mapleader = ","
    let g:mapleader = ","
    let $VIMFILES = $VIM.'/vimfiles'
    syntax enable                                       "自动语法高亮
    set nocompatible                                    "关闭 vi 兼容模式
    set bsdir=buffer
    set autochdir                                       "自动设置目录为正在编辑的文件所在的目录
    set showcmd
    set noswapfile
    set showmatch
    set autoread                                        "自动读取文件被外部修改信息
	set nobackup                                        "文件不备份
    set backspace=indent,eol,start                      "设置退格
    set mouse=a
    set nobomb
    set history=500
    set so=1
    set hidden
    set magic
    set wrap
    set clipboard+=unnamed                              "与Windows共享剪贴板
    setlocal foldlevel=1
    autocmd BufEnter * lcd %:p:h 
   " vimrc {
        map <silent><leader>e :e! $MYVIMRC<cr>
        autocmd! bufwritepost _vimrc source $MYVIMRC
   " }
" }

" General {
	" encoding {
		set encoding=utf-8
		set fileencodings=utf-8,chinese
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	" }

    " filetype {
        filetype plugin on
        filetype indent on
    " }
    
    " Map {
        nmap <leader>w :w!<cr>
        map <leader>t :tabnew %<cr>
        map <leader>x :tabclose<cr>
    " }
" }

" Ui {
    au GUIEnter * simalt ~ x                            "启动时最大化 
    set number                                          "显示行号
    set incsearch                                       "实时搜索
    set ignorecase
    set hlsearch                                        "高亮搜索
    set magic
    set cursorline                                      "突出显示当前行
    set cursorcolumn                                    "突出显示当前列
	set ruler                                           "显示状态栏标尺
    set showmode
    " set linespace=0
    set guioptions-=T                                   "隐藏工具栏
    set guioptions-=m                                   "隐藏菜单栏
    set guifont=consolas:h14:cANSI                      "设置拉丁字体
	set guifontwide=YaHei_Mono:h12:cGB2312              "设置中文字体
    colorscheme moria                                   "主题 

    " Stautsline {                                      "自定义状态栏
        set laststatus=2
        set statusline=
        set statusline+=%1*\ %-52F\ 
        set statusline+=%2*\ %Y\ 
        set statusline+=%3*\ %{&ff}\ 
        set statusline+=%4*\ %{&fenc!=''?&fenc:&enc}\ 
        set statusline+=%5*\ %LLines\ 
        set statusline+=%4*\ %lL/%cC\ 
        set statusline+=%3*\ %P\ 
        set statusline+=%2*\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}\ 
        set statusline+=%1*\ %-3m\ 

        hi User1 guifg=#202020  guibg=#4A85BA gui=NONE
        hi User2 guifg=#202020  guibg=#87DF71 gui=NONE
        hi User3 guifg=#202020  guibg=#D0D0A0 gui=NONE
        hi User4 guifg=#202020  guibg=#F0946B gui=NONE
        hi User5 guifg=#202020  guibg=#D7A0D7 gui=NONE
    " }
    
    " Indent {
        set expandtab
        set autoindent									"自动缩进
        set smartindent								    "开启新行时使用智能自动缩进
        set shiftwidth=4								"设置按下'<' 或 '>'时缩进的宽度
        set tabstop=4									"设置Tab宽度
        set softtabstop=4								"设置缩进宽度
        set smarttab									"按下Backspace删除一个Tab宽度
    " }
" }

" Plugin Setting {
    " Vundle {
         set rtp+=$VIMFILES/bundle/vundle/       
         call vundle#rc('$VIMFILES/bundle/')
         Bundle 'gmarik/vundle'
         Bundle 'JavaScript-syntax'
         Bundle 'jQuery'
         Bundle 'othree/html5.vim'
         Bundle 'Markdown'
         Bundle 'Markdown-syntax'
         Bundle 'php.vim-html-enhanced'
         Bundle "pangloss/vim-javascript"
         Bundle 'Shougo/neocomplcache'
         Bundle 'skammer/vim-css-color'
         Bundle 'Shougo/neosnippet'
         Bundle 'kien/ctrlp.vim'
         Bundle 'scrooloose/nerdtree'
         Bundle 'scrooloose/nerdcommenter'
         Bundle 'tpope/vim-surround'
         Bundle 'tpope/vim-repeat'
         Bundle 'matchit.zip'
         Bundle 'bufexplorer.zip'
         Bundle 'Townk/vim-autoclose'
    " }
    "NERD Tree {
        let NERDTreeChDirMode=1
        let NERDTreeWinSize = 25
        let NERDTreeQuitOnOpen = 1
        let NERDTreeShowBookmarks = 1
        map <leader>nb :BookmarkToRoot 
        map <leader>nt :NERDTree<cr>
        map <leader>nc :NERDTreeClose<cr>
    "} 
    "NERD commenter {
        let NERDSpaceDelims=1
        let NERDCompactSexyComs=1
    "}
    "ctrlp {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'        
    "}
    "neocomplcache {
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_auto_select = 1
        let g:neocomplcache_auto_completion_start_length = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_dictionary_filetype_lists = { 
            \ 'default':'', 
            \ 'javascript':$VIMFILES.'/dict/javascript.dict',
            \ 'jquery':$VIMFILES.'/dict/jquery.dict' 
            \ } 
        "Enable omni Completion {
            autocmd FileType php setlocal omnifunc=csscomplete#CompletePHP
            autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
        "}
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand) 
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    "}
    "BufExplorer {
        let g:bufExplorerShowRelativePath=1
        map <leader>be :BufExplorer<cr>
    "}
    "Mark {
        nmap <leader>M <Plug>MarkToggle
        nmap <leader>N <Plug>MarkAllClear
    "}
    "Surround {
        nmap <leader>s ysiw
        nmap <leader>st ysiwt
        nmap <leader>ss yss
    "}
    "Indent {
        let g:html_indent_inctags = "html,body,head,tbody"
        let g:html_indent_script1 = "inc"
        let g:html_indent_style1 = "inc"
    "}
" }

" syntax {
    autocmd bufRead,bufNewFile *.scss set filetype=css
    autocmd bufRead,bufNewFile *.phtml set filetype=php
    autocmd bufRead,bufNewFile *.js set filetype=javascript.jquery
" }

" command {
    nmap mm :%s/\r//g<cr>
"}


