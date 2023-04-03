" Vimtex

let g:polyglot_disabled = ['latex']
let g:vimtex_view_method = 'zathura'
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 0
let g:tex_flavor = "latex"
if has("nvim")
  let g:vimtex_latexmk_progname = 'nvr'
endif

" let g:pandoc#filetypes#pandoc_markdown = 0

"CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ale
let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_javascript_eslint_executable='npx eslint'
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint']
\}

" Snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

" Coc
let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Markdown  
let g:vim_markdown_new_list_item_indent = 2
" let g:vim_markdown_auto_insert_bullets = 1
let g:md_pdf_viewer='zathura'
let g:md_args = "--template eisvogel"

" Table Mode
inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
