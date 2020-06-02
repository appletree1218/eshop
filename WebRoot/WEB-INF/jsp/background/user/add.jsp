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
<title>add</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/userAdd.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js/jquery-fckeditor.js"></script>
</head>

<body>
	<table style="height: 90%;width:100%;" cellpadding="0" cellspacing="0"
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
															<td width="98%" valign="bottom"><span class="STYLE1">用户基本信息添加</span></td>
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
							<table width="100%" height="463px" cellspacing="0" cellpadding="0" class="tableStyle">
								<tr>
									<td width="100%" align="left" valign="top">
										<s:form action="userAction_addUser.action" enctype="multipart/form-data" id="form">
											<table style="margin-top: 20px;">
												<tr>
													<td class="tdStyle">用户姓名：</td>
													<td style="font-size: 12px"><s:textfield name="name"></s:textfield>*</td>
													<td><label id="nameMessage"></label></td>
													<td class="tdStyle">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
													<td><s:textfield name="phone"></s:textfield></td>
												</tr>
												<tr>
													<td class="tdStyle">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
													<td style="font-size: 12px"><s:password name="password"></s:password>*</td>
													<td><label></label></td>
													<td class="tdStyle" rowspan="3">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
													<td rowspan="3"><s:textarea cols="20" rows="2" name="description"></s:textarea></td>
												</tr>
												<tr>
													<td class="tdStyle">头&nbsp;&nbsp;&nbsp;&nbsp;像：</td>
													<td><s:file name="uploadImage"></s:file></td>
													<td></td>
												</tr>
												<tr>
													<td class="tdStyle">身份证号：</td>
													<td><s:textfield name="identityId"></s:textfield></td>
													<td><label></label></td>
												</tr>
												<tr>
													<td class="tdStyle">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
													<td><s:textfield name="email"></s:textfield></td>
												</tr>
												</table>
											</s:form>
											<table style="margin-top: 10px; margin-left: 400px;" >
												<tr>
													<td colspan="2" align="right" style="padding-top: 30px">
														<button id="add">添加</button>
														<s:a action="userAction_getUserList?pageNum=1"><button>返回</button></s:a>
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