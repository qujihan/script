# 构建Docker镜像

新建一个文件夹，将dockerfile与install.sh复制进去
命令行cd到这个文件夹
执行下面的命令

```shell
# 注意修改名字!
# 除了hxy使用mac需要将arch修改为arm 其他不用修改
# 这里建议将代理关了
docker build -t cmu15445 --build-arg arch=amd64 --build-arg name=qujihan .

# 运行
docker run --name cmu15445 -it cmu15445

# 进入命令行以后运行下面的
# 如果卡住了就开启clash全局代理
# 如果没有clash可以将代理的端口设置为7890
# 从github clone后建议将代理关了
sed -i -e 's/\r$//' install.sh
./install.sh

# 以后可以在Vscode中运行 也可以通过命令行运行
# 这里基本上用不到
docker exec -it cmu15445 /bin/bash
```