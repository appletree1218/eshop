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
    
    <title>订单信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="${pageContext.request.contextPath }/js/jquery-1.8.js" type="text/javascript"></script>
	<script src="js/foreground/businessCenter.js" type="text/javascript"></script>
	<style type="text/css">
		body {color: #636363}
		.search-submit { width:70px; background:#8b0000; border:0; color:#fff; height:27px; line-height:26px; cursor:pointer; margin:12px 0 10px 0;}
	</style>
  </head>
  
  <body>
    <table width="100%">
		<tr>
			<td>
				&nbsp;<strong>&gt;&gt;收货信息</strong>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 7px;">
				<table width="100%" style="border-collapse: collapse; border: solid 1px #DEDEDE;">
					<tr>
						<td>
							&nbsp;&nbsp;收&nbsp;&nbsp;货&nbsp;人：<s:property value="#orders.receiveInfo.receiveName"/>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;收货地址：<s:property value="#orders.receiveInfo.province"/><s:property value="#orders.receiveInfo.city"/><s:property value="#orders.receiveInfo.country"/><s:property value="#orders.receiveInfo.address"/>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;手&nbsp;&nbsp;机&nbsp;号：<s:property value="#orders.receiveInfo.phone"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;<strong>&gt;&gt;商品清单</strong>
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
					<s:iterator var="car" value="#orders.shopcars">
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
				</table>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;<strong>&gt;&gt;订单详情</strong>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 7px;">
				<table width="100%" style="text-align:center; border-collapse: collapse;">
					<tr style="border: solid 1px #DEDEDE;">
						<td>订单编号</td>
						<td>订单状态</td>
						<td>操作</td>
					</tr>
					<tr style="border: solid 1px #DEDEDE;">
						<td style="text-align: left;">&nbsp;&nbsp;<s:property value="#orders.number"/></td>
						<td><s:property value="#orders.status.name"/></td>
						<td>	
							<s:if test="#orders.status.statusId==11">
								<select name="isAgree">
									<option value="1">同意</option>
									<option value="0">不同意</option>
								</select>
							</s:if>
							<s:elseif test="#orders.status.statusId==9">
								<select>
									<option>发货</option>
								</select>
							</s:elseif>
							<s:else>
								暂无操作
							</s:else>
						</td>
					</tr>
					<s:if test="#orders.status.statusId==11 || #orders.status.statusId==9">
						<tr>
							<td style="text-align: right;" colspan="3"><button name="confirm" class="search-submit">确定</button></td>
						</tr>
					</s:if>				
				</table>
			</td>
		</tr>
	</table>
  </body>
</html>
