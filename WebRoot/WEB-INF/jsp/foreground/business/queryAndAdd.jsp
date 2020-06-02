<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" href="css/style.css" type="text/css"/> -->
	
	<style type="text/css">
		table{  margin-left: 3px; text-align: center; border-collapse: collapse; margin-top: 2px}
		table td{border:solid 1px #DEDEDE; }
		.field { background:#ebebeb; border:solid 1px #dedede; padding:2px;}
		.search-submit { width:70px; background:#8b0000; border:0; color:#fff; height:27px; line-height:26px; cursor:pointer; margin:12px 0 10px 0;}
		body{color: #636363 }
		a { color:#8b0000; text-decoration: underline; cursor:pointer; }
		a:hover { color:#666; text-decoration: none; }
	</style>
	<script src="js/jquery-1.8.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/foreground/queryAndAdd.js"></script>
  </head>
  
  <body style="text-align: center;">
	<s:form action="foreForwardAction_queryAndAdd.action">
		编号：<input type="text" name="id" class="field" style="height: 30px"></input>&nbsp;&nbsp;用户名：<input name="name" type="text" style="height: 30px" class="field"></input>&nbsp;&nbsp;<input class="search-submit" type="submit" value="查询"/>
	</s:form>
	<table id="info" style="text-align: center;">
		<tr>
			<td width="50px">编号</td>
			<td width="72px">姓名</td>
			<td width="150px">身份证号</td>
			<td width="100px">电话</td>
			<td width="150px">电子邮箱</td>
			<td width="150px">备注</td>
			<td width="50px">操作</td>
		</tr>
		<s:if test="#businessList.size()!=0">
		<s:iterator value="#businessList">
			<tr>
				<td width="50px"><s:property value="businessId"/></td>
				<td width="72px"><s:property value="name"/></td>
				<td width="150px"><s:property value="identityId"/></td>
				<td width="100px"><s:property value="phone"/></td>
				<td width="150px"><s:property value="email"/></td>
				<td width="150px"><s:property value="description"/></td>
				<td width="50px"><a id="<s:property value='businessId'/>" href="javascript:window.opener=null;window.returnValue='ok';window.close();" onclick="table.clickAdd(this)">添加</a></td>
			</tr>
		</s:iterator>
		</s:if>
	</table>
  </body>
</html>
