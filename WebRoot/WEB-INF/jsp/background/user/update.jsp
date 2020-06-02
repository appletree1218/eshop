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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/userUpdate.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/js/jquery-fckeditor.js"></script>
</head>

<body>
	<table width="100%" height="100%" cellpadding="0" cellspacing="0"
		border="0">
		<tr>
			<td valign="top">
				<table width="100%" border="0" align="top" cellpadding="0"
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
															<td width="98%" valign="bottom"><span class="STYLE1">用户基本信息修改</span></td>
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
										<s:form action="userAction_updateUser" enctype="multipart/form-data" id="form">
											<table style="margin-top: 20px;">
												<tr>
													<s:hidden name="userId" value="%{userId}"></s:hidden>
													<td class="tdStyle"><label>用户姓名：</label></td>
													<td><s:textfield name="name"></s:textfield></td>
													<td><label></label></td>
													<td class="tdStyle"><label>电&nbsp;&nbsp;&nbsp;&nbsp;话：</label></td>
													<td><s:textfield name="phone"></s:textfield></td>
													<s:hidden name="password" value="%{password}"></s:hidden>
												</tr>
												<tr>
													<td class="tdStyle"><label>头&nbsp;&nbsp;&nbsp;&nbsp;像：</label></td>
													<td><s:file name="uploadImage"></s:file></td>
													<td></td>
													<s:hidden name="icon" value="%{icon}"></s:hidden>
													<td class="tdStyle" rowspan="3"><label>备&nbsp;&nbsp;&nbsp;&nbsp;注：</label></td>
													<td rowspan="3"><s:textarea cols="25" rows="3" name="description" value="%{description}"></s:textarea></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>身份证号：</label></td>
													<td><s:textfield name="identityId" ></s:textfield></td>
													<td><label></label></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label></td>
													<td><s:textfield name="email"></s:textfield></td>
												</tr>
												</table>
											</s:form>
											<table style="margin-top: 10px; margin-left: 400px;" >
												<tr>
													<td colspan="2" align="right" style="padding-top: 30px">
														<button id="update">修改</button>
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