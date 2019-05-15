syntax on let mapleader=" "
set mouse=a
set hlsearch
set number relativenumber
filetype plugin indent on
filetype plugin on
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamedplus
set spelllang=en_us,de_de

let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_auto_insert_bullets = 1

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'w0rp/ale'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rakr/vim-one'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Townk/vim-autoclose'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ferrine/md-img-paste.vim'
call plug#end()

let g:ale_linters = {'javascript': ['eslint']}
let g:ale_javascript_eslint_executable='npx eslint'

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
command! -nargs=0 Prettier :CocCommand prettier.formatFile

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
let g:table_mode_corner='+'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [{'path': '$VIMWIKI', 'template_path': '$VIMWIKI/templates',
          \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.wiki',
          \ 'path_html': '$VIMWIKI/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
          \ 'html_filename_parameterization': 1,
          \ 'template_ext': '.tpl'}]

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <leader>f :Goyo \| set linebreak<CR>  

set termguicolors
colorscheme one

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

map <C-n> :NERDTreeToggle

map <leader>i :w! \| !mkpdf <c-r>%<CR>
map <leader>o :!opout <c-r>%<CR><CR>
