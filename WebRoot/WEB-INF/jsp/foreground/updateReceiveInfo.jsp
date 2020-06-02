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
    
    <title>编辑收货人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		table{ text-align: left; border-collapse: collapse; }
		.field { background:#ebebeb; border:solid 1px #dedede; padding:2px;}
		.search-submit { width:70px; background:#8b0000; border:0; color:#fff; height:27px; line-height:26px; cursor:pointer; margin:5px 0 10px 0;}
		body{ align: center;color: #636363; }
		a { color:#8b0000; text-decoration: underline; cursor:pointer; }
		a:hover { color:#666; text-decoration: none; }
		.search-submit { width:70px; background:#8b0000; color:#fff; height:27px; line-height:26px; cursor:pointer; margin:5px 0 10px 0;}
		font{color: #8B0000}
		table tr{ height: 50px}
	</style>
	<script src="js/jquery-1.8.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/area.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/foreground/updateReceiveInfo.js"></script>
  </head>
  
  <body>
  	<s:form action="receiveInfoAction_update.action">
	<table align="center" width="100%">
		<tr>
			<td colspan="2">
				<h3 style="background-color: #7F7F7F;color: white;">编辑收货人信息</h3>
			</td>
		</tr>
		<tr>
			<td style="text-align: right; width: 100px">
				<font>*</font>收货人：
			</td>
			<td>
				<s:hidden name="receiveId"/>
				<s:textfield name="receiveName" />
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
				<font>*</font>所属地区：
			</td>
			<td>
				<div class="info">
					<s:hidden name="province" />
					<s:hidden name="city" />
					<s:hidden name="country" />
					<select id="province" name="province">
					</select> 
	    			<select id="city" name="city">
	    			</select> 
	   				<select id="country" name="country">
	   				</select>
	   				<script type="text/javascript">_init_area();</script>
   				</div>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
				<font>*</font>详细地址：
			</td>
			<td>
				<s:textfield name="address" cssStyle="width: 250px"/>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
				<font>*</font>手机号码：
			</td>
			<td>
				<s:hidden name="username"/>
				<s:textfield name="phone"/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><button id="saveInfo" class="search-submit" style="width: 100px">保存信息</button></td>
		</tr>
	</table>
	</s:form>
  </body>
</html>
