<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>购物车</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<script src="${pageContext.request.contextPath }/js/jquery-1.8.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath }/js/jquery.jcarousel.pack.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath }/js/jquery-func.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath }/js/foreground/pay.js" type="text/javascript"></script>	
	<style type="text/css">
		.productInfo{text-align:center; margin-left: 1px; border-collapse: collapse; margin-top: 2px}
		.productInfo tr{border:solid 1px #DEDEDE; padding-left: 2px}
		#slider { position:relative; overflow:hidden; }
		.info{ position: relative; list-style: none; height:154px; width:2500px; overflow: hidden;}
		.info li{border: solid 1px #DEDEDE; float: left; overflow: hidden; width: 212.5px; height: 150px; margin-right: 8px}
	</style>
</head>
<body>
	
<!-- Shell -->	
<div class="shell">
	<!-- Header -->	
	<div>
    	<table bgcolor="#8b0000" width="100%" height="64px">
        	<tr>
            	<td width="26.5%" style="text-align: left"><h2 style="font-size:30px; color:#fff">&nbsp;&nbsp;购物车</h2></td>
                <td width="24%"></td>
                <td width="13.5%"> 
                </td>
                <td></td>
                <td>
                	<div id="navigation">
                        <ul>
                            <li class="colorStyle">你好,</li>
                            <li><a href="foreUserAction_userCenter.action">
                            	<s:hidden name="username" value="%{#session.username}"/>
                            	<s:property value="%{#session.username}"/>
                            </a></li>
                            <li><a href="foreForwardAction_back.action">返回首页</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>  
	</div>
	<!-- End Header -->
	<!-- Main -->
	<div id="main">
		<div class="cl">&nbsp;</div>
			<div id="slider" style="height: 1052px;position:relative; overflow:hidden; border: 0px" class="box" style="border: 0px">
				<h2 style="font-size: 16px;"><strong>填写并核对订单信息</strong></h2>
				<br>
				<strong style="font-size:16px;margin-left:5px;">&gt;&gt;收货人信息</strong>
				<br><br>
				<ul style="float: left; background-color: #FFFFFF; list-style: none; margin-left: 2px; margin-right: 2px;">
					<li>
						<button id="leftButton" style="width: 30px; height: 154px; background-color: #F0F0F0;border: none;"><strong>&lt;</strong></button>
					</li>
				</ul>
				<div style="margin-left: 5px; height:154px; float:left; width: 889px;overflow: hidden;">
				<ul class="info">
					<s:iterator value="#infoList">
						<li style="font-size: 14px; margin-bottom:2px; text-align: center; overflow: hidden;">
							<br/><br/>
							<s:hidden name="receiveId"/>
							<strong><s:property value="receiveName"/> </strong>收
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<s:property value="phone"/><br>
							<br/>
							<s:property value="province"/>
							<s:property value="city"/>
							<s:property value="country"/><br>
							<s:property value="address"/><br>
							<div id="operate" style="display: none; float: right; margin-top: 30px; font-size: 12px">
								<a name="edit" id="<s:property value="receiveId"/>">编辑</a>&nbsp;
								<a name="del"  id='<s:property value="receiveId"/>'>删除</a>
								&nbsp;&nbsp;&nbsp;
							</div>
						</li>
					</s:iterator>
					<li id="addAddress" style="overflow: hidden; text-align: center; vertical-align: middle; display:table-cell;">
						<br><br>
						<img alt="" src="${pageContext.request.contextPath }/images/foreground/add.png" />
						<br>
						添加收货地址
					</li>
				</ul>
				</div>
				<ul style="float: left; list-style: none;">
					<li>
						<button id="rightButton" style="width: 30px; height: 154px; background-color: #F0F0F0;border: none;"><strong>&gt;</strong></button>
					</li>
				</ul>
				<div style="float: left;margin-top: 15px;width: 100%; margin-bottom: 10px">
					<strong style="font-size:16px;margin-left:5px;">&gt;&gt;商品清单</strong>
				</div>
				<table class="productInfo">
					<tr height="30px">
						<td colspan="2" style="text-align: left;padding-left: 10px;">商品</td>
						<td width="100px">单价</td>
						<td width="100px">数量</td>
						<td width="100px">小计</td>
					</tr>
					<s:iterator value="#shopcarList" var="shopCar">
						<tr>
							<td width="120px" align="center">
								<table width="100%">
									<tr><td align="center" width="120px">
										<img width="100px" height="100px" src='${pageContext.request.contextPath }/icons/
										<s:if test="%{#shopCar.product.images.contains('png,')}"><s:property value="#shopCar.product.images.substring(0,#shopCar.product.images.indexOf(','))"/></s:if>
										<s:else>
											<s:property value ="#shopCar.product.images" />
										</s:else>'>
									</td></tr>
									<tr><td align="center">
										<s:property value='#shopCar.product.name'/>
									</td></tr>
								</table>
							</td>
							<td width="540px" style="text-align: left;"><s:property value="#shopCar.product.description"/></td>
							<td>
								<label id="price"><s:property value='#shopCar.product.price'/></label>
							</td>
							<td>
								<s:hidden name="scId" value="%{scId}"/>
								<s:hidden name="productId" value="%{#shopCar.product.productId}"></s:hidden>
								<s:hidden name="username" value="%{#session.username}"></s:hidden>
								X<s:property value="#shopCar.amount"/>
							</td>
							<td><s:property value="%{#shopCar.amount*#shopCar.product.price}"/></td>
						</tr>
						</s:iterator>
					<s:if test="">
					<tr style="border-style: none;">
						<th colspan="7" style="text-align: right;">									
							<a href="foreBusinessAction_forwardProduct?currentNum=1">首页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.pageNum==1?1:#page.pageNum-1'/>">上一页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.pageNum==#page.totalPage?#page.totalPage:#page.pageNum+1'/>">下一页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.totalPage'/>">尾页</a>
						</th>
					</tr>
					</s:if>
					<tr style="text-align: right;border: none;">
						<td colspan="5">
							<br>
							共<s:property value="#map.amount"/>件商品，总计金额：￥<s:property value="#map.totalPrice"/>
						</td>
					</tr>
					<tr style="border: 0px">
						<th colspan="7" align="right"> 
							<a><button class="search-submit" style="width: 100px" id="payBtn">提&nbsp;交&nbsp;订&nbsp;单</button></a>
						</th>
					</tr>
				</table>
				</div>
			</div>
		</div>
		<div class="cl">&nbsp;</div>
	<!-- End Main -->
</body>
</html>