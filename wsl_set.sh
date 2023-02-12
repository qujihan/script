#! /bin/bash
# chmod 777 wsl_set.sh

# set mirror
sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
apt update
apt install -y curl git zip unzip stow

# change proxy 
echo "HOST_IP=$(grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)" >> .bashrc
echo "PROXY_ADDR=\"http://\$HOST_IP:7890\"" >> .bashrc
echo "HTTP_PROXY=\$PORXY_ADDR" >> .bashrc
echo "HTTPS_PROXY=\$PORXY_ADDR" >> .bashrc
source .bashrc

# config application
rm -rf .dotfiles/
git clone https://github.com/qujihan/dotfiles.git .dotfiles/
cd .dotfiles
stow neovim
stow git

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
echo "alias vi=\"nvim\"" >> .bashrc
source .bashrc
apt install -y gcc g++ make cmake python3.10-venv
apt install -y ripgrep fd-find
