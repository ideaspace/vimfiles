" Base {
    let mapleader = ","
    let g:mapleader = ","
    let $VIMFILES = $VIM.'/vimfiles'
    syntax enable                                       "�Զ��﷨����
    set nocompatible                                    "�ر� vi ����ģʽ
    set bsdir=buffer
    set autochdir                                       "�Զ�����Ŀ¼Ϊ���ڱ༭���ļ����ڵ�Ŀ¼
    set showcmd
    set noswapfile
    set showmatch
    set autoread                                        "�Զ���ȡ�ļ����ⲿ�޸���Ϣ
	set nobackup                                        "�ļ�������
    set backspace=indent,eol,start                      "�����˸�
    set mouse=a
    set nobomb
    set history=500
    set so=1
    set hidden
    set magic
    set wrap
    set clipboard+=unnamed                              "��Windows���������
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
    au GUIEnter * simalt ~ x                            "����ʱ��� 
    set number                                          "��ʾ�к�
    set incsearch                                       "ʵʱ����
    set ignorecase
    set hlsearch                                        "��������
    set magic
    set cursorline                                      "ͻ����ʾ��ǰ��
    set cursorcolumn                                    "ͻ����ʾ��ǰ��
	set ruler                                           "��ʾ״̬�����
    set showmode
    " set linespace=0
    set guioptions-=T                                   "���ع�����
    set guioptions-=m                                   "���ز˵���
    set guifont=consolas:h14:cANSI                      "������������
	set guifontwide=YaHei_Mono:h12:cGB2312              "������������
    colorscheme moria                                   "���� 

    " Stautsline {                                      "�Զ���״̬��
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
        set autoindent									"�Զ�����
        set smartindent								    "��������ʱʹ�������Զ�����
        set shiftwidth=4								"���ð���'<' �� '>'ʱ�����Ŀ��
        set tabstop=4									"����Tab���
        set softtabstop=4								"�����������
        set smarttab									"����Backspaceɾ��һ��Tab���
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


