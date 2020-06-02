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
<title>首页</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.jcarousel.pack.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery-func.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/foreground/index.js"
	type="text/javascript"></script>
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
										<s:hidden value="%{#session.username}"></s:hidden></li>
									<li><a href="foreForwardAction_register.action">注&nbsp;&nbsp;&nbsp;册</a></li>
									<li><a href="#" id="shopCar">购&nbsp;物&nbsp;车</a></li>
								</ul>
							</c:if>
							<c:if test="${sessionScope.username!=null }">
								<ul>
									<li class="colorStyle">你好,</li>
									<c:if test="${sessionScope.role=='买家' }">
										<li><s:a action="foreUserAction_userCenter.action">
												<s:property value="%{#session.username}" />
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
		<div id="main">
			<div class="cl">&nbsp;</div>

			<!-- Content -->
			<div id="content">
				<!-- Products -->
				<div class="products">
					<div class="cl">&nbsp;</div>
					<ul>
						<s:iterator value="#typeProductList" status="status">
							<li class="last1" style="margin-right: 5px"><a href="productAction_forwardDetail?id=<s:property value='productId'/>"><img width="232px" height="241px" src="${pageContext.request.contextPath}/icons/<s:property value='images'/>" alt="" /></a>
							<div class="product-info">
								<h3><s:property value="name"/></h3>
								<div class="product-desc">
									<p><s:property value="description"/></p>
									<strong class="price">￥<s:property value="price"/></strong>
								</div>
							</div>
							</li>
						</s:iterator>
					</ul>
					<div class="cl">&nbsp;</div>
				</div>
				<div style="text-align: right; font-size: 15px;">
					<a href="foreForwardAction_forwardCatalog?currentNum=1&typeId=<s:property value='typeId'/>">首页</a>&nbsp;&nbsp;
					<a href="foreForwardAction_forwardCatalog?currentNum=<s:property value='#page.pageNum==1?1:#page.pageNum-1'/>&typeId=<s:property value='typeId'/>">上一页</a>&nbsp;&nbsp;
					第<s:property value="#page.pageNum"/>页/共<s:property value="#page.totalPage"/>页&nbsp;&nbsp;
					<a href="foreForwardAction_forwardCatalog?typeId=<s:property value='typeId'/>&currentNum=<s:property value='#page.pageNum==#page.totalPage?#page.totalPage:#page.pageNum+1'/>">下一页</a>&nbsp;&nbsp;
					<a href="foreForwardAction_forwardCatalog?typeId=<s:property value='typeId'/>&currentNum=<s:property value='#page.totalPage'/>">尾页</a>
				</div>
				<!-- End Products -->
			</div>
			<!-- End Content -->

			<!-- Sidebar -->
			<div id="sidebar">
				<div class="box categories" align="center">
					<h2 align="left">
						商品分类 <span></span>
					</h2>
					<div class="box-content">
						<ul>
							<s:iterator value="#typeList" var="parent">
								<s:if test="%{parentId==0}">
									<li class="parentLi"><img style="vertical-align:middle;"
										src="${pageContext.request.contextPath }/images/foreground/<s:property value='imgPath'/>">
										<a><s:property value="name" /></a></li>
									<li>
										<ul class="childLi">
											<s:iterator value="#typeList" var="child" status="index">
												<s:if test="%{#parent.typeId==parentId}">
													<li><a href="foreForwardAction_forwardCatalog?currentNum=1&typeId=<s:property value='typeId'/>"><s:property value="name" /></a></li>
												</s:if>
											</s:iterator>
										</ul>
									</li>
								</s:if>
							</s:iterator>
						</ul>
					</div>
				</div>
			</div>
			<!-- End Sidebar -->

			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Main -->
	</div>
	<!-- End Shell -->
</body>
</html>