---
title: Hexo + Next踩坑
tags:
  - hexo
categories:
  - hexo
abbrlink: 896459f8
date: 2020-09-10 13:03:37
---

前前后后搞了快有一个星期的时间 终于把这个博客给搭起来了...

用的是hexo + Git pages + Next theme 现在回过头来看其实这些都并不是很难 

真正麻烦的地方就在于next的theme的一些配置都已经更新了(主要是他们人多力量大)

但是很多教程并没有随着更新 尤其是各种插件这一块 所以还是踩了不少的坑

<!-- more -->

​    

### Next theme 的config文件配置

#### **用Alternate Theme Config**

因为next他们这个theme的更新速度是很快的 如果直接从repo上面拉代码下来很容易产生conflict

所以所有theme的主题配置推荐使用Alternate Theme Config

主要的逻辑就是用根目录下的

``` bash
_config.next.yml
```

代替原本的theme里面的config文件 具体参照下面的官方博客链接

[使用Alternate Theme Config](https://theme-next.js.org/docs/getting-started/configuration.html)

  

#### **配置暗黑风格的scheme**

最新的next theme支持了暗黑风格主题 这个很赞

我的博客用了 Gemini  + Dark 看上应该是舒服多了

[Dark scheme config](https://theme-next.js.org/docs/theme-settings/index.html?highlight=scheme)

​    

### Next theme 的插件优化

#### **使用不蒜子显示访客人数**

next theme的最新版已经在配置中集成了显示访客人数的功能

不需要你再费劲的去改.njk文件了 

但是网上能找的教程 目前很多还都是让你去改动layout里面的footer.ejs 

这实在是画蛇添足的举动 具体可以直接看下面官方博客的链接

[使用不蒜子](https://theme-next.js.org/docs/third-party-services/statistics-and-analytics.html?highlight=busuanz)

  

#### **使用Gitalk的评论系统**

Next theme内置支持很多评论系统 然而我试了一下其中很多跟暗黑主题风格不搭配

另外说一句 虽然它官方博客上也写了支持国内的几个评论系统

但是我研究了一下发现都需要实名注册 实在是感觉不怎么安全 说不定以后就会给你因为各种理由停掉...

所以最后还是选用了Gitalk这一套 虽然说管理的体验一般 但是好看呀！

[使用Gitalk](https://theme-next.js.org/docs/third-party-services/comments.html)

​    

### 本地预览与上传更新

这里我写了一个.sh文件集成了几个简单的hexo命令 

在root目录下创建```deploy.sh```

``` bash
yourname.github.io/deploy.sh
```
``` bash
echo -e "清除旧文件"
hexo clean
echo -e "\t\t......OK\n正在【生成】静态页面"
hexo g
if [ $1 == 'p' ]
then
    echo -e "\t\t......OK\n正在【预览】静态页面"
    hexo s
    echo "预览完成"
fi
if [ $1 == 'g' ]
then
    echo -e "\t\t......OK\n正在【发布】静态页面"
    hexo d
    echo "发布完成"
fi
```

这样只要在run命令的时候输入不同的参数就可以完成本地预览或者部署到git

```bash
$./deploy.sh [Location]
Location Options:
 --p local preview
 --g deploy to the GitHub  
```

​    

**更多配置文件和插件请参考官方博客** [Next Them Official](https://theme-next.js.org/)

