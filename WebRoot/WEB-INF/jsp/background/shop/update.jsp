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
<script type="text/javascript" src="${pageContext.request.contextPath }/calendar/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/calendar/calendar-zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/calendar/calendar-setup.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/shopUpdate.js"></script>
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
															<td width="98%" valign="bottom"><span class="STYLE1">店铺基本信息修改</span></td>
														</tr>
													</table>
												</td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="20">
							<table width="100%" height="450px" cellspacing="0" cellpadding="0" class="tableStyle">
								<tr>
									<td width="100%" align="left" valign="top">
										<s:form action="shopAction_updateShop.action" enctype="multipart/form-data" id="form">
											<table style="margin-top: 15px;">
												<tr>
													<s:hidden name="shopId" value="%{shopId}"></s:hidden>
													<td class="tdStyle"><label>店&nbsp;铺&nbsp;名：</label></td>
													<td><s:textfield name="name"></s:textfield></td>
													<td><label></label></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>地&nbsp;&nbsp;&nbsp;&nbsp;址：</label></td>
													<td><s:textfield name="address"></s:textfield></td>
													<td><label></label></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>注册时间：</label></td>
													<td><s:textfield name="regTime" id="regTime"></s:textfield></td>
													<td><label></label></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>店铺logo：</label></td>
													<td><s:file name="uploadImage"></s:file></td>
													<s:hidden name="logo" value="%{logo}"></s:hidden>
												</tr>
												<tr>
													<td class="tdStyle"><label>状&nbsp;&nbsp;&nbsp;&nbsp;态：</label></td>
													<td><s:select name="statusId" list="#statusList" headerKey="" headerValue="请选择..." listKey="statusId" listValue="name"></s:select></td>
												</tr>
												<tr>
													<td class="tdStyle"><label>备&nbsp;&nbsp;&nbsp;&nbsp;注：</label></td>
													<td><s:textarea cols="25" rows="2" name="description"></s:textarea></td>
												</tr>
												</table>
											</s:form>
											<table style="margin-left: 400px;" >
												<tr>
													<td colspan="2" align="right" style="padding-top: 10px">
														<button>修改</button>
														<s:a action="shopAction_getShopList?pageNum=1"><button>返回</button></s:a>
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