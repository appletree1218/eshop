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
<title>用户中心</title>
<link type="text/css" rel="stylesheet" href="css/tab.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery-func.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/tab.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/foreground/order.js" type="text/javascript"></script>
<style type="text/css">
	.productInfo{text-align:center; margin-left: 1px; border-collapse: collapse; margin-top: 2px}
	.productInfo tr{border:solid 1px #DEDEDE; padding-left: 2px}
</style>
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
				<td rowspan="3" width="20%" valign="top">
					<div id="sidebar">
						<div class="box categories" align="center">
							<h2 align="center">
								个人信息 <span></span>
							</h2>
							<div class="box-content">
								<img alt="暂无头像图片" width="200" height="200"
									src='icons/<s:property value ="icon" />'><br>
								<s:a action="foreUserAction_updatePwd.action">修改密码</s:a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="foreForwardAction_main.action">退出</s:a>
								<ul style="text-align: center;margin-bottom: 8px"/> 
								个人描述：
								<s:property value="%{description==null?'无':description}" />
							</div>
						</div>
					</div>
				</td>
				<td height="20%" valign="top">
					<table width="100%" style="text-align: center; border: solid 0.1px #FFFFFF;" cellpadding="0" cellspacing="0" >
						<tr>
							<td bgcolor="#dedede" width="223px" style="border-left: solid 2px #FFFFFF;"><s:a action="foreUserAction_userCenter.action" cssStyle="text-decoration: none;">个人信息修改</s:a></td>
							<td bgcolor="#dedede" style="border-left: solid 2px #FFFFFF; border-bottom: solid 2px #8B0000; width: 223px;" ><s:a action="foreUserAction_orderManageUI.action" cssStyle="text-decoration: none;">订单管理</s:a></td>
							<%-- <td bgcolor="#dedede" width="220px"><s:a action="foreBusinessAction_forwardProduct?currentNum=0" cssStyle="text-decoration: none;">购物车</s:a></td> --%>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<s:if test="#orderList.size()>0">
					<s:form action="foreUserAction_updateUser.action">
						<table class="productInfo" border="0" style="margin-left:3px; width: 99.6%" cellspacing="0">
							<tr style="border: none;">
								<td colspan="2" style="text-align: left;">
									<h2>全部订单</h2>
								</td>
								<td colspan="4" style="text-align: right;">
									<input type="text">
									&nbsp;&nbsp;
									<input type="button" class="search-submit" value="查&nbsp;&nbsp;询"/>
								</td>
							</tr>
							<tr>
								<td width="50%">订单信息</td>
								<td>单价</td>
								<td>时间</td>
								<td>状态</td>
								<td>数量</td>
								<td>操作</td>
							</tr>
							<s:iterator value="orderList" var="order">
								<tr>
									<td colspan="5" style="text-align: left;">
										&nbsp;
										订单编号：<s:property value="number"/>
										<s:hidden name="number" value="%{#order.number}" />
										<s:hidden name="statusId" value="%{#order.status.statusId}" />
									</td>
									<td colspan="1">
										<a href="foreUserAction_orderDetailUI?orderId=<s:property value='%{#order.orderId}'/>">查看</a>
										<s:if test="%{#order.status.statusId == 7 || #order.status.statusId == 8}">
											<a name="del" id="<s:property value="number"/>">删除</a>
										</s:if>
										<s:if test="%{#order.status.statusId == 9 || #order.status.statusId == 12}">
											<a name="cancel" id="<s:property value="number"/>">取消订单</a>
										</s:if>
									</td>
								</tr>
								<s:iterator var="car" value="#order.shopcars">
									<tr>
										<td>
											<img width="100px" height="100px" src='${pageContext.request.contextPath }/icons/
											<s:if test="%{#car.product.images.contains('png,')}"><s:property value="#car.product.images.substring(0,#car.product.images.indexOf(','))"/></s:if>
											<s:else>
												<s:property value ="#car.product.images" />
											</s:else>'>
											<br/>
											<s:property value="#car.product.name"/>
										</td>
										<td>
											<s:property value="#car.product.price"/>
										</td>
										<td>
											<s:property value="#order.createDate"/>
										</td>
										<td>
											<s:property value="#order.status.name"/>
										</td>
										<td>
											<s:property value="amount"/>
										</td>
										<td>
											<s:if test="%{review!=null && #order.status.statusId == 7 }">
												<a name="review" href="foreUserAction_forwardReview.action?number=<s:property value="number"/>&productId=<s:property value="#car.product.productId"/>">评价</a>
											</s:if>
										</td>
									</tr>
								</s:iterator>
							</s:iterator>
	                	</table>
                	</s:form>
                	</s:if>
                	<s:else>
                		<br/>
                		<h1 style="font-size: 20" align="center">暂无订单!</h1>
                	</s:else>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>