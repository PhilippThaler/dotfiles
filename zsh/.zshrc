source $ZSH/antigen.zsh
antigen init $ZSH/.antigenrc

[ -f $ZSH/.fzf.zsh ] && source $ZSH/.fzf.zsh

alias sudo='sudo '
alias tor='/opt/tor-browser/tor-browser/start-tor-browser.desktop'
alias vi='nvim'
alias zshconfig='nvim ~/.zshrc'
alias zshenv='nvim ~/.zshenv'
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias i3config='nvim ~/.config/i3/config'
alias polyconfig='nvim ~/.config/polybar/config.ini'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias anticonf='nvim ~/.zsh/.antigenrc'
alias muttconf='nvim ~/.config/mutt/muttrc'
alias ls='lsd'
alias l='lsd -lah'
alias t='task'
alias vi='nvim'
alias mutt='neomutt'
alias ':q'='exit'
alias sctl='sudo systemctl'
alias cat='bat'
alias g='nvim +Git +only'
alias yay='paru'
alias ssh='ssh -Y '
# [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh -Y"

bindkey '^ ' autosuggest-accept
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f $ZSH/.p10k.zsh ]] && source $ZSH/.p10k.zsh
