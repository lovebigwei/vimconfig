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
set textwidth=500
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
set relativenumber
" highlight matching braces
set showmatch
" intelligent comments
" set comments=sl:/*,mb:\ *,elx:\ */
set nocompatible              " be iMproved, required
filetype off                  " required
set pastetoggle=<f5>
filetype indent on
set hls
set incsearch
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
Plugin 'tell-k/vim-autopep8'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'morhetz/gruvbox'
Plugin 'nordtheme/vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'junegunn/vim-peekaboo'
Plugin 'CoderCookE/vim-chatgpt'
Plugin 'takac/vim-hardtime'
Plugin 'prabirshrestha/vim-lsp'

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
set path+=~/workspace/perception_2025/python
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

nnoremap <silent> <C-j> <C-e>
nnoremap <silent> <C-k> <C-y>
" normal 模式下使用 bd 关闭当前 Buffer
nnoremap bd :ls<CR>:bdelete<Space>

nnoremap <Leader>b :ls<CR>:b<Space>
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-g> :NERDTreeToggleVCS<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap gb M:b# <CR>
nnoremap <C-]> *<C-]>

nmap <F8> :TagbarToggle<CR>

" set wildmode=longest,full,full
set wildmode=longest,list,full
" set wildmenu

" Auto-format Python files with autopep8
autocmd FileType python noremap <buffer> <Leader>py :call Autopep8()<CR>

" Auto-format Python files with LSP
autocmd BufWritePost *.py LspDocumentFormat

"visual selection
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_file_list_command = 'rg --files'

let g:rainbow_active = 1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    " set t_8f=␛[38;2;%lu;%lu;%lum
    " set t_8b=␛[48;2;%lu;%lu;%lum
    set termguicolors
  endif
endif

if executable('ruff')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ruff',
        \ 'cmd': {server_info->['ruff', 'server']},
        \ 'allowlist': ['python'],
        \ 'workspace_config': {},
        \ })
endif

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
"gpt config
let g:api_type = 'azure'
let g:chat_gpt_key = ''
let g:azure_endpoint = ''
let g:azure_deployment = 'GPT-4-32K'
let g:azure_api_version = '2024-05-01-preview'
"hard time on
let g:hardtime_default_on = 0
" disable diagnostics support
let g:lsp_diagnostics_enabled = 0
