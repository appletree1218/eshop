<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<script src="js/foreground/success.js" type="text/javascript"></script>
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
    	<br><br>
        <h1 style="font-size: 72px">注册成功!</h1>
        <br><br>
        <h2><span id="num">3</span>秒后跳转至首页,若不跳转,请<a href="index.jsp">点击这里</a></h2>
    </div>
   </div>
</div>	
</body>
</html>
