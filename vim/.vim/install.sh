#!/bin/sh

set -e

# Install nvim
sudo apt remove vim-tiny
sudo apt install -y vim fzf silversearcher-ag tmux zathura latexmk git curl

# Install ctags (for tagbar)
echo '[*] App installing dependencies for tagbar (exuberant-ctags) ...'
sudo apt update
sudo apt install -y exuberant-ctags global


# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# (Optional but recommended) Install a nerd font for icons and a beautiful lightline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)
echo "[*] Downloading patch font into ~/.local/share/fonts ..."
curl -fLo ~/.local/share/fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf

# Enter vim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
echo '[*] Running :PlugInstall within nvim ...'
vim +PlugInstall +qa

echo "[+] Done, welcome to \\033[1m\\033[92mVim\\033[0m! Try it by running: vim."
