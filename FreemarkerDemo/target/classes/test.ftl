<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Freemarker入门小DEMO </title>
</head>
<body>

<#--引入一个头文件  -->
<#include "head.ftl">

<#--我只是一个注释，我不会有任何输出  -->
${name},你好。${message}
<br>
<#--定义简单类型  -->
<#assign linkman="优就业小优">
联系人：${linkman}
<br>
<#--定义对象类型 key--value  -->
<#assign info={"mobile":"1891882881",'address':'北京市朝阳区五方桥'} >
电话：${info.mobile}  地址：${info.address}
<br>
<#--条件语句if -->
<#if success=true>
  你已通过实名认证
<#else>
  你未通过实名认证
</#if>
<br>
<#-- list指令和内建函数语法格式： 变量+?+函数名称    获取集合大小 -->
<#list goodsList as goods>
    ${goods_index+2} 商品名称： ${goods.name} 价格：${goods.price}<br>
</#list>
<br>
共  ${goodsList?size}  条记录
<br>

<#--转换JSON字符串为对象 -->
  <#assign text="{'bank':'工商银行','account':'18901920201920212'}" />
	<#assign data=text?eval />
开户行：${data.bank}  账号：${data.account}

<br>
<#--日期格式化-->
当前日期：${today?date} <br>
当前时间：${today?time} <br>
当前日期+时间：${today?datetime} <br>
日期格式化：  ${today?string("yyyy年MM月dd日")}

<br>
<#--数字转换为字符串-->
累计积分：${point}

累计积分：${point?c}
<br>
<#--判断某变量是否存在:“??”-->
<#if aaa??>
  aaa变量存在
<#else>
  aaa变量不存在
</#if>
<br>
<#--缺失变量默认值:“!”-->
${aaa!'-'}
<br>
<#--
  1运算符
    1.1算数运算符
    FreeMarker表达式中完全支持算术运算,FreeMarker支持的算术运算符包括:+, - , * , / , %
    1.2逻辑运算符
    逻辑运算符有如下几个:
    逻辑与:&&
    逻辑或:||
    逻辑非:!
    逻辑运算符只能作用于布尔值,否则将产生错误
  2.比较运算符
    表达式中支持的比较运算符有如下几个:
    1  =或者== 判断两个值是否相等.
    2  != 判断两个值是否不等.
    3  >或者gt  判断左边值是否大于右边值
    4  >=或者gte 判断左边值是否大于等于右边值
    5  <或者lt 判断左边值是否小于右边值
    6  <=或者lte 判断左边值是否小于等于右边值
    注意:  =和!=可以用于字符串,数值和日期来比较是否相等,但=和!=两边必须是相同类型的值,
    否则会产生错误,而且FreeMarker是精确比较,"x","x ","X"是不等的.其它的运行符可以作用于数字和日期,
    但不能作用于字符串,大部分的时候,使用gt等字母运算符代替>会有更好的效果,因为 FreeMarker会把>
    解释成FTL标签的结束字符,当然,也可以使用括号来避免这种情况,如:<#if (x>y)>

-->
</body>
</html>