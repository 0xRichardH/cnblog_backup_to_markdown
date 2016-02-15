---
layout: post
title:  "【基础知识】JavaScript基础"
date:   2014-02-12 16:16:00
author:     "郝喜路"
header-img: "//static.haoxilu.net/post-bg.jpg"
tags:
    - 默认
---
【学习日记】JavaScript基础

1,一般写在\<head\>\</head\>中（其实可以放到任意位置）;

2,弹出对话框

    <scripttype="text/javascript">
    
            alert(newDate().toLocaleDateString());
    
    </script>

3，JavaScript可以写在外部文件中

1\>&nbsp; 在外部文件text.JavaScript中编写JavaScript代码

2\>&nbsp; 在heml页面引入外部文件

\<scriptsrc="text.JavaScript"type="text/javascript"\>

\</script\>

4,JavaScript的变量

1\>&nbsp; 可以使用单引号和双引号声明字符串（这是为了和Html集成，避免转义的麻烦）

2\> null:表示空;undefined:表示变量还未初始化（即，未指向任何对象）

3\> 声明变量没有类型一说，变量直接用var修饰

var i = 10;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i ="abc";//嫁鸡随鸡，嫁狗随狗

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(i);

4\>&nbsp; 变量中不用var修饰的变量是“全局变量”（模拟的）,（一般不适用“全局变量”）

5,JavaScript中调试和除错

&nbsp;&nbsp; 在visual studio2010中可以向调试c#应用程序一样进行断点调试

6,判断变量参数初始化（三种方法）

1\>（一般不使用）

    var x;
    
    if (x== null) {
    
                alert("null");
    
            }

2\>(一般不使用)

    if (typeof (x) =="undefined"){
    
                alert("undefined");
    
            }

3\>（推荐使用的）

    var x;
    
    if (!x){
    
                alert("不?x");
    
            }

7，函数的声明

1\>&nbsp; 函数的声明方式

    function add(i1, i2) {
    
    return i1 + i2;
    
            }

2\> 不需要什么返回值类型、参数类型。函数定义以function开头

3\> JavaScript中不像c#中要所有的值都要有返回值类型

8，匿名函数

声明匿名函数，用类似于c#中的委托来执行他

    var f1= function (i1, i2) { returni1 + i2 }
    
                    alert(f1(5,6));

9，用JavaScript的对象来模拟“类”

    functionPerson(name, age) {//声¦¨´明¡Â一°?个?类¤¨¤库a用®?来¤¡ä调Ì¡Â用®?
    
    this.Name= name;//this就¨ª是º?动¡¥态¬?生¦¨²成¨¦的Ì?对?象¨®
    
    this.Age= age;
    
    this.SayHello=function(){
    
                    alert(this.Name+","+this.Age);
    
                }
    
    //下?面?进?行D调Ì¡Â用®?
    
    var p1= new Person("Tom",18);
    
                    p1.SayHello();

10,Arry对象（数组对象：动态生成）:无需预订大小，动态生成

    varnames = new Array();
    
            names[0] = "hxl";
    
            names[1] = "ws";
    
    for (var i = 0; i < names.length; i++) {
    
                alert(names[i]);
    
            }

11，JavaScript中的Dictionary

    varpinyin = new Array();
    
            pinyin["人"] ="ren";
    
            pinyin["生"] ="sheng";
    
            pinyin["如"] ="ru";
    
            pinyin["此"] ="ci";
    
            pinyin["美"] ="mei";
    
            pinyin["好"] ="hao";
    
            alert(pinyin["生"]);

&nbsp;&nbsp;&nbsp;&nbsp; 遍历（类似于java中的foreach），打印出的是数组的序号

    for (var kin pinyin) {
    
                alert(k);
    
            }

12，获取对象所用成员

    for (var ein document) {
    
            alert(e);
    
        }

