set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
runtime macros/matchit.vim


call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Git
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Language Support
Plug 'pangloss/vim-javascript'
" Plug 'tell-k/vim-autopep8'
" Plug 'python-mode/python-mode'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

" Efficiency
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
" Plug 'ervandew/supertab'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
" Plug 'Raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nelstrom/vim-visual-star-search'

" Snippets
Plug 'honza/vim-snippets'
" Plug 'ternjs/tern_for_vim'

" Lint
" Plug 'vim-syntastic/syntastic'
" Plug 'ruanyl/vim-eslint', {'do': 'npm install'}

" Beautify
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'sheerun/vim-polyglot'
" Plug 'posva/vim-vue'
Plug 'ap/vim-css-color', { 'for': 'css' }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Plug 'heavenshell/vim-prettier'

" Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'arzg/vim-colors-xcode'
Plug 'sainnhe/edge'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'jdsimcoe/panic.vim'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
if !has('gui_running')
  set t_Co=256
endif

syntax enable "Javascript syntax highlight
syntax on
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1 
let g:edge_disable_italic_comment = 1
let g:edge_popup_menu_selection_background = 'green'
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg='#0f3640'   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#182d49' ctermbg=4
colorscheme onedark
" colorscheme solarized
" colorscheme xcodedark
" colorscheme polar
" colorscheme neon
" colorscheme edge
" colorscheme synthwave84
" colorscheme monokai
" colorscheme gruvbox
" colorscheme panic

syn on "语法支持
set laststatus=2 "始终显示状态栏
set backspace=2 "insert模式下退格键删除
set tabstop=4 "一个制表符的长度
set softtabstop=4 "一个制表符的实际长度
set shiftwidth=4 "一个缩进的长度
set expandtab "使用空格替代制表符
set smarttab "智能制表符
set autoindent "自动缩进
set smartindent "只能缩进
set number "显示行号
set rnu "显示行号
set ruler "显示位置指示器
set backupdir=/tmp "设置备份文件目录
set directory=/tmp "设置临时文件目录
set ignorecase "检索时忽略大小写
set smartcase "智能忽略大小写
set infercase
set hls "检索时高亮显示匹配项
set is "增量查找
set helplang=cn "帮助系统设置为中文
set foldmethod=syntax "代码折叠
set nofoldenable "关闭代码折叠"
set showmatch "代码匹配
set cursorline "highlight current line
set autoread "自动读入外部修改
set fileencodings=utf-8,gbk 
set nrformats=
set wildmenu
set wildmode=full
set history=1000
set encoding=utf8
set splitright
set splitbelow
set cursorline
" set guifont=DroidSansMono\ Nerd\ Font
set guifont=Hack\ Nerd\ Font
"set path=., ,** "当前文件目录(.)当前目录( )当前目录下所有子目录(**)

" =============== KEYMAP BEGIN ===============
let mapleader = ','
noremap \ ,
nnoremap ` '
nnoremap ' `
noremap <silent> n nzz
noremap <silent> N Nzz
noremap <silent> * *zz
noremap <silent> # #zz
noremap <silent> g* g*zz
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader>t :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
inoremap <C-b> <Left>
inoremap <C-f> <Right>
vnoremap < <gv
vnoremap > >gv
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" nmap <CR> o<Esc>
map Y y$
noremap <silent><leader>/ :nohls<CR>

" copy and paste
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>P "+P

" vertical split resize
nmap <C-w>[ :vertical resize -10<CR>
nmap <C-w>] :vertical resize +10<CR>

" Go to last active tab
" au TabLeave * let g:lasttab = tabpagenr()
" nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
cmap w!! w !sudo tee % > /dev/null
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

map <leader>r :set rnu! rnu?<CR>
map <leader>e :CocCommand explorer --toggle<CR>

" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" imap <Tab> <Plug>delimitMateS-Tab

" =============== KEYMAP END ===============

" custom settings
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1
let g:javascript_plugin_flow=1
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \ }
" let g:ycm_min_num_of_chars_for_completion = 3 
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_complete_in_comments = 1
" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType="<C-n>"

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Ingnore *.pyc
let NERDTreeIgnore = ['\.pyc$']
" enable line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" NERDCommenter
let g:ft = ''
let g:NERDSpaceDelims=1
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" delimitMate
" let g:delimitMate_expand_cr=1
" let g:delimitMate_expand_space=1

" CtrlP ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_map = '<M-p>'

" Sneak
" let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" autocmd FileType javascript,vue set formatprg=prettier-eslint\ --stdin
" autocmd BufWritePost *.js,*.vue :call prettier#run(1)
" autocmd BufWritePre *.js :call s:prettier_eslint_cli()
" autocmd BufWritePre *.js,*.vue exe "normal! gggqG\<C-o>\<C-o>"
" autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNewFile .prettierrc setlocal filetype=json

function! s:prettier_eslint_cli()
    let l:win_view = winsaveview()
    " let l:save_pos = getpos('.')
    normal gggqG
    " call setpos('.', l:save_pos)
    call winrestview(l:win_view)
endfunction    

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['eslint']

" lightline
" let g:lightline = {
  " \ 'active': {
  " \   'left': [
  " \     [ 'mode', 'paste' ],
  " \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  " \   ]
  " \ }
" \ }
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'git', 'readonly', 'filename', 'modified', 'cocstatus', 'currentfunction']
  \   ],
  \   'right':[
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'blame' ],
  \     [ 'filetype', 'fileencoding', 'fileformat', 'charvaluehex' ]
  \   ],
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'git': 'fugitive#head',
  \   'diagnostic': 'StatusDiagnostic',
  \   'blame': 'LightlineGitBlame'
  \ }
\ }

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

function! LightlineGitBlame() abort
  " let blame = get(b:, 'coc_git_blame', '')
  " return blame
  " return winwidth(0) > 120 ? blame : ''
  return get(b:, 'coc_git_blame', '')
endfunction

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline


autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

command! -nargs=0 -bang VimMetaInit call Terminal_MetaMode(<bang>0)

source ~/dotfiles/.coc.nvimrc

