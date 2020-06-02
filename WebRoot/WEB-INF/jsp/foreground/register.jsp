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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath}/js/jquery.jcarousel.pack.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath}/js/jquery-func.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath}/js/tab.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/foreground/register.js" type="text/javascript"></script>
</head>
<body>
	
<!-- Shell -->	
<div class="shell">
	<div>
    	<table width="100%" height="64px" bgcolor="#8b0000">
        	<tr>
            	<td><h2 style="font-size:30px; color:#fff">&nbsp;&nbsp;欢迎注册</h2><td>
            <tr>
        </table>  
	</div>
	<br>
    <div align="center" style="height:300px; font-size:16px">
    <div id="tabContainer" align="center" style="height:300px; font-size:16px">
        <ul>
            <li id="tab1" class="on"><a href="#" onclick="switchTab('tab1','con1');this.blur();return false;">
                买家</a></li>
            <li id="tab2"><a href="#" onclick="switchTab('tab2','con2');this.blur();return false;">
                商家</a></li>
        </ul>
        <div style="clear: both">
        </div>
        <br>
        <div id="con1">
        	<s:form action="foreUserAction_registerUser.action" id="form_user">
            <table width="100%" height="100%" style="text-align:center;margin-left:40px">
                <tr>
                    <td width="35%" align="right" style="padding-right:50px">用户名：</td>
                    <td align="left"><s:textfield name="name" id="username" cssClass="field" style="width:300px"/>
                    	&nbsp;&nbsp;*
                    </td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">密码：</td>
                    <td align="left"><s:password name="password" id="userpassword" cssClass="field" style="width:300px"/>
						&nbsp;&nbsp;*
					</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">邮箱：</td>
					<td align="left"><s:textfield name="email" cssClass="field" style="width:300px"/></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">电话：</td>
                    <td align="left"><s:textfield name="phone" cssClass="field" style="width:300px"/></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">身份证号：</td>
                    <td align="left"><s:textfield name="identityId" cssClass="field" style="width:300px"/></td>
                </tr>
                 <tr>
                    <td colspan="2" style="padding-left: 50px">
                    	<input type="button" id="userButton" class="search-submit" value="提交">
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="${pageContext.request.contextPath }/index.jsp" style="display: inline;"><input type="button" class="search-submit" value="返回"></a>
                    </td>
                </tr>
        	</table> 
        	</s:form>
        </div>
        <div id="con2" style="display: none">
        	<s:form action="foreBusinessAction_registerBusiness.action" id="form_business" >
            <table width="100%" height="100%" style="text-align:center;margin-left:40px">
                <tr>
                    <td width="35%" align="right" style="padding-right:50px">商家名：</td>
                    <td align="left"><s:textfield name="name" id="businessname" cssClass="field" style="width:300px"/></td>
                </tr>
                <tr>
                	<td align="right" style="padding-right:50px">角色：</td>
                	<td align="left"><s:select name="roleId" cssClass="field" list="#roleList" listKey="roleId" listValue="name" style="width:300px"></s:select></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">密码：</td>
                    <td align="left"><s:password name="password" id="businesspassword" cssClass="field" style="width:300px"/></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">邮箱：</td>
					<td align="left"><s:textfield name="email" cssClass="field" style="width:300px"/></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">电话：</td>
                    <td align="left"><s:textfield name="phone" cssClass="field" style="width:300px"/></td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:50px">身份证号：</td>
                    <td align="left"><s:textfield name="identityId" cssClass="field" style="width:300px"/></td>
                </tr>
               	<tr>
                    <td colspan="2" style="padding-left: 50px">
                    	<input type="button" id="businessButton" class="search-submit" value="提交">
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
