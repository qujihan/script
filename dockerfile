# How to use
#
# docker build --build-arg arch=xxx --build-arg name=xxx -t ubuntu:daily .
# arch=arm | amd54 (default:amd64)
# name=string (default:qujihan)
# eg. If your name is jihan and you are using amd64, use the following command
# docker build --build-arg arch=amd64 --build-arg name=jihan -t ubuntu:daily .
#
# run it
# docker run --name daily -it ubuntu:daily


FROM ubuntu:22.04
ARG arch=amd64
ARG name=qujihan

# change terminal ps
RUN echo PS1=\"[${name}@docker \\W] \\$ \" >> ~/.bashrc

# change sources
RUN if [ ${arch} = amd64 ]; \
    then \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse > etc/apt/sources.list; \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse >> etc/apt/sources.list; \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse >> etc/apt/sources.list; \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse >> etc/apt/sources.list; \
    else \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy main restricted universe multiverse > etc/apt/sources.list; \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-updates main restricted universe multiverse >> etc/apt/sources.list; \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-backports main restricted universe multiverse >> etc/apt/sources.list; \
        echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-security main restricted universe multiverse >> etc/apt/sources.list; \
    fi

# install apps
RUN apt-get update && \
    apt install -y curl git make cmake

