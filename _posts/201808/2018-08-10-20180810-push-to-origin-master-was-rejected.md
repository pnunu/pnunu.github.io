---
title: push to origin/master was rejected错误解决方案
date: 17:10 2018/8/10
---

idea中，发布项目到OSChina的Git中，当时按照这样的流程添加Git，

然后push，提示：push to origin/master war rejected。

- 解决方案如下：

1.切换到自己项目所在的目录，右键选择GIT BASH Here，Idea中可使用Alt+F12

2.在terminl窗口中依次输入命令：

```
git pull

git pull origin master

git pull origin master --allow-unrelated-histories
```

- 操作

```
> git pull origin master
From https://github.com/pnunu/pnunu-io
 * branch            master     -> FETCH_HEAD
fatal: refusing to merge unrelated histories

> git pull origin master --allow-unrelated-histories
From https://github.com/pnunu/pnunu-io
 * branch            master     -> FETCH_HEAD
Merge made by the 'recursive' strategy.
 .gitignore | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 .gitignore

```


# 删除分支

```
> git branch -d firewalld
Deleted branch firewalld (was 58cd62a).

> git branch
* master

>  git push origin :firewalld
To https://github.com/pnunu/pnunu.github.io.git
 - [deleted]         firewalld
```

## 小结
Git 应该大量使用分支

查看分支：git branch

创建分支：git branch <name>

切换分支：git checkout <name>

创建+切换分支：git checkout -b <name>

合并某分支到当前分支：git merge <name>

删除分支：git branch -d <name>