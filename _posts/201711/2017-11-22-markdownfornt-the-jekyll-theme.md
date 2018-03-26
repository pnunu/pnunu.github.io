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
- 第三种：

    ```
    一级标题
    =======（只需一个=就可以显示出效果，为了美观，可以让=的长度跟标题一样长）
    二级标题
    -------
    ``` 
---

# 列表项
列表项的实现非常简单。无序列表可以使用*、-或+开头，然后空一格开始写列表项的标题即可。如果需要嵌套，使用tab键即可。如下所示：

    * 中国
        * 北京
        * 深圳
        * 成都
    * 美国
        - 纽约
        - 费城
    * 法国
        + 巴黎
        + 马赛 
    * 英国
    
如果需要有序列表的话，那么使用数字+小数点+空格+列表项即可。如下所示：

    1. 冠军
    2. 亚军
    1. 季军 （注：数字可以不连续，但是显示出来的列表项编号是连续的）
    4. 殿军

效果如下：
1. 冠军
2. 亚军
1. 季军 （注：数字可以不连续，但是显示出来的列表项编号是连续的）
4. 殿军


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

# 源代码
作为一个程序猿，在写一些技术文档的时候，常常苦于无法排版出一份漂亮的代码。在Markdown下，事情就变得很简单了。在Mou下，仅仅是使用个Tab键，就可以编辑代码；而在简书下，貌似不支持Tab键，不过可以使用4个空格代替（每次换行都要输入若干个空格，真心不方便）。

    #include <iostream>
    using namespace std;
    int main()
    {
        cout << "Hello world" << endl;
        return 0;
    }

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
[2]: http://pnunu.gitee.io/       "pnunu"
[3]: /images/scribble.png         "Title"  