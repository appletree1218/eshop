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
<title>订单信息</title>
<link type="text/css" rel="stylesheet" href="css/tab.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="js/jquery-1.8.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<script src="js/foreground/userCenter.js" type="text/javascript"></script>
</head>
<body>

	<!-- Shell -->
	<div class="shell">
		<!-- Header -->
		<div>
			<table bgcolor="#8b0000" width="100%" height="64px">
				<tr>
					<td width="26.5%"><h1 style="font-size: 30px;color: white;">用户中心</h1></td>
					<td width="24%"></td>
					<td width="13.5%"></td>
					<td></td>
					<td>
						<div id="navigation">
							<ul>
								<li style="font-size: 18px;margin-top: 19px" class="colorStyle">你好,</li>
								<li style="font-size: 18px;margin-top: 19px" class="colorStyle">
									<s:hidden name="username" value="%{#session.username}"></s:hidden>
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
				<td rowspan="3" width="20%" valign="top">
					<div id="sidebar">
						<div class="box categories" align="center">
							<h2 align="center">
								个人信息 <span></span>
							</h2>
							<div class="box-content">
								<img alt="xxx" width="200" height="200"
									src='icons/<s:property value ="icon" />'><br>
								<s:a action="foreUserAction_updatePwd.action">修改密码</s:a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="">退出</s:a>
								<ul style="text-align: center;margin-bottom: 8px">
								</ul>
								个人描述：
								<s:property value="%{description==null?'无':description}" />
							</div>
						</div>
					</div>
				</td>
				<td valign="top">
					<table border="0" width="100%" style="text-align: left" align="center">
							<tr bgcolor="#DEDEDE" style="font-size: 14px">
		                    	<td style="color:#8b0000;">&nbsp;&nbsp;订单信息</td>
			                </tr>
			         </table>
				</td>
			</tr>
			<tr>
				<td align="center" valign="top">
					<table width="100%">
						<tr>
							<td>
								&nbsp;&nbsp;<strong>收货信息</strong>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 7px;">
								<table width="100%" style="border-collapse: collapse; border: solid 1px #DEDEDE;">
									<tr>
										<td>
											&nbsp;&nbsp;收&nbsp;&nbsp;货&nbsp;人：<s:property value="#receiveInfo.receiveName"/>
										</td>
									</tr>
									<tr>
										<td>
											&nbsp;&nbsp;收货地址：<s:property value="#receiveInfo.province"/><s:property value="#receiveInfo.city"/><s:property value="#receiveInfo.country"/><s:property value="#receiveInfo.address"/>
										</td>
									</tr>
									<tr>
										<td>
											&nbsp;&nbsp;手&nbsp;&nbsp;机&nbsp;号：<s:property value="#receiveInfo.phone"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;&nbsp;<strong>商品清单</strong>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 7px;">
								<table width="100%" style="text-align:center; border-collapse: collapse;">
									<tr style="border: solid 1px #DEDEDE;">
										<td width="30%">商品名</td>
										<td width="50%">描述</td>
										<td width="10%">价格</td>
										<td width="10%">数量</td>
									</tr>
									<s:iterator var="car" value="shopCarSets">
										<tr style="border: solid 1px #DEDEDE;">
											<td>
												<img width="100px" height="100px" src='${pageContext.request.contextPath }/icons/
												<s:if test="%{#car.product.images.contains('png,')}"><s:property value="#car.product.images.substring(0,#car.product.images.indexOf(','))"/></s:if>
												<s:else>
													<s:property value="#car.product.images" />
												</s:else>'>
												<br/>
												<s:property value="#car.product.name"/>
											</td>
											<td style="text-align: left;">
												<s:property value="#car.product.description"/>
											</td>
											<td>
												<s:property value="#car.product.price"/>
											</td>
											<td>
												X<s:property value="amount"/>
											</td>
										</tr>
									</s:iterator>
									<tr style="text-align: right;">
										<td colspan="4">
											<br/>
											<h2 style="color: #8B0000;">总计金额：￥<s:property value="#orders.price"/>&nbsp;&nbsp;</h2>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>