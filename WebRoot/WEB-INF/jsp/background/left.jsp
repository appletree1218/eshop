<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/left.js"></script>
<title>left</title>
<style type="text/css">
body {
	margin: 0px 0px 0px 0px;
}
.STYLE4 {font-size: 12px;text-align: center;color: #551A8B}
.STYLE5 {font-size: 12px; font-weight: bold; }
a{
	font-size: 12px;
	text-decoration: none;
	color:#551A8B;
	cursor: pointer;
}
a:HOVER{
	font-size: 12px;
	text-decoration: none;
}
</style>
</head>

<body>
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top" align="center">
    	<table id="xxxx" width="100%" height="23" border="0" cellspacing="0" cellpadding="0" background="images/background/main_34.gif">
	      <tr>
	        <td width="83%"><div align="center" class="STYLE5"><s:a target="rightFrame" action="userAction_getUserList?pageNum=1">用 户 管 理</s:a></div></td>
	      </tr>
    	</table>
    	<table align="center" style="display: none;" id="showUserChild" >
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="userAction_fuzzyQuery.action" target="rightFrame">模糊查询</a></td>
           </tr>
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="userAction_query.action" target="rightFrame">精确查询</a></td>
           </tr>
    	</table>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
</tr>
<tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top" align="center">
    	<table width="100%" height="23" border="0" cellspacing="0" cellpadding="0" background="images/background/main_34.gif">
	      <tr>
	        <td width="83%"><div align="center" class="STYLE5"><s:a target="rightFrame" action="businessAction_getBusinessList?pageNum=1">商 家 管 理</s:a></div></td>
	      </tr>
    	</table>
    	<table align="center" style="display: none;" >
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="businessAction_fuzzyQuery.action" target="rightFrame">模糊查询</a></td>
           </tr>
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="businessAction_query.action" target="rightFrame">精确查询</a></td>
           </tr>
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="businessAction_roleQuery.action" target="rightFrame">按角色查询</a></td>
           </tr>
    	</table>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
</tr>
<tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top">
    	<table width="100%" height="23" border="0" cellspacing="0" cellpadding="0" background="images/background/main_34.gif">
	      <tr>
	        <td width="83%"><div align="center" class="STYLE5"><s:a target="rightFrame" action="shopAction_getShopList?pageNum=1">店 铺 管 理</s:a></div></td>
	      </tr>
    	</table>
    	<table align="center" style="display: none;" >
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="shopAction_fuzzyQuery.action" target="rightFrame">模糊查询</a></td>
           </tr>
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="shopAction_query.action" target="rightFrame">精确查询</a></td>
           </tr>
    	</table>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
</tr>
<tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top">
    	<table width="100%" height="23" border="0" cellspacing="0" cellpadding="0"  background="images/background/main_34.gif">
	      <tr>
	        <td width="83%">
	        	<div align="center" class="STYLE5"><a>前 台 管 理</a></div>
	        </td>
	      </tr>
    	</table>
    	<table align="center" style="display: none;" id="showChild" >
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="showAction_loginAdver.action" target="rightFrame">登陆广告管理</a></td>
           </tr>
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="showAction_showAdver.action" target="rightFrame">广告展示管理</a></td>
           </tr>
           <tr>
             <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(images/background/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="showAction_showProduct.action" target="rightFrame">商品展示管理</a></td>
           </tr>
    	</table>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
</tr>
<tr height="85%">
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top">
    	<table width="100%" height="23" border="0" cellspacing="0" cellpadding="0" background="images/background/main_34.gif">
	      <tr>
	        <td width="83%"><div align="center" class="STYLE5"><s:a target="rightFrame" action="typeAction_getTypeList?pageNum=1">商品类型管理</s:a></div></td>
	      </tr>
    	</table>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
</tr>
<!-- 
<tr height="85%">
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top">
    	<table width="100%" height="23" border="0" cellspacing="0" cellpadding="0" background="images/background/main_34.gif">
	      <tr>
	        <td width="83%"><div align="center" class="STYLE5"><s:a target="rightFrame">评 价 管 理</s:a></div></td>
	      </tr>
    	</table>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
</tr>
 -->
</table>
</body>
</html>