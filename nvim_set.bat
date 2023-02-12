@echo off
echo "Update neovim"
git clone https://github.com/qujihan/dotfiles.git
rmdir /S /Q C:\Users\Qu\AppData\Local\nvim
mkdir C:\Users\Qu\AppData\Local\nvim
Xcopy /S /Q C:\Users\Qu\dotfiles\neovim\.config\nvim C:\Users\Qu\AppData\Local\nvim\
rmdir /S /Q C:\Users\Qu\dotfiles
echo "Update neovim end"