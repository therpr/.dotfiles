#!/bin/sh

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/idea/.ideavimrc" ~
ln -sfv "$DOTFILES_DIR/.tmux/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/system/.zshrc" ~
ln -sfv "$DOTFILES_DIR/system/.aliases" ~
ln -sfv "$DOTFILES_DIR/system/.exports" ~
ln -sfv "$DOTFILES_DIR/system/.functions" ~

ln -sfv "$DOTFILES_DIR/.tmux" ~
