" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
" set comments=sl:/*,mb:\ *,elx:\ */
set nocompatible              " be iMproved, required
filetype off                  " required
set pastetoggle=<f5>
filetype indent on
set hls
set hidden
" set mouse+=a
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'Syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:DoxygenToolkit_authorName = "BATW Hancao Tong"
let s:licenseTag = "\<enter>"
let s:licenseTag = s:licenseTag . "CONFIDENTIAL - BATW COMPANY\<enter>"
let s:licenseTag = s:licenseTag . "\<enter>"
let s:licenseTag = s:licenseTag . "This is an unpublished work, which is a trade secret, created in\<enter>"
let s:licenseTag = s:licenseTag . "2023. BATW Company owns all rights to this work and intends\<enter>"
let s:licenseTag = s:licenseTag . "to maintain it in confidence to preserve its trade secret status.\<enter>"
let s:licenseTag = s:licenseTag . "BATW Company reserves the right to protect this work as an\<enter>"
let s:licenseTag = s:licenseTag . "unpublished copyrighted work in the event of an inadvertent or\<enter>"
let s:licenseTag = s:licenseTag . "deliberate unauthorized publication.  BATW Company also\<enter>"
let s:licenseTag = s:licenseTag . "reserves its rights under the copyright laws to protect this work\<enter>"
let s:licenseTag = s:licenseTag . "as a published work.  Those having access to this work may not copy\<enter>"
let s:licenseTag = s:licenseTag . "it, use it, or disclose the information contained in it without\<enter>"
let s:licenseTag = s:licenseTag . "the written authorization of BATW Company."
let g:DoxygenToolkit_licenseTag = s:licenseTag
" let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
" let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_templateParamTag_pre = "@Tparam "
let g:DoxygenToolkit_classTag = "@Class "
let g:DoxygenToolkit_briefTag_funcName = "yes"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0

" 允许 airline 在顶部显示 Buffer 列表
let g:airline#extensions#tabline#enabled=1

" 显示 buffer 编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show=1

set completeopt-=preview
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
autocmd FileType java,c,cpp set commentstring=//\ %s
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" set path
set path+=~/workspace/data-management/airflow_dags/airflow_dags_data_verification
set path+=~/workspace/perception_2025
" easy expansion of active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" 允许隐藏被修改过的 buffer
set hidden

" normal 模式下使用 bl 列出 Buffer 列表
nnoremap <silent> bl :ls<CR>

" normal 模式下使用 bo 打开一个新 Buffer
nnoremap <silent> bo :enew<CR>

" normal 模式下使用 bn 切换到下一个 Buffer
nnoremap <silent> bn :bnext<CR>

" normal 模式下使用 bn 切换到上一个 Buffer
nnoremap <silent> bp :bprevious<CR>

nnoremap <silent> <C-J> :bnext<CR>
nnoremap <silent> <C-K> :bprev<CR>
" normal 模式下使用 bd 关闭当前 Buffer
nnoremap bd :ls<CR>:bdelete<Space>

nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-g> :NERDTreeToggleVCS<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nmap <F8> :TagbarToggle<CR>

" set wildmode=longest,full,full
set wildmode=longest,list,full
set wildmenu
