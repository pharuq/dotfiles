#!/bin/bash

set -u

DOT_DIRECTORY="${HOME}/src/github.com/pharuq/dotfiles"
BIN_DIRECTORY="/usr/local/bin"
VSCODE_SETTING_DIR="${HOME}/Library/Application Support/Code/User"

cd $DOT_DIRECTORY

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv $DOT_DIRECTORY/${f} ${HOME}
done

# homebrew
brew bundle

# bin
cd $DOT_DIRECTORY/bin
for f in *; do
    ln -snfv $DOT_DIRECTORY/bin/${f} $BIN_DIRECTORY
done

# vscode
cd $DOT_DIRECTORY/vscode
for f in *; do
    ln -snfv $DOT_DIRECTORY/vscode/${f} "$VSCODE_SETTING_DIR"
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
