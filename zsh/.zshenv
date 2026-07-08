export ZSH=$HOME/.zsh
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export TERM='xterm-kitty'
export BROWSER='/usr/bin/librewolf'
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export ANSIBLE_BASE_DIR=~/Projects/homelab-ansible
export GOPATH=$HOME/go

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
export POWERLEVEL9K_MODE='nerdfont-complete'
export PI_CODING_AGENT_DIR=~/.config/pi

# PATH
path+=~/.local/bin
path+=~/bin
path+=$GOPATH/bin
path+=~/.npm-global/bin
path+=~/Android/Sdk/platform-tools
path+=~/Android/Sdk/emulator
path+=~/Android/Sdk/build-tools/36.1.0
export PATH

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
