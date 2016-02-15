---
layout: post
title:  "MySql  Windws 下自动备份脚本"
date:   2014-07-20 10:44:00
author:     "郝喜路"
header-img: "//static.haoxilu.net/post-bg.jpg"
tags:
    - 默认
---
　　这几天正在做一个 &nbsp;使用MySQL数据库的项目，目前项目已经完成了，当部署好项目之后，正在考虑如何自动备份MySql数据库的问题，我在网上找了一下资料终于解决了，特此记录一下。

　　

    1 @echo off
     2 echo.
     3 echo MySQL数据库备份
     4 
     5 echo *****************************
     6 echo.
     7 echo 今天是 %date%
     8 echo 时间是 %time%
     9 echo.
    10 echo *****************************
    11 
    12 
    13 set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"
    14 
    15 md "D:\db_back\%Ymd%"
    16 
    17 "C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump" --opt -Q -u用户名 -p密码 --default-character-set=utf8 数据库名> "D:\db_back\%Ymd%\%Ymd%"_bak.sql"
    18 
    19 echo.
    20 
    21 echo MySQL数据库备份完成，请进行检查。。。
    22 
    23 echo.
    24 echo.
    25 
    26 pause

复制以上代码 生成 bat批处理文件。

然后在windows计划任务中 添加计划即可。。。

郝喜路 &nbsp;记录于：2014年7月20日18:42:18 &nbsp; [&nbsp;http://haoxilu.cnblogs.com](http://i.cnblogs.com/http:/haoxilu.cnblogs.com)

