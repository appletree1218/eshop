<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>update</title>
<style type="text/css">
body {
	margin: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}

.tableStyle{
	border: solid;
	border-width: 0.1;
	border-color: #A8C7CE;
}

.tdStyle{
	width: 200px;
	padding: 10px;
	text-align: center;
	font-size: 12px;
}

label{
	font-size: 12px;
}
</style>
<link type="text/css" rel="stylesheet" href="calendar/calendar.css" >
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
</head>

<body>
	<table width="100%" height="100%" cellpadding="0" cellspacing="0"
		border="0">
		<tr>
			<td valign="top">
				<table width="100%" border="0" cellpadding="0"
					cellspacing="0" >
					<tr>
						<td height="30"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td height="24" ><table width="100%"
											border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0"  bgcolor="#353C44">
														<tr>
															<td width="2%" height="19" valign="bottom"><div
																	align="center">
																	<img src="images/background/tb.gif" width="14"
																		height="14" />
																</div></td>
															<td width="98%" valign="bottom"><span class="STYLE1">管理员密码修改</span></td>
														</tr>
													</table>
												</td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="30">
							<table width="100%" height="155px" cellspacing="0" cellpadding="0" class="tableStyle">
								<tr>
									<td width="100%" align="left" valign="top">
										<s:form action="managerAction_updateManager.action" id="form">
											<table style="margin-top: 20px;">
												<tr>
													<s:hidden value="%{#session.name}" name="name"></s:hidden>
													<td class="tdStyle"><label>旧密码：</label></td>
													<td><s:password name="password" id="旧密码"></s:password></td>
													<td><label id="pwd"></label></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>新密码：</label></td>
													<td><s:password name="newPassowrd" id="新密码"></s:password></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>确认新密码：</label></td>
													<td><s:password name="submitPassowrd" id="确认新密码"></s:password></td>
													<td><label id="submitPassowrd"></label></td>
												</tr>
												</table>
											</s:form>
											<table style="margin-top: 10px; margin-left: 350px;" >
												<tr>
													<td colspan="2" align="right" style="padding-top: 30px">
														<button>修改</button>
														<s:a action="forwardAction_right.action"><button>返回</button></s:a>
													</td>
												</tr>
											</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td width="8">&nbsp;</td>
			<td width="8" height="441" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>