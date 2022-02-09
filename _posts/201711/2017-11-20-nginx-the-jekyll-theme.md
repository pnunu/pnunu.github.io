---
title: nginx 安装  
date: 2017-11-20 00:06:52
---


---

# 安装所需环境
> Centos 7(+)

---

## 1、gcc 安装
安装 nginx 需要先将官网下载的源码进行编译，编译依赖 gcc 环境，如果没有 gcc 环境，则需要安装：
``` yum install gcc-c++  ``` 
## 2、pcre pcre-devel 安装
PCRE(Perl Compatible Regular Expressions) 是一个Perl库，包括 perl 兼容的正则表达式库。nginx 的 http 模块使用 pcre 来解析正则表达式，所以需要在 linux 上安装 pcre 库，pcre-devel 是使用 pcre 开发的一个二次开发库。nginx也需要此库。
安装命令： ```  yum install -y pcre pcre-devel ``` 
## 3、zlib 安装
zlib 库提供了很多种压缩和解压缩的方式， nginx 使用 zlib 对 http 包的内容进行 gzip ，所以需要在 Centos 上安装 zlib 库。
``` yum install -y zlib zlib-devel  ``` 
## 4、OpenSSL 安装
OpenSSL 是一个强大的安全套接字层密码库，囊括主要的密码算法、常用的密钥和证书封装管理功能及 SSL 协议，并提供丰富的应用程序供测试或其它目的使用。
nginx 不仅支持 http 协议，还支持 https（即在ssl协议上传输http），所以需要在 Centos 安装 OpenSSL 库。
``` yum install -y openssl openssl-devel ``` 
## 5、nginx 安装下载
> 下载： ``` wget -c https://nginx.org/download/nginx-1.10.1.tar.gz ```

#### 解压
依然是直接命令：
``` 
tar -zxvf nginx-1.10.1.tar.gz
cd nginx-1.10.1
```
#### 配置

其实在 nginx-1.10.1 版本中你就不需要去配置相关东西，默认就可以了。当然，如果你要自己配置目录也是可以的。
``` ./configure --prefix=~/nginx/ ```

#### 编译安装
```
make
make install
```
查找安装路径：
```
whereis nginx
```

## 6、启动、停止nginx
```
cd /usr/local/nginx/sbin/
./nginx 
./nginx -s stop
./nginx -s quit
./nginx -s reload
./nginx -s quit:此方式停止步骤是待nginx进程处理任务完毕进行停止。
./nginx -s stop:此方式相当于先查出nginx进程id再使用kill命令强制杀掉进程。
```
## 7、.重新加载配置文件：
当 ngin x的配置文件 nginx.conf 修改后，要想让配置生效需要重启 nginx，使用-s reload不用先停止 ngin x再启动 nginx 即可将配置信息在 nginx 中生效，如下：
```
./nginx -s reload
```

---

测试图片：
![nginx](/images/201711/20171120-nginx-install.png)
