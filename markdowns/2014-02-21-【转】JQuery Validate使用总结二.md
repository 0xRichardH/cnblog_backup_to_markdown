---
layout: post
title:  "【转】JQuery Validate使用总结二"
date:   2014-02-21 04:39:00
author:     "郝喜路"
header-img: "//static.haoxilu.net/post-bg.jpg"
tags:
    - 默认
---
[Jquery Validate使用总结一](http://www.cnblogs.com/haoxilu/p/3559184.html)

五、常用方法及注意问题   
1.用其他方式替代默认的SUBMIT   
$().ready(function() {   
 $("#signupForm").validate({   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; submitHandler:function(form){   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert("submitted");&nbsp;&nbsp;   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; form.submit();   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;   
&nbsp;&nbsp;&nbsp; });   
});   
可以设置validate的默认值，写法如下：   
$.validator.setDefaults({   
 submitHandler: function(form) { alert("submitted!");form.submit(); }   
});   
如果想提交表单, 需要使用form.submit()而不要使用$(form).submit()   
2.debug，只验证不提交表单   
如果这个参数为true，那么表单不会提交，只进行检查，调试时十分方便

$().ready(function() {   
 $("#signupForm").validate({   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debug:true   
&nbsp;&nbsp;&nbsp; });   
});   
如果一个页面中有多个表单都想设置成为debug，用   
$.validator.setDefaults({   
&nbsp;&nbsp; debug: true   
})   
3.ignore：忽略某些元素不验证   
ignore: ".ignore"   
4.更改错误信息显示的位置   
errorPlacement：Callback   
 Default: 把错误信息放在验证的元素后面   
指明错误放置的位置，默认情况是：error.appendTo(element.parent());即把错误信息放在验证的元素后面   
errorPlacement: function(error, element) {&nbsp;   
&nbsp;&nbsp;&nbsp; error.appendTo(element.parent());&nbsp;   
}   
//示例：   
\<tr\>   
&nbsp;&nbsp;&nbsp; \<td class="label"\>\<label id="lfirstname" for="firstname"\>First Name\</label\>\</td\>   
&nbsp;&nbsp;&nbsp; \<td class="field"\>\<input id="firstname" name="firstname" type="text" value="" maxlength="100" /\>\</td\>   
&nbsp;&nbsp;&nbsp; \<td class="status"\>\</td\>   
\</tr\>   
\<tr\>   
&nbsp;&nbsp;&nbsp; \<td style="padding-right: 5px;"\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<input id="dateformat\_eu" name="dateformat" type="radio" value="0" /\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<label id="ldateformat\_eu" for="dateformat\_eu"\>14/02/07\</label\>   
&nbsp;&nbsp;&nbsp; \</td\>   
&nbsp;&nbsp;&nbsp; \<td style="padding-left: 5px;"\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<input id="dateformat\_am" name="dateformat" type="radio" value="1"&nbsp; /\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<label id="ldateformat\_am" for="dateformat\_am"\>02/14/07\</label\>   
&nbsp;&nbsp;&nbsp; \</td\>   
&nbsp;&nbsp;&nbsp; \<td\>\</td\>   
\</tr\>   
\<tr\>   
&nbsp;&nbsp;&nbsp; \<td class="label"\>&nbsp;\</td\>   
&nbsp;&nbsp;&nbsp; \<td class="field" colspan="2"\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<div id="termswrap"\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<input id="terms" type="checkbox" name="terms" /\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<label id="lterms" for="terms"\>I have read and accept the Terms of Use.\</label\>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \</div\>   
&nbsp;&nbsp;&nbsp; \</td\>   
\</tr\>   
errorPlacement: function(error, element) {   
&nbsp;&nbsp;&nbsp; if ( element.is(":radio") )   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error.appendTo( element.parent().next().next() );   
&nbsp;&nbsp;&nbsp; else if ( element.is(":checkbox") )   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error.appendTo ( element.next() );   
&nbsp;&nbsp;&nbsp; else   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error.appendTo( element.parent().next() );   
}   
代码的作用是：一般情况下把错误信息显示在\<td class="status"\>\</td\>中，如果是radio显示在\<td\>\</td\>中，如果是 checkbox显示在内容的后面   
errorClass：String&nbsp; Default: "error"   
指定错误提示的css类名，可以自定义错误提示的样式   
errorElement：String&nbsp; Default: "label"   
用什么标签标记错误，默认的是label你可以改成em   
errorContainer：Selector   
显示或者隐藏验证信息，可以自动实现有错误信息出现时把容器属性变为显示，无错误时隐藏，用处不大   
errorContainer: "#messageBox1, #messageBox2"   
errorLabelContainer：Selector   
把错误信息统一放在一个容器里面。   
wrapper：String   
用什么标签再把上边的errorELement包起来   
一般这三个属性同时使用，实现在一个容器内显示所有错误提示的功能，并且没有信息时自动隐藏   
errorContainer: "div.error",   
errorLabelContainer: $("#signupForm div.error"),   
wrapper: "li"   
5更改错误信息显示的样式   
设置错误提示的样式，可以增加图标显示，在该系统中已经建立了一个validation.css专门用于维护校验文件的样式   
input.error { border: 1px solid red; }   
label.error {   
&nbsp; background:url("./demo/images/unchecked.gif") no-repeat 0px 0px;   
&nbsp; padding-left: 16px;   
&nbsp; padding-bottom: 2px;   
&nbsp; font-weight: bold;   
&nbsp; color: #EA5200;   
}   
label.checked {   
&nbsp; background:url("./demo/images/checked.gif") no-repeat 0px 0px;   
}   
6每个字段验证通过执行函数   
success：String,Callback   
要验证的元素通过验证后的动作，如果跟一个字符串，会当做一个css类，也可跟一个函数   
success: function(label) {   
&nbsp;&nbsp;&nbsp; // set &nbsp; as text for IE   
&nbsp;&nbsp;&nbsp; label.html("&nbsp;").addClass("checked");   
&nbsp;&nbsp;&nbsp; //label.addClass("valid").text("Ok!")   
}   
添加"valid" 到验证元素, 在CSS中定义的样式\<style\>label.valid {}\</style\>   
success: "valid"   
7验证的触发方式修改   
下面的虽然是boolean型的，但建议除非要改为false,否则别乱添加。   
onsubmit：Boolean&nbsp; Default: true   
提交时验证. 设置唯false就用其他方法去验证   
onfocusout：Boolean&nbsp; Default: true   
失去焦点是验证(不包括checkboxes/radio buttons)   
onkeyup：Boolean&nbsp; Default: true   
在keyup时验证.   
onclick：Boolean&nbsp; Default: true   
在checkboxes 和 radio 点击时验证   
focusInvalid：Boolean&nbsp; Default: true   
提交表单后，未通过验证的表单(第一个或提交之前获得焦点的未通过验证的表单)会获得焦点   
focusCleanup：Boolean&nbsp; Default: false   
如果是true那么当未通过验证的元素获得焦点时，移除错误提示。避免和 focusInvalid 一起用   
// 重置表单   
$().ready(function() {   
 var validator = $("#signupForm").validate({   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; submitHandler:function(form){   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert("submitted");&nbsp;&nbsp;   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; form.submit();   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;   
&nbsp;&nbsp;&nbsp; });   
&nbsp;&nbsp;&nbsp; $("#reset").click(function() {   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; validator.resetForm();   
&nbsp;&nbsp;&nbsp; });   
});   
8异步验证   
remote：URL   
使用ajax方式进行验证，默认会提交当前验证的值到远程地址，如果需要提交其他的值，可以使用data选项   
remote: "check-email.php"   
remote: {   
&nbsp;&nbsp;&nbsp; url: "check-email.php",&nbsp;&nbsp;&nbsp;&nbsp; //后台处理程序   
&nbsp;&nbsp;&nbsp; type: "post",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //数据发送方式   
&nbsp;&nbsp;&nbsp; dataType: "json",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //接受数据格式&nbsp;&nbsp;   
&nbsp;&nbsp;&nbsp; data: {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //要传递的数据   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; username: function() {   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return $("#username").val();   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }   
&nbsp;&nbsp;&nbsp; }   
}

远程地址只能输出 "true" 或 "false"，不能有其它输出   
9添加自定义校验   
addMethod：name, method, message   
自定义验证方法

// 中文字两个字节   
jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {   
&nbsp;&nbsp;&nbsp; var length = value.length;   
&nbsp;&nbsp;&nbsp; for(var i = 0; i \< value.length; i++){   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(value.charCodeAt(i) \> 127){   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; length++;   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }   
&nbsp;&nbsp;&nbsp; }   
&nbsp; return this.optional(element) || ( length \>= param[0] && length \<= param[1] );&nbsp;&nbsp;   
}, $.validator.format("请确保输入的值在{0}-{1}个字节之间(一个中文字算2个字节)"));

// 邮政编码验证&nbsp;&nbsp;   
jQuery.validator.addMethod("isZipCode", function(value, element) {&nbsp;&nbsp;   
&nbsp;&nbsp;&nbsp; var tel = /^[0-9]{6}$/;   
&nbsp;&nbsp;&nbsp; return this.optional(element) || (tel.test(value));   
}, "请正确填写您的邮政编码");   
10radio和checkbox、select的验证   
1.radio的required表示必须选中一个   
\<input&nbsp; type="radio" id="gender\_male" value="m" name="gender" class="{required:true}" /\>   
\<input&nbsp; type="radio" id="gender\_female" value="f" name="gender"/\>   
2.checkbox的required表示必须选中   
\<input type="checkbox" class="checkbox" id="agree" name="agree" class="{required:true}" /\>   
checkbox的minlength表示必须选中的最小个数,maxlength表示最大的选中个数,rangelength:[2,3]表 示选中个数区间

\<input type="checkbox" class="checkbox" id="spam\_email" value="email" name="spam[]" class="{required:true, minlength:2}" /\>   
\<input type="checkbox" class="checkbox" id="spam\_phone" value="phone" name="spam[]" /\>   
\<input type="checkbox" class="checkbox" id="spam\_mail" value="mail" name="spam[]" /\>   
&nbsp;&nbsp;&nbsp; 3.select的required表示选中的value不能为空   
\<select id="jungle" name="jungle" title="Please select something!" class="{required:true}"\>   
&nbsp;&nbsp;&nbsp; \<option value=""\>\</option\>   
&nbsp;&nbsp;&nbsp; \<option value="1"\>Buga\</option\>   
&nbsp;&nbsp;&nbsp; \<option value="2"\>Baga\</option\>   
&nbsp;&nbsp;&nbsp; \<option value="3"\>Oi\</option\>   
\</select\>   
select的minlength表示选中的最小个数（可多选的select）,maxlength表示最大的选中个 数,rangelength:[2,3]表示选中个数区间   
\<select id="fruit" name="fruit" title="Please select at least two fruits" class="{required:true, minlength:2}" multiple="multiple"\>   
&nbsp;&nbsp;&nbsp; \<option value="b"\>Banana\</option\>   
&nbsp;&nbsp;&nbsp; \<option value="a"\>Apple\</option\>   
&nbsp;&nbsp;&nbsp; \<option value="p"\>Peach\</option\>   
&nbsp;&nbsp;&nbsp; \<option value="t"\>Turtle\</option\>   
\</select\>

