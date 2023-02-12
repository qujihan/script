#! /bin/bash
echo "如果这里卡住就打开clash全局代理"
git clone https://github.com/cmu-db/bustub.git cmu15445
cd cmu15445
git reset --hard d830931a9b2aca66c0589de67b5d7a5fd2c87a79
./build_support/packages.sh 


echo "配置clangd"
apt install -y clangd
rm -rf build/
mkdir build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..