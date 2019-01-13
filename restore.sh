DOTFILES=~/Projects/dotfiles

rsync -rv $DOTFILES/.i3 $HOME
rsync -rv $DOTFILES/.zshrc $HOME
rsync -rv $DOTFILES/.config/polybar $HOME/.config
rsync -rv $DOTFILES/.config/urxvtconfig $HOME/.config
rsync -rv $DOTFILES/.config/neofetch $HOME/.config
rsync -rv $DOTFILES/.config/ranger $HOME/.config
rsync -rv $DOTFILES/.layouts $HOME
rsync -rv $DOTFILES/sync.sh $HOME
rsync -rv $DOTFILES/restore.sh $HOME

echo Restore finished
