---
layout: post
title:  "JqueryEasyUI浅谈本地化应用"
date:   2014-05-08 02:16:00
author:     "郝喜路"
header-img: "//static.haoxilu.net/post-bg.jpg"
tags:
    - 默认
---
 **JqueryEasyUI**** 浅谈本地化应用**

Jquery是对javascript一种封装，使我们开发人员使用起来更加方便，同时也解决了不同浏览器中javascript的兼容性。JqueryEasyUi是基于Jquery上开发的UI组件，和它并行的是JqueryUI，个人认为JqueryUi没有JqueryEasyUi好用，也没有JqueryEasyUi显得专业。

下面先简单介绍一线JqueryEasyUI的使用，在用JqueryEasyUI之前需要引用几个js和css文件

    1. <link href="../jqeryEasyUi/jquery-easyui-1.3.1/themes/default/easyui.css" rel="stylesheet"
    
    2. type="text/css" />
    
    3. <link href="../jqeryEasyUi/jquery-easyui-1.3.1/themes/icon.css" rel="stylesheet"
    
    4. type="text/css" />
    
    5. <script src="../jqeryEasyUi/jquery-easyui-1.3.1/jquery-1.8.0.min.js" type="text/javascript"></script>
    
    6. <script src="../jqeryEasyUi/jquery-easyui-1.3.1/jquery.easyui.min.js" type="text/javascript"></script>

这几个文件在相应的JqueryEasyUI包中存在。（下载地址： [http://www.jeasyui.com/download/v123.php）简单介绍一下几个JqueryEasyUI的例子。这些demo](http://www.jeasyui.com/download/v123.php）简单介绍一下几个JqueryEasyUI的例子。这些demo)其实都可以在 [![clip_image002](http://images.cnitblog.com/blog/578906/201405/081015199791065.jpg "clip\_image002")](http://images.cnitblog.com/blog/578906/201405/081015186352321.jpg)找到。

一、Dialog 弹出的窗口

效果图： [![clip_image004](http://images.cnitblog.com/blog/578906/201405/081015219484165.jpg "clip\_image004")](http://images.cnitblog.com/blog/578906/201405/081015215884823.jpg)

文件引用代码同上。

Script代码：

    1. $(function () {
    
    2. $('#d2').dialog('close');
    
    3. });
    
    4. function open1() {
    
    5. $('#d2').dialog('open');
    
    6. }

窗口处代码（其实就是使用了div）：

    1. <div id="d2" class="easyui-dialog" title="处?|理¤¨a派¨|工?è信?息?é" style="width: 400px; height: 200px;
    
    2. left: 100px; top: 150px; padding: 10px" data-options="toolbar:'#dlg-toolbar',buttons:'#dlg-buttons',resizable:true">
    
    3. <table width="100%" border="0" cellpadding="4" cellspacing="1" class="show-table">
    
    4. <tr>
    
    5. <td>
    
    6. 维?修T人¨?员?à：êo
    
    7. </td>
    
    8. <td>
    
    9. <asp:DropDownList ID="ddlMan" runat="server">
    
    10. </asp:DropDownList>
    
    11. </td>
    
    12. </tr>
    
    13. <tr>
    
    14. <td>
    
    15. 维?修T负o责e人¨?：êo
    
    16. </td>
    
    17. <td>
    
    18. <asp:DropDownList ID="ddlHeadMan" runat="server">
    
    19. </asp:DropDownList>
    
    20. </td>
    
    21. </tr>
    
    22. </table>
    
    23. </div>
    
    24. <div id="dlg-buttons">
    
    25. <a href="#" class="easyui-linkbutton" onclick="allot()">分¤?配?</a>
    
    26. <a href="#" class="easyui-linkbutton" onclick="javascript:$('#d2').dialog('close')">
    
    27. 取¨?消?</a>
    
    28. </div>

总结：对于dialog的使用，最好的方式就是看下载包内的demo，其他的方式也是看demo。

二、日历显示（这里遇到了一点小问题，关于本地化的问题，后面我会贴出解决方案）

效果图： [![clip_image006](http://images.cnitblog.com/blog/578906/201405/081015238703253.jpg "clip\_image006")](http://images.cnitblog.com/blog/578906/201405/081015223386452.jpg)

这是最终的效果，显示的额都是中文，但是当我第一次引用的时候显示的是 [![clip_image008](http://images.cnitblog.com/blog/578906/201405/081015250263939.jpg "clip\_image008")](http://images.cnitblog.com/blog/578906/201405/081015241515039.jpg)

我引用js和css文件都是同上，就是显示是英文的，我想这是什么问题呢，难道这是外国人写的，不支持中文，后来想想也不对，如果外国人写的没有中文的话，目前这么火也会有大神写一个中文包吧。或者他的文件中有猫腻。

然后我就打开了jquery-easyui-1.3.2的包，发现了一个文件件 [![clip_image010](http://images.cnitblog.com/blog/578906/201405/081015265575441.jpg "clip\_image010")](http://images.cnitblog.com/blog/578906/201405/081015262763655.jpg)

我在想这个会不会就是有关本地化的东西。当我打开后发现，果然就是本地化的东西 [![clip_image012](http://images.cnitblog.com/blog/578906/201405/081015282299984.jpg "clip\_image012")](http://images.cnitblog.com/blog/578906/201405/081015279488198.jpg)

。看来外国人写这个软件的时候就已经想到了本地化的东西，看来这个值得我们以后学习。废话不说，直接把easyui-lang-zh\_CN.js引用，一切都OK了。

Js和css引用代码：

    1. <link href="../jqeryEasyUi/jquery-easyui-1.3.1/themes/default/easyui.css" rel="stylesheet"
    
    2. type="text/css" />
    
    3. <link href="../jqeryEasyUi/jquery-easyui-1.3.1/themes/icon.css" rel="stylesheet"
    
    4. type="text/css" />
    
    5. <script src="../jqeryEasyUi/jquery-easyui-1.3.1/jquery-1.8.0.min.js" type="text/javascript"></script>
    
    6. <script src="../jqeryEasyUi/jquery-easyui-1.3.1/jquery.easyui.min.js" type="text/javascript"></script>
    
    7. <script src="../jqeryEasyUi/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>

Div显示日历的代码：

    1. <input name="ctl00$title$TextBox1" type="text" id="ctl00_title_TextBox1" class="easyui-datebox" required="true" />

使用起来就是这么的简单。

郝喜路 2014年5月8日09:53:13

