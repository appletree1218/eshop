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
	<title>登陆</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<script src="js/jquery-1.8.js" type="text/javascript"></script>	
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>	
	<script src="js/jquery-func.js" type="text/javascript"></script>	
	<script src="js/foreground/login.js" type="text/javascript"></script>	
</head>
<body>
	
<!-- Shell -->	
<div class="shell">
	<div>
    	<table width="100%" height="64px" bgcolor="#8b0000">
        	<tr>
            	<td><h2 style="font-size:30px; color:#fff">&nbsp;&nbsp;欢迎登陆</h2><td>
            <tr>
        </table>    
	</div>
    <br><br><br><br><br><br><br><br>
	<div align="center" style="height:300px; font-size:16px">
    	<table width="100%" height="100%">
        	<tr>
            	<td width="50%" style="border-right: solid 1px #DEDEDE;">
                	<img width="550px" src="images/adver/adver.png" style="padding-right:10px;"/>
                </td>
                <td >
                    <td style="padding-left:80px;">
                        <s:form action="foreLoginAction_login.action" id="form">
                            用户名：<s:textfield cssClass="field"  name="name"></s:textfield><br /><br /><br />
                            密&nbsp;&nbsp;&nbsp;码：<s:password name="password" cssClass="field"></s:password><br /><br /><br />
                            <select class="field" style="text-align:center;width:193px" name="role"><option>买家</option><option>商家</option></select><br /><br />
                            <input type="button" style="width:197px" class="search-submit" value="登陆"/>
                        </s:form>  
                    </td>     
                </td>
            </tr>
        </table> 
	</div>
</div>	
</body>
</html>