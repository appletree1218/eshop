<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>商家中心</title>
<link type="text/css" rel="stylesheet" href="css/tab.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="js/jquery-1.8.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<script src="js/foreground/register.js" type="text/javascript"></script>
</head>
<body>

	<!-- Shell -->
	<div class="shell">
		<!-- Header -->
		<div>
			<table bgcolor="#8b0000" width="100%" height="64px">
				<tr>
					<td width="26.5%"><h1 style="font-size: 30px;color: white;">商家中心</h1></td>
					<td width="24%"></td>
					<td width="13.5%"></td>
					<td></td>
					<td>
						<div id="navigation">
							<ul>
								<li style="font-size: 18px;margin-top: 19px" class="colorStyle">你好,</li>
								<li style="font-size: 18px;margin-top: 19px" class="colorStyle"><s:property
										value="%{#session.username}" /></li>
								<li><a style="font-size: 18px;"
									href="foreForwardAction_back.action">返回</a></li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td rowspan="3" width="20%">
					<div id="sidebar">
						<div class="box categories" align="center">
							<h2 align="center">
								个人信息 <span></span>
							</h2>
							<div class="box-content">
								<img alt="暂无头像图片" width="200" height="200"
									src='icons/<s:property value ="icon" />'><br>
								<s:a action="foreBusinessAction_updatePwd.action">修改密码</s:a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="foreForwardAction_main.action">退出</s:a>
								<ul style="text-align: center;margin-bottom: 8px">
									<li>角色：<s:property value="role.name" /></li>
									<li>店铺：<s:property value="%{shop==null?'无':shop.name}" /></li>
								</ul>
								个人描述：
								<s:property value="%{description==null?'无':description}" />
							</div>
						</div>
					</div>
				</td>
				<td height="20%" valign="top">
					<table width="100%" border="0" style="text-align: center;border: solid 1px #fff;" >
						<tr>
							<td bgcolor="#dedede" style="border-bottom: solid 2px #8B0000;"><s:a action="foreBusinessAction_businessCenter.action" cssStyle="text-decoration: none;">个人信息修改</s:a></td>
							<td bgcolor="#dedede"><s:a action="foreBusinessAction_forwardShop.action" cssStyle="text-decoration: none;">店铺管理</s:a></td>
							<td bgcolor="#dedede"><s:a action="foreBusinessAction_forwardProduct?currentNum=1" cssStyle="text-decoration: none;">商品管理</s:a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<s:form action="foreBusinessAction_updateBusiness.action">
						<table border="0" style="margin-left: 40px;" cellspacing="15">
							<tr>
		                    	<td width="35%" align="right" style="padding-right:50px">商家名：</td>
		                    	<td align="left"><s:textfield name="name" cssClass="field" style="width:300px"/></td>
			                </tr>
			                <tr>
			                	<td align="right" style="padding-right:50px">角色：</td>
			                	<td align="left"><s:select list="#roleList" listKey="roleId" listValue="name"></s:select></td>
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
			                	<td colspan="2" style="padding-left: 450px">
			                		<input type="button" class="search-submit" value="修改">
			                	</td>
			                </tr>
	                	</table>
                	</s:form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>