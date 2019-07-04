nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

map <leader>f :Goyo \| set linebreak<CR>  

map <C-n> :NERDTreeToggle<CR>

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType vimwiki nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

map <leader>i :w! \| !mkpdf <c-r>%<CR>
map <leader>o :!opout <c-r>%<CR><CR>

" FZF key bindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Jump to source
map üü <C-]>

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
