#!/bin/bash

wd=$(pwd)
echo "Applying new vimrc, creating backup of old file."
mv ~/.vimrc ~/.vimrc.old
cp vimrc_min_py3 ~/.vimrc

echo "Installing Plugin Manager"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Checking if git is already installed"
dpkg -s git 2>&1 >/dev/null
if [[ $? == 1 ]]; then
    echo "Git need to be installed."
    apt install git
else
    echo "Git is installed."
fi

echo "---------------------------------------"
echo "Cloning all necessary git repositories."
echo "---------------------------------------"
echo "If you recieve many fatal messages, it just means that they are already installed."
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/bling/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/flazz/vim-colorschemes
echo "--------------------------------------------"
echo "Done cloning all necessary git repositories."
echo "--------------------------------------------"
cd $wd

echo "Checking if python-pip is already installed"
dpkg -s python3-pip 2>&1 >/dev/null
if [[ $? == 1 ]]; then
    echo "Python-pip need to be installed."
    distro=$(lsb_release -i | cut -f 2)
    if [[ $distro == "Univention" ]]; then
        echo "Distribution is Univention. Activating unmaintained repos."
        ucr set repository/online/unmaintained='yes'
        apt update 2>&1 >/dev/null
    fi
    apt install python3-pip
else
    echo "python3-pip is installed."
fi

echo "Checking if flake8 is already installed"
pip3 list | grep flake8 2>&1 >/dev/null
if [[ $? == 1 ]]; then
    echo "Installing Flake 8"
    pip3 install flake8
else
    echo "Flake 8 is installed"
fi

# Sehr alte Verionen von pip haben ein Problem mit http/https
# Zudem werden Abhaengigkeiten nicht korrekt aufgeloest.
# Um das zu umgehen helfen diese 3 Befehle:
#
# pip install --index-url=https://pypi.python.org/simple/ setuptools-scm
# pip install --index-url=https://pypi.python.org/simple/ pytest-runner
# pip install --index-url=https://pypi.python.org/simple/ flake8
