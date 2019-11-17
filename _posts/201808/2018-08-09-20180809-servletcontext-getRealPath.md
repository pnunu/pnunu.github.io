---
title: 如何去解决weblogic 读取项目文件 (servletcontext.getRealPath)
date: 17:41 2018/8/9
---

## 问题描述
项目中有一系列的icon图标，每一种类型对应一种icon。但是产品类型跟icon的个数
和类型都不能确定，不能统一。跟产品沟通后，如果某一类产品没有对应的icon，
可以取一个默认的icon。

解决方法，读取项目中的icon文件，判断其是否存在。来解决如果不存在返回默认icon。

## 出现了第二个问题
关于serveletContext.getRealPath()方法

tomcat部署完全没有问题。但是weblogic却读不到文件。

weblogic取的serveletContext.getRealPath()有问题。。。。


## 1.关于request.getRealPath

问题：
String filename=request.getRealPath(filename)

信息：
warning: [deprecation] getRealPath(java.lang.String) in javax.servlet.ServletRequest has been deprecated

解决：
这个getRealPath方法已经不建议使用了

参看request.getRealPath的java doc:
Deprecated. As of Version 2.1 of the Java Servlet API, use ServletContext.getRealPath(java.lang.String) instead.


而在servlet中使用getServletContext.getRealPath()这个方法受到war 和non-war的影响，以及不同app server实现的影响，运气好的话，
你常常会得到null，嘿嘿，比如你在weblogic上部署war文件，又调用这个方法..

推荐ServletContext.getResourceAsStream


## 2.关于serveletContext.getRealPath返回NULL和不同的app server返回不同的结果

问题：

有几个配置文本配置文件（是一些报表的模板),放在WEB-INF下面的config目录下，程序中是这样得到这个config的实际路径的:
先用 serveletContext.getRealPath得到根路径，tomcat中比如是
c:\tomcat\webapp\test

然后我加上 "/WEB-INF/config/aa.config"，这样得到文件的path然后进行读入，应用在tomcat上跑是ok的，后来将war放到weblogic上，出错，原因是：
在weblogic上用getRealPath得到的是像
myserver\stage\_appsdir_test_war\test.war!\WEB-INF\config....
这样的路径，于是一直报FileNotFoundException

解决：

serveletContext.getRealPath
这个方法在不同的服务器上所获得的实现是不一样的， 建议是通过classloader来获得你配置的资源文件
-------------------


context.getRealPath("/")可能返回了null,你可以输入来看看,
对一个打包的应用来说，是没有RealPath的概念的，调用getRealPath只会简单地返回null。其实，也很

好理解，一个文件被打包入了.war文件，就不存在目录结构了（虽然包中仍然存在目录结构，但这不等同于文件系统中的目录结构）。
所以，对war包中的资源是无法得到RealPath的。这样也就无从通过文件IO进行读取了。

那么，如何读取war包中的资源呢？答案是使用：

ServletContext.getResourceAsStream("/WEB-INF/config/aa.config")方法。
----------------------------------------------------------------------------

```
//HttpServletRequest request
//  String realPath = request.getServletContext().getRealPath("/");  //tomcat 可以这么用。weblogic不行。

String icon = "/public/gzyj_icon/icon.png";
request.getServletContext().getResourceAsStream(icon);
```


原则：基本上就是尽量使用j2ee规范中的各层次classloader来获取资源，而不是试图去找文件的绝对路
径
方法：调用this.getClass().getClassLoader().getResource("/").getPath(); 获取到classes目录的全路径

使用：在得到classes目录的全路径后再根据字符串的截取与拼装达到你的要求即可。



绝对不要使用ServletContext的getRealPath方法获取Web应用的路径！应该使用ServletContext的getResource()方法，
直接使用相对于Web应用根目录的相对路径来获取资源。


说明
可以看到，ServletContext接口中的getResource()等方法，可以找到任何从应用程序的根目录开始的资源。包括在.war包这样的压缩文件中。参数必须以/开头。
而我们常用的getRealPath(“/”)方法，在.war包发布时，就会失效。会返回null。
因此，我们应该避免使用getRealPath(“/”)这样的方法来获取应用程序的绝对路径。

