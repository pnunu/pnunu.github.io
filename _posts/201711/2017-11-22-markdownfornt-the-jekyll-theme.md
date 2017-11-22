---
title: MarkDown 的基本语法 
date: 2017/11/22 9:06 
---

官网介绍：

*Markdown is a text-to-HTML conversion tool for web writers. 
Markdown allows you to write using an easy-to-read, 
easy-to-write plain text format, then convert it to structurally 
valid XHTML (or HTML).*


# 标题设置（让字体变大，和word的标题意思一样）
在Markdown当中设置标题，有两种方式：
- 第一种：通过在文字下方添加“-”。
- 第二种：在文字开头加上 “#”，通过“#”数量表示几级标题。（一共只有1~6级标题，1级标题字体最大）
标题设置（让字体变大，和word的标题意思一样）

---

# 斜体
将需要设置为斜体的文字两端使用1个“*”或者“_”夹起来

*斜体*  
``` *斜体* ```

# 粗体
将需要设置为斜体的文字两端使用2个``` * ```或者``` _ ```夹起来

**粗体** 
``` **粗体** ```

---

# 链接（Links）
Markdown中有两种方式，实现链接，分别为内联方式和引用方式。

内联方式： 
```- This is an [百度](http://www.baidu.com/). ```

引用方式：
``` 
- [GitHub][1].
- [码云][2].

[1]: https://pnunu.github.io/     "pnunu" 
[2]: http://ipnunu.gitee.io/      "ipnunu"  
```
效果：
- This is an [百度](http://www.baidu.com/).
- [GitHub][1].
- [码云][2].

---

# 图片（Images）
图片的处理方式和链接的处理方式，非常的类似。

内联方式：
``` ![Img](/images/scribble.png) ```

效果：
![Img](/images/scribble.png)

引用方式：
``` 
![alt text][id] 

[id]: /path/to/img.jpg "Title"  
```
效果：
![Img2][3] 

---

MarkDown
--------

MarkDown 官网 ： ``` https://daringfireball.net/projects/markdown/ ```

MarkDown 在线编辑器： 

``` 
https://stackedit.io/editor 
http://mahua.jser.me/
http://marxi.co/
```

MarkDown 转化为doc工具 -- pandoc

GitHub 地址：``` https://github.com/jgm/pandoc ```

使用命令：```  pandoc -f markdown -t pdf about.md -o about.pdf ```

---

注释：

内容来自互联网。

[1]: https://pnunu.github.io/     "pnunu" 
[2]: http://ipnunu.gitee.io/      "ipnunu"
[3]: /images/scribble.png         "Title"  