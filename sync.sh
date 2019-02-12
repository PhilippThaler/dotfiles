DOTFILES=$HOME/Projects/dotfiles

rsync -rv $HOME/.i3 $DOTFILES
rsync -rv $HOME/.Xresources $DOTFILES
rsync -rv $HOME/.zshrc $DOTFILES
rsync -rv $HOME/.config/polybar $DOTFILES/.config
rsync -rv $HOME/.config/urxvtconfig $DOTFILES/.config
rsync -rv $HOME/.config/neofetch $DOTFILES/.config
rsync -rv $HOME/.config/ranger $DOTFILES/.config
rsync -rv $HOME/.layouts $DOTFILES/.layouts
rsync -rv $HOME/sync.sh $DOTFILES
rsync -rv $HOME/restore.sh $DOTFILES
rsync -rv $HOME/.vimrc $DOTFILES
rsync -rv $HOME/.config/nvim $DOTFILES/.config

echo Sync finished
