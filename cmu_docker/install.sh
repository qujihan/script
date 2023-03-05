#! /bin/bash
echo "If stuck here, open the clash global proxy"
git clone https://github.com/cmu-db/bustub.git cmu15445
cd cmu15445
git reset --hard d830931a9b2aca66c0589de67b5d7a5fd2c87a79
./build_support/packages.sh 


echo "config clangd"
apt install -y clangd
rm -rf build/
mkdir build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..