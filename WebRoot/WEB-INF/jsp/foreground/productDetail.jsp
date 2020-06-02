<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>详细信息</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/area.css" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.jcarousel.pack.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery-func.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/detail.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/area.js" type="text/javascript"></script>
<style type="text/css">
	.reviewInfo{ border-collapse: collapse; }
	.reviewInfo tr{border: solid 1px #DEDEDE;}
</style>
</head>
<body>
	<!-- Shell -->
	<div class="shell">
		<!-- Header -->
		<div>
			<table bgcolor="#8b0000" width="100%" height="64px">
				<tr>
					<s:form action="searchAction_getList.action">
						<td width="26.5%" align="center">
							<a href="index.jsp"><img alt="" src="${pageContext.request.contextPath }/images/foreground/logo.png" /></a>
						</td>
						<td width="24%"><s:textfield cssClass="field"
								style="width:220px" name="key" /><br /></td>
						<td width="13.5%"><select class="field"
							style="width:120px;text-align:center" name="type">
								<option>商品</option>
								<option>店铺</option>
						</select></td>
						<td><a class="aStyle">搜索</a></td>
					</s:form>
					<td>
						<div id="navigation">
							<c:if test="${sessionScope.username==null }">
								<ul>
									<li><a href="foreForwardAction_login.action">登&nbsp;&nbsp;&nbsp;陆</a>
										<s:hidden name="username" value="%{#session.username}"></s:hidden></li>
									<li><a href="foreForwardAction_register.action">注&nbsp;&nbsp;&nbsp;册</a></li>
									<li><a href="#" id="shopCar">购&nbsp;物&nbsp;车</a></li>
								</ul>
							</c:if>
							<c:if test="${sessionScope.username!=null }">
								<ul>
									<li class="colorStyle">你好,</li>
									<c:if test="${sessionScope.role=='买家' }">
										<li><s:a action="foreUserAction_userCenter.action">
												<s:property value="%{#session.username}"/>
											</s:a></li>
										<li><s:a
												action="foreForwardAction_shopCar?userId=%{#session.userId}"
												id="shopCar">购&nbsp;物&nbsp;车</s:a></li>
									</c:if>
									<c:if test="${sessionScope.role!='买家' }">
										<li><s:a
												action="foreBusinessAction_businessCenter.action">
												<s:property value="%{#session.username}" />
											</s:a></li>
									</c:if>
									<li><a href="foreForwardAction_main.action">退出</a></li>
								</ul>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- End Header -->
		<!-- Main -->
		<div id="main" style="height: 700px">
			<div class="cl" >&nbsp;</div>
				<!-- Products -->
				<div class="products-detail">
					<div class="cl">&nbsp;</div>
					<ul>
						<li style="width: 380px; height: 380px;"><a href="#"><img id="bigImg"
								src="${pageContext.request.contextPath}/icons/<s:property value='#imageList.get(0)'/>"
								alt="" width="360" height="360"/></a>
						</li>
					</ul>
					<table style="line-height: 30px;">
						<tr><td height="50px" width="550px"><h1><s:property value="#product.name"/></h1></td></tr>
						<tr><td style="font-size: 16;height:80px;"><p><strong><s:property value="#product.description"/></strong></p></td></tr>
						<tr><td height="60px"><p>价格:￥<s:property value="#product.price"/></p></td></tr>
						<tr><td height="60px">
							<s:hidden name="productId" value="%{#product.productId}"/>
							<p>
							数量:<button style="height: 30px; width: 20px" id="decrease">-</button><input type="text" id="amountText" style="height: 30px; width: 30px" value="1"/><button id="increase" style="height: 30px; width: 20px">+</button>
							(库存<label id="repertory"><s:property value="#product.amount" /></label>件)
							</p>
						</td></tr>
						<tr><td height="60px">
							<div class="info">
								配送至：
								<select id="province" name="province"></select>  
							    <select id="city" name="city" ></select>  
							    <select id="country" name="country"></select>
							    <script type="text/javascript">_init_area();</script>
							</div>
						</td></tr>
						<tr><td height="60px">
							<button class="search-submit" id="addShopCar" style="width: 160px; height: 30px; font-size: 16px; font-family: 微软雅黑">
								<s:hidden name="username" value="%{#session.username}"/>
								<s:hidden name="role" value="%{#session.role}"/>
								<strong>加入购物车</strong>
							</button>
						</td></tr>
					</table>
					<div class="cl">&nbsp;</div>
				</div>
				<div style="width: 500px; height: 60px">
					<ul class="detailImg">
						<s:iterator value="#imageList" status="status">
							<li class="detailImg" id="<s:property />">
								<img alt="" width="53" height="53" src="${pageContext.request.contextPath }/icons/<s:property />">
							</li>
						</s:iterator>
					</ul>
				</div>
				<div style="float: left; width: 100%;">
					<table style="width: 100%; text-align: center;" class="reviewInfo">
						<tr>
							<td colspan="3" style="text-align: left; background-color: #DEDEDE;"><strong >商品评价</strong></td>
						</tr>
						<s:if test="%{#reviewList.size()>0}">
							<tr>
								<td>内容</td>
								<td>时间</td>
								<td>评价用户</td>
							</tr>
							<s:iterator value="reviewList">
								<tr>
									<td width="60%" height="40px" style="text-align: left;"><s:property value="content"/></td>
									<td><s:property value="reviewTime"/></td>
									<td><s:property value="user.name"/></td>
								</tr>
							</s:iterator>
						</s:if>
						<s:else>
							<tr style="border: none;"> 
								<td colspan="3" style="height: 150px;">暂无商品评价!</td>
							</tr>
						</s:else>
					</table>
					<br/>
				</div>
			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Main -->

	</div>
	<!-- End Shell -->
</body>
</html>