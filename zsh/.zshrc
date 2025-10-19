# Speed up zsh
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

source $ZSH/antigen.zsh
antigen init $ZSH/.antigenrc

alias sudo='sudo '
alias tor='/opt/tor-browser/tor-browser/start-tor-browser.desktop'
alias vi='nvim'
alias zshconfig='nvim ~/.zshrc'
alias zshenv='nvim ~/.zshenv'
alias nvimconfig='cd ~/.config/nvim && nvim init.lua'
alias i3config='nvim ~/.config/i3/config'
alias polyconfig='nvim ~/.config/polybar/config.ini'
alias termconf='nvim ~/.config/termite/config'
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
alias g='nvim +Neogit +only'
alias ssh='ssh -Y '
# alias ssh='kitten ssh'
alias cd='z'
alias cdi='zi'
alias reboot='systemctl reboot'
alias yay='paru'

bindkey '^ ' autosuggest-accept
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

function $ { "$@" }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f $ZSH/.p10k.zsh ]] && source $ZSH/.p10k.zsh
eval "$(zoxide init zsh)"
