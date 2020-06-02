<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上数码商城</title>
</head>

<frameset rows="127,*,11" frameborder="no" border="0" framespacing="0">
  <frame src="forwardAction_top.action" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frameset cols="14%,96%" frameborder="0" border="0">
  	<frame src="forwardAction_left.action" name="leftFrame" id="leftFrame" frameborder="0"/>
    <frame src="forwardAction_right.action" name="rightFrame" id="rightFrame" frameborder="0"/>
  </frameset>
  <frame src="forwardAction_bottom.action" name="bottomFrame" scrolling="no" frameborder="0" noresize="noresize" id="bottomFrame" />
</frameset>
</html>

