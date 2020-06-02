<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>注册</title>
    <link type="text/css" rel="stylesheet" href="css/tab.css"/>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<script src="js/jquery-1.8.js" type="text/javascript"></script>	
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>	
	<script src="js/jquery-func.js" type="text/javascript"></script>	
	<script src="js/tab.js" type="text/javascript"></script>
	<script src="js/foreground/registerShop.js" type="text/javascript"></script>
</head>
<body>
	
<!-- Shell -->	
<div class="shell">
	<div>
    	<table width="100%" height="64px" bgcolor="#8b0000">
        	<tr>
            	<td><h2 style="font-size:30px; color:#fff">&nbsp;&nbsp;欢迎加入</h2><td>
            <tr>
        </table>  
	</div>
	<br>
    <div align="center" style="height:300px; font-size:16px">
    <div id="tabContainer" align="center" style="height:300px; font-size:16px">
        <div style="clear: both">
        </div>
        <br>
        <div id="con1">
        	<s:form action="foreShopAction_registerShop.action" enctype="multipart/form-data">
            <table width="100%" height="100%" style="text-align:center;margin-left:40px">
                <tr>
                    <td width="35%" align="right" style="padding-right:50px">店铺名：</td>
                    <td align="left"><s:textfield name="name" cssClass="field" style="width:300px"/>
                    	&nbsp;&nbsp;*
                    </td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">地址：</td>
                    <td align="left"><s:textfield name="address" cssClass="field" style="width:300px"/>
						&nbsp;&nbsp;*
					</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">店铺logo：</td>
					<td align="left">
						<img width="100px" height="100px" alt="" src="${pageContext.request.contextPath }/icons/Koala.jpg" align="middle"/>
						<s:file name="uploadImage"></s:file>
					</td>
					<s:hidden name="logo" value="%{logo}"></s:hidden>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">注册时间：</td>
                    <td align="left"><s:textfield name="regTime" cssClass="field" style="width:300px;" disabled="true"/></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">描述：</td>
                    <td align="left"><s:textarea name="description" cssClass="field" style="width:300px;resize:none"/></td>
                </tr>
                 <tr>
                    <td colspan="2" style="padding-left: 200px">
                    	<input type="button" id="shopButton" class="search-submit" value="提交">
                    	&nbsp;&nbsp;&nbsp;
                    	<a href="${pageContext.request.contextPath }/index.jsp" style="display: inline;"><input type="button" class="search-submit" value="返回"></a>
                    </td>
                </tr>
        	</table> 
        	</s:form>
        </div>
    </div>
   </div>
</div>	
</body>
</html>
