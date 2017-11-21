---
title: Jekyll 的本地调试环境的配置 
date: 2017-11-21 22:15:01
---

为什么要使用Jekyll？
首先Jekyll是一个静态博客、简单的免费的Blog生成工具。喜欢谢博客的同学都知道这样的好处。
jekyll只是一个生成静态网页的工具，不需要数据库支持。jekyll支持强大的markdown编辑模式。
Jekyll还拥有大量的漂亮的模版。
最重要的全球最大的屌丝集中营 GitHub Page 支持Jekyll。

废话不多说，以下为正文

> 基本环境：ruby环境安装

Ruby 官网中文文档： ``` http://www.ruby-lang.org/zh_cn/documentation/installation/ ```
Ruby 下载地址： ``` http://www.ruby-lang.org/en/downloads/ ```

安装步骤不再介绍，傻瓜式安装。。。

切换淘宝ruby源；
```
$ gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
$ gem sources -l
```

---
> Jekyll 安装

Jekyll 官网（中文）： ``` http://jekyll.com.cn/ ```
Jekyll 官网： ``` https://jekyllrb.com/ ```
```
~ $ gem install jekyll
~ $ jekyll new my-awesome-site
~ $ cd my-awesome-site
~ $ #  gem install bundle
~/my-awesome-site $ jekyll serve
```
![Jekyll](/images/201711/20171121-jekyll-1.png)


安装步骤
```
# Install Jekyll and Bundler gems through RubyGems
gem install jekyll bundler

# Create a new Jekyll site at ./myblog
jekyll new myblog

# Change into your new directory
cd myblog

# Build the site on the preview server
bundle exec jekyll serve

# Now browse to http://localhost:4000
```

---

> 成功启动

``` bundle exec jekyll serve ```
看到如下内容，说明安装成功且启动成功
![Jekyll](/images/201711/20171121-jekyll-2.png)
访问浏览器，默认主题的效果
![Jekyll](/images/201711/20171121-jekyll-3.png)


注：
如果启动报错

查看 4000 端口是否有进程已经占用。
> netstat -aon | findstr "4000"