# 使用 alpine 镜像作为基础镜像
FROM golang:1.20-alpine AS build

WORKDIR /SmsBoom
# 拷贝执行文件
COPY . /SmsBoom/

RUN echo "Contents of /:" && ls -l /SmsBoom

# 下载依赖并编译源码
RUN cd /SmsBoom \
    go mod tidy && \
    go build -o main /SmsBoom/

RUN chmod +x ./*

# 定义容器启动时执行的命令
CMD ["/SmsBoom/main"]
