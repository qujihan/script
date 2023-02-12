# 构建Docker镜像
Note:在此目录下运行一下命令
```shell
# 注意修改名字
docker build -t cmu15445 --build-arg arch=amd64 --build-arg name=qujihan .

# 运行
docker run --name cmu15445 -it cmu15445

# 以后可以在Vscode中运行 也可以通过命令行运行
docker exec -it cmu15445 /bin/bash
```


# 第一次运行
```shell
./autoset.sh
```

用vscode连接以后下载clangd插件就可以了