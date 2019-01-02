---
title: 用sinopia搭建npm私服
date: 15:43 2019/1/2
---

# 为什么需要搭建私有npm

公司系统逐渐变多。不同的系统可能出现相同的功能，想到java有Nexus可以作为私服，npm也一定有类似的东西。

所以选择了sinopia

## 安装node

下载地址：https://npm.taobao.org/mirrors/node/v6.9.1/

解压缩、配置profile

        [root@localhost node]# tar -zxvf node-v10.15.0-linux-x64.tar.gz
        [root@localhost node]# vim /etc/profile
            export NODE_HOME=/opt/node/node-v10.15.0-linux-x64
            export PATH=$NODE_HOME/bin:$PATH
        [root@localhost node]# source /etc/profile

验证

        [root@localhost node]# node -v
        v10.15.0
        [root@localhost node]# npm -v
        6.4.1
        [root@localhost node]#


## 使用npm 安装 sinopia

        npm install -g sinopia

## 使用npm 安装 pm2

         npm install -g  pm2


## sinopia 的配置文件

        #
        # This is the default config file. It allows all users to do anything,
        # so don't use it on production systems.
        #
        # Look here for more config file examples:
        # https://github.com/rlidwka/sinopia/tree/master/conf
        #

        # path to a directory with all packages
        storage: ./storage  //npm包存放的路径

        auth:
          htpasswd:
            file: ./htpasswd   //保存用户的账号密码等信息
            # Maximum amount of users allowed to register, defaults to "+inf".
            # You can set this to -1 to disable registration.
            max_users: -1  //默认为1000，改为-1，禁止注册

        # a list of other known repositories we can talk to
        uplinks:
          npmjs:
            url: http://registry.npm.taobao.org/  //默认为npm的官网，由于国情，修改 url 让sinopia使用 淘宝的npm镜像地址

        packages:  //配置权限管理
          '@*/*':
            # scoped packages
            access: $all
            publish: $authenticated

          '*':
            # allow all users (including non-authenticated users) to read and
            # publish all packages
            #
            # you can specify usernames/groupnames (depending on your auth plugin)
            # and three keywords: "$all", "$anonymous", "$authenticated"
            access: $all

            # allow all known users to publish packages
            # (anyone can register by default, remember?)
            publish: $authenticated

            # if package is not available locally, proxy requests to 'npmjs' registry
            proxy: npmjs

        # log settings
        logs:
          - {type: stdout, format: pretty, level: http}
          #- {type: file, path: sinopia.log, level: info}

        # you can specify listen address (or simply a port)
        listen: 0.0.0.0:4873  ////默认没有，只能在本机访问，添加后可以通过外网访问。



## 启动 sinopia

启动

        $ sinopia
         warn  --- config file  - .....\AppData\Roaming\sinopia\config.yaml
         warn  --- http address - http://localhost:4873/

如果能正常显示，说明安装成功。

![sinopia](/images/201901/20190102160615-sinopia.png)

## 使用pm2启动

当然，你也可以使用pm2或其他的守护进程进行管理

启动：

        pm2 start `which sinopia`
        或者 pm2 start sinopia

![pm2](/images/201901/20190102154956-pm2.png)


## 客户端使用

强烈推荐使用nrm来管理自己的代理。

- 安装nrm

全局安装nrm可以快速修改,切换,增加npm镜像地址。

        $ npm install -g nrm # 安装nrm
        $ nrm add XXXXX http://XXXXXX:4873 # 添加本地的npm镜像地址
        $ nrm use XXXX # 使用本址的镜像地址

- nrm的其他命令

        $ nrm --help  # 查看nrm命令帮助
        $ nrm list # 列出可用的 npm 镜像地址
        $ nrm use taobao # 使用`淘宝npm`镜像地址

- 安装包

安装完成.之后你通过npm install 安装的包,sinopia都会帮你缓存到本地了.试一下吧。

        mkdir test && cd test
        npm install lodash # sinopia发现本地没有 lodash包,就会从 taobao镜像下载
        rm -rf node-modules # 删除目录
        npm insatll lodash # 第二次安装就会从缓存下载了,速度很快

## 创建用户与发布包

### 创建新用户

1. 确保自己已经切换到配置的代理

          ~ nrm ls
          npm ---- https://registry.npmjs.org/
          cnpm --- http://r.cnpmjs.org/
          taobao - http://registry.npm.taobao.org/
          nj ----- https://registry.nodejitsu.com/
          rednpm - http://registry.mirror.cqupt.edu.cn
          npmMirror  https://skimdb.npmjs.com/registry
        * sinopia  http://192.168.50.163:4873/

2. 运行npm adduser,填写信息，注册账号。如果已经有账号，直接运行npm login即可。

          [root@localhost sinopia]# npm adduser --registry http://192.168.50.163:4873
          Username: ipnunu
          Password:
          Email: (this IS public) ipnunu@qq.com
          Logged in as ipnunu on http://192.168.50.163:4873/.

3. 运行 ``` $ npm publish ``` 发布新包。

# 参考文章

[sinopia 官网介绍](https://www.npmjs.com/package/sinopia)

[使用Sinopia搭建私有的npm仓库](https://segmentfault.com/a/1190000005790827)

[用sinopia搭建npm私服](https://www.cnblogs.com/LittleSix/p/6053549.html)

[使用sinopia搭建私有npm服务](https://blog.csdn.net/jzs_0914/article/details/73201650)

[使用sinopia搭建私有npm服务](https://github.com/jindada/blog/issues/1)

[用sinopia搭建内部npm服务](https://www.cnblogs.com/czf-zone/p/6860457.html)

[简介 | PM2 (推荐)](https://wohugb.gitbooks.io/pm2/content/)

[使用nrm管理npm仓库](https://blog.csdn.net/kongxx/article/details/73350813)
