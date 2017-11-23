---
title: Log4j的日志的输出
date: 2017-03-12 00:06:52
---

日志是我们经常用到的。对于java开发的程序员们，log4j是我们再常用不过的了。

这是我在进行1000次查询的过程中发现的问题。
log4j的输出严重影响了程序的效率。

下面是我做的一个实验：


```
 > pom.xml
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-log4j12</artifactId>
    <version>1.7.9</version>
</dependency>

 > main
public static void main(String[] args) {
    log1000Debug();
    log1000SysOut();
}

private static int cout = 10000;

private static void log1000SysOut() {
    long start = System.currentTimeMillis();
    for (int i = 0; i < cout; i++) {
        System.out.println(" i  .. " + i);
    }
    long end = System.currentTimeMillis();
    System.out.println("sout:" + (end - start));
}

private static void log1000Debug() {
    long start = System.currentTimeMillis();
    for (int i = 0; i < cout; i++) {
        log.debug(" i  .. " + i);
    }
    long end = System.currentTimeMillis();
    System.out.println("loger:" + (end - start));
}

 > out
sout:687
loger:3894

```
---

System.out.println 作为 java 的输出已经占用了很大的资源消耗。
如果加上log会更消耗速度。

我要查询1000条数据，加上log的话需要4s左右，去掉或者配成 error ，那么1s内就能够出结果了。这样的提速是非常可观的、


java内字符串 String 和 StringBuffer 的效率也是差别极大的。但并不是所有的情况下都使用 StringBuffer 的。

如果是大量的字符串拼接， StringBuffer 的效率的明显优于 String 的。原因很简单。String new 出来了很多对象，而 StringBuffer 却没有。

