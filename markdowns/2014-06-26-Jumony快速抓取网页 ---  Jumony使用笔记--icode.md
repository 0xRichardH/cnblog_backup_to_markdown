---
layout: post
title:  "Jumony快速抓取网页 ---  Jumony使用笔记--icode"
date:   2014-06-26 12:20:00
author:     "郝喜路"
header-img: "//static.haoxilu.net/post-bg.jpg"
tags:
    - 默认
---
* * *

&nbsp;

作者： [郝喜路](http://weibo.com/haoxilu)&nbsp; &nbsp;个人主页： [http://www.cnicode.com&nbsp;](http://www.cnicode.com)&nbsp; &nbsp; &nbsp; 博客地址： [http://haoxilu.cnblogs.com](http://haoxilu.cnblogs.com)&nbsp; &nbsp; 时间：2014年6月26日 19:25:02

* * *

&nbsp;

　　刚刚在博客园 看到一篇博文《 [使用HttpWebRequest和HtmlAgilityPack抓取网页（拒绝乱码，拒绝正则表达式）](http://www.cnblogs.com/zskbll/p/3809321.html)》 &nbsp;，感觉不错，作者写的也挺好的，然后在看了园子里的朋友的评论后，我知道了有一个更牛x的工具—— [Jumony](https://github.com/Ivony/Jumony)&nbsp;。这个工具用起来可谓称之为简单、高效。 特此记录和分享， [Jumony](https://github.com/Ivony/Jumony)&nbsp;的使用方法。

　　 [Jumony](https://github.com/Ivony/Jumony)是开源项目，目前源代码存放咋GitHub ，源码地址：&nbsp; [https://github.com/Ivony/Jumony](https://github.com/Ivony/Jumony)&nbsp;。我测试使用的是Visual Studio 2012 ,测试网页为博客园。

　　下面介绍使用方法：

　　一、在新建项目后，需要将 [Jumony](https://github.com/Ivony/Jumony)添加到项目中，你可以下载源码使用，也可以在NugGet 中 搜索 Jumony Core 将其添加到项目中并且后自动添加所需的引用。 ![](http://images.cnitblog.com/i/578906/201406/261956567466117.png)

　　二、添加引用之后，即可写项目代码。（此处代码为获取 &nbsp;博客园首页文章内容）

　　

    1 public string Html = string.Empty;//为将拼接好html字符串返回给前台代码
     2 protected void Page_Load(object sender, EventArgs e)
     3 { 5 var htmlSource = new JumonyParser().LoadDocument("http://www.cnblogs.com").Find(".post_item a.titlelnk");
     6 int count = 0;
     7 foreach (var htmlElement in htmlSource)
     8 {
     9 count ++;
    10 Html += string.Format(" <li>{2}、&nbsp;&nbsp;<a href=\"About.aspx?Url={0}\" target=\"_blank\">{1}</a></li>", htmlElement.Attribute("href").Value(), htmlElement.InnerText(),count);
    11 }
    12 }

&nbsp; &nbsp;&nbsp;　　效果图：

　　　　　　　 ![](http://images.cnitblog.com/i/578906/201406/262003379894701.png)

&nbsp;　　三、下面就是要在点击上图从博客园抓取的文章标题之后，在显示博客全文（并非在打开博客园的文章）

　　　　代码：　　　

    1 string html = Request["Url"];
    2 var htmlSource =
    3 new JumonyParser().LoadDocument(html);
    4 HtmlText = htmlSource.Find(".postTitle2").FirstOrDefault().InnerText();
    5 
    6 Html = htmlSource.Find("#cnblogs_post_body").FirstOrDefault().InnerHtml();效果图：

 ![](http://images.cnitblog.com/i/578906/201406/262009158312381.png)

　　到此，网页抓取写完了，没有什么深奥的道理，只是把他的使用方法简单的把代码贴出来了，还没有研究其源码，有时间需要深究一下。

　　Jumony更多的使用方式请参见博客&nbsp; [http://www.cnblogs.com/Ivony/p/3447536.html](http://www.cnblogs.com/Ivony/p/3447536.html)&nbsp;

　　

　　本次演示Jumony快速开发的代码如下（在百度云盘，请自行下载：）：

　　　　 [http://pan.baidu.com/s/1COuCI](http://pan.baidu.com/s/1COuCI)

　　谢谢！
