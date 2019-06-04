let mapleader=" "
syntax on
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
set spell spelllang=en_us,de_de
set splitright

autocmd BufRead, BufNewFile vimwiki setlocal spell
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_auto_insert_bullets = 1

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/']

call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'w0rp/ale'
Plug 'rakr/vim-one'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'ferrine/md-img-paste.vim'
call plug#end()

let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint']
\}

nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

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
let g:vimwiki_list = [{
    \'path': '$VIMWIKI',
    \'template_path': '$VIMWIKI/templates',
    \'template_default': 'default',
    \'syntax': 'markdown',
    \'ext': '.wiki',
    \'path_html': '$VIMWIKI/html/', 
    \'custom_wiki2html': 'vimwiki_markdown',
    \'html_filename_parameterization': 1,
    \'template_ext': '.html'
    \}]

:nmap <A-CR> <Plug>VimwikiFollowLink
nnoremap łwf <Plug>VimwikiFollowLink
nnoremap łws <Plug>VimwikiSplitLink
nnoremap łwv <Plug>VimwikiVSplitLink
nnoremap łwv <Plug>VimwikiTabnewLink
vnoremap łwn <Plug>VimwikiNormalizeLinkVisualCR
inoremap łwn VimwikiReturn

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType vimwiki nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'


map <leader>f :Goyo \| set linebreak<CR>  

set termguicolors
colorscheme one

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

map <C-n> :NERDTreeToggle<CR>

map <leader>i :w! \| !mkpdf <c-r>%<CR>
map <leader>o :!opout <c-r>%<CR><CR>
