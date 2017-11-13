git submodule update --init --recursive

./vim/install_fonts.sh

# Currently for CompleteMe on ubuntu:
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install cmake python-dev vim-nox-py2

# For ctags
sudo apt install exuberant-ctags

cd .vim/bundle/tern_for_vim && yarn
