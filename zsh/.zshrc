# Path to your oh-my-zsh installation.
export ZSH="/home/philipp/.oh-my-zsh"
export PATH=$PATH:~/.config/composer/vendor/bin

plugins=(
  git
)

POWERLEVEL9K_MODE='nerdfont-complete'

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'

export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export TERM='termite'
export TERMCMD='termite'
export PATH=~/Android/Sdk/platform-tools:$PATH
export ANDROID_HOME=~/Android/Sdk
export FZF_DEFAULT_COMMAND='find . -name .git -prune -o -name node_modules -prune -o -name coverage -prune -o -name tmp -prune -o -type f -print'

alias sudo="sudo "
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias i3config="nvim ~/.i3/config"
alias lampp="/opt/lampp/lampp"
alias ls='lsd'
alias xterm='termite'
alias t='task'
alias vi='nvim'
alias mutt='neomutt'
alias pa='php artisan'
alias xp='xclip -selection clipboard -t image/png -o > '
alias pac='sudo pacman -S'   # install
alias pacu='sudo pacman -Syu'    # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias pacr='sudo pacman -Rs'   # remove
alias pacs='sudo pacman -Ss'      # search
alias paci='sudo pacman -Si'      # info
alias paclo='sudo pacman -Qdt'    # list orphans
alias pacro='paclo && sudo sudo pacman -Rns $(sudo pacman -Qtdq)' # remove orphans
alias pacc='sudo pacman -Scc'    # clean cache
alias paclf='sudo pacman -Ql'   # list files

alias -s {pdf}=evince
bindkey '^ ' autosuggest-accept
neofetch | lolcat


