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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/businessUpdate.js"></script>
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
															<td width="98%" valign="bottom"><span class="STYLE1">商家基本信息修改</span></td>
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
										<s:form action="businessAction_updateBusiness.action" enctype="multipart/form-data" id="form">
											<table style="margin-top: 20px;">
												<tr>
													<s:hidden name="businessId" value="%{businessId}"></s:hidden>
													<td class="tdStyle">商&nbsp;家&nbsp;名：</td>
													<td><s:textfield name="name"></s:textfield></td>
													<td><label></label></td>
													<td class="tdStyle">角&nbsp;&nbsp;&nbsp;&nbsp;色：</td>
													<s:hidden name="password" value="%{password}"></s:hidden>
													<td>
														<s:select name="roleId" list="#roleList" listKey="roleId" listValue="name"></s:select>
													</td>
												</tr>
												<tr>
													<td class="tdStyle">头&nbsp;&nbsp;&nbsp;&nbsp;像：</td>
													<td><s:file name="uploadImage"></s:file></td>
													<s:hidden name="icon" value="%{icon}"></s:hidden>
													<td></td>
													<td class="tdStyle">所属店铺名称：</td>
													<td><s:select name="shopId" list="#shopList" listKey="shopId" listValue="name"></s:select></td>
												</tr>
												<tr>
													<td class="tdStyle">身份证号：</td>
													<td><s:textfield name="identityId"></s:textfield></td>
													<td><label></label></td>
													<td class="tdStyle" rowspan="3">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
													<td rowspan="3"><s:textarea cols="20" rows="2" name="description"></s:textarea></td>
												</tr>
												<tr>
													<td class="tdStyle">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
													<td><s:textfield name="email"></s:textfield></td>
													<td></td>
												</tr>
												<tr>
													<td class="tdStyle">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
													<td><s:textfield name="phone"></s:textfield></td>
												</tr>
												</table>
											</s:form>
											<table style="margin-top: 10px; margin-left: 400px;" >
												<tr>
													<td colspan="2" align="right" style="padding-top: 30px">
														<button style="margin-right: 20px" id="update">修改</button>
														<s:a action="businessAction_getBusinessList?pageNum=1"><button>返回</button></s:a>
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