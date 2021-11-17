#!/bin/bash

echo "Installing vim-plug - plugin manager for vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creating .vimrc"
VIMRC_NAME="${HOME}/.vimrc"
VIMRC_BACKUP_NAME="${VIMRC_NAME}.backup"
if [ -f "${VIMRC_NAME}" ]; then
    if [ -f "${VIMRC_BACKUP_NAME}" ]; then
        echo "Can't create backup: file ${VIMRC_BACKUP_NAME} already exists. Create backup manually"
        exit 1
    fi

    mv "${VIMRC_NAME}" "${VIMRC_BACKUP_NAME}"
fi

cp "./vim/vimrc" "${VIMRC_NAME}"


echo "Creating required directories for vim"
mkdir -p "$HOME/.vim/.swp"
mkdir -p "$HOME/.vim/.undo"
mkdir -p "$HOME/.vim/colors"

echo "Downloading colorscheme"
wget -O "$HOME/.vim/colors/wombat256mod.vim" "https://raw.githubusercontent.com/michalbachowski/vim-wombat256mod/master/colors/wombat256mod.vim"

echo "Setting up plugins"
vim "+PlugInstall --sync" +qa
vim "+CocInstall -sync coc-snippets coc-clangd" +qa