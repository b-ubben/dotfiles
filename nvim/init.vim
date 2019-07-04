scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Remap leader key to ,
let g:mapleader=';'

" Disable line numbers
set nonumber

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === NeoSnippet === "
" Map <C-k> as shortcut to activate snippet if available
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories and files
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Nodes will be sorted by case then by natural order
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeNaturalSort = 1

" Highlight NERDTree cursor line
let g:NERDTreeHighlightCursorLine = 1

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx-pretty ===
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'

" === Tagalong ===
let g:tagalong_additional_filetypes = ['js']

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors
let ayucolor='mirage'
colorscheme ayu

" === Lightline ===
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Integration with ALE
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE gui=NONE
hi! NonText ctermbg=NONE guibg=NONE cterm=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE

" Customize NERDTree
hi! NERDTreeCWD guifg=#fafafa
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Clear highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>w <Plug>(easymotion-bd-w)

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Fix on save
let g:ale_fix_on_save = 1
