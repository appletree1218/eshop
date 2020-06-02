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
<script src="js/foreground/businessCenter.js" type="text/javascript"></script>
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
								<li style="font-size: 18px;margin-top: 19px" class="colorStyle">
									<s:hidden name="username" value="%{#session.username}" />
									<s:property value="%{#session.username}" />
								</li>
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
			<tr  height="18%">
				<td rowspan="3" width="20%">
					<div id="sidebar">
						<div class="box categories" align="center">
							<h2 align="center">
								个人信息 <span></span>
							</h2>
							<div class="box-content">
								<img alt="xxx" width="200" height="200"
									src='icons/<s:property value ="icon" />'><br>
								<s:a action="foreBusinessAction_updatePwd.action">修改密码</s:a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="">退出</s:a>
								<ul style="text-align: center;margin-bottom: 8px">
									<li>角色：<s:property value="role.name" /></li>
									<li>店铺：<s:property value="shop.name" /></li>
								</ul>
								个人描述：
								<s:property value="description" />
							</div>
						</div>
					</div>
				</td>
				<td valign="top">
					<table border="0" width="100%" style="text-align: left" align="center">
							<tr bgcolor="#DEDEDE" style="font-size: 14px">
		                    	<td style="color:#8b0000;">&nbsp;&nbsp;修改密码</td>
			                </tr>
			         </table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table>
						<tr>
							<td>新密码：</td>
							<td><s:password name="newPwd" cssClass="field" cssStyle="width:200px"></s:password></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>确认密码：</td>
							<td><s:password name="confirmPwd" cssClass="field" cssStyle="width:200px"></s:password></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a name="confirm"><button class="search-submit">确认</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="foreBusinessAction_businessCenter.action"><button class="search-submit">返回</button></s:a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>