call plug#begin('~/.local/share/nvim/plugged')
Plug 'blindFS/vim-taskwarrior'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lervag/vimtex'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'skywind3000/asyncrun.vim'
Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'rakr/vim-one'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ferrine/md-img-paste.vim'
call plug#end()
