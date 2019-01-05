DOTFILES=~/Projects/dotfiles

rsync -rv $HOME/.i3 $DOTFILES
rsync -rv $HOME/.config/polybar $DOTFILES/.config
rsync -rv $HOME/.config/urxvtconfig $DOTFILES/.config
rsync -rv $HOME/.config/neofetch $DOTFILES/.config
rsync -rv $HOME/sync.sh $DOTFILES

echo Sync finished
