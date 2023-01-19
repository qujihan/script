# 常用的一些小文件

1. dockerfile
基于ubuntu:22.04并且换源为清华镜像，在dockerfile所在的文件下使用如下命令
`docker build --build-arg arch=amd64 --build-arg name=jihan -t ubuntu:daily .`
具体可以看文件