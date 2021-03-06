map <C-n> :NERDTreeToggle<CR>

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType vimwiki nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd BufRead,BufNewFile *neomutt* set filetype=markdown

map <leader>i :w! \| !mkpdf <c-r>%<CR>
map <leader>o :!opout <c-r>%<CR><CR>

" FZF key bindings
nnoremap <C-f> :FZF<CR>
nnoremap <A-f> :Rg<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Jump to source
map üü <C-]>

" Coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <A-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-j> <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <c-space> coc#refresh()

" Stop middle mousebutton paste
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
:map <2-MiddleMouse> <Nop>
:imap <2-MiddleMouse> <Nop>
:map <3-MiddleMouse> <Nop>
:imap <3-MiddleMouse> <Nop>
:map <4-MiddleMouse> <Nop>
:imap <4-MiddleMouse> <Nop>
