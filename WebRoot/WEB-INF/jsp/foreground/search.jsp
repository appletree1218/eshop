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
	<title>搜索</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<script src="${pageContext.request.contextPath }/js/jquery-1.8.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath }/js/jquery.jcarousel.pack.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath }/js/jquery-func.js" type="text/javascript"></script>	
	<script src="${pageContext.request.contextPath }/js/foreground/search.js" type="text/javascript"></script>	
</head>
<body>
	
<!-- Shell -->	
<div class="shell">
	<!-- Header -->	
	<div>
    	<table bgcolor="#8b0000" width="100%" height="64px">
        	<tr>
        		<s:form action="searchAction_getList.action">
	            	<td width="26.5%">
	            		<a href="index.jsp"><img alt="" src="${pageContext.request.contextPath }/images/foreground/logo.png" /></a>
	            	</td>
	                <td width="24%"><input type="text" class="field" style="width:220px" name="key" value="<s:property value='%{#key}'/>"/><br /></td>
	                <td width="13.5%"> 
	                	<select class="field" style="width:120px;text-align:center" name="type">
	                    	<option>商品</option>
	                    	<option>店铺</option>
	                	</select>
	                </td>
	                <td><a class="aStyle">搜索</a></td>
                </s:form>
                <td>
                	<div id="navigation">
                		<c:if test="${sessionScope.username==null }">
	                        <ul>
	                            <li>
	                            	<a href="foreForwardAction_login.action">登&nbsp;&nbsp;&nbsp;陆</a>
	                            	<s:hidden value="%{#session.username}"></s:hidden>
	                            </li>
	                            <li><a href="foreForwardAction_register.action">注&nbsp;&nbsp;&nbsp;册</a></li>
	                            <li><a href="#" id="shopCar">购&nbsp;物&nbsp;车</a></li>
	                        </ul>
                        </c:if>
                        <c:if test="${sessionScope.username!=null }">
	                        <ul>
	                            <li class="colorStyle">你好,</li>
	                            <li><s:a action="foreForwardAction_businessCenter.action"><s:property value="%{#session.username}"/></s:a></li>
	                            <c:if test="${sessionScope.role=='买家' }">
	                            	<li><s:a action="foreForwardAction_userCenter.action" id="shopCar">购&nbsp;物&nbsp;车</s:a></li>
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
			<table border="1">
				<c:if test="${type=='product' }">
					<s:iterator value="#productList">
						<tr>
							<td><img src="" alt=""></td>
							<td>商品</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</s:iterator>
				</c:if>
				<c:if test="${type=='shop' }">
					<s:iterator value="#shopList">
						<tr>
							<td><img src="" alt=""></td>
							<td>店铺</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</s:iterator>
				</c:if>
			</table>
			<table align="center">
				<s:if test="%{#list.size()==0&&#type=='商品'}">
					<tr>
						<td><h1 style="font-size: 20px">没有找到与"<s:property value='%{#key}'/>"相关的商品</h1></td>
					</tr>
				</s:if>
				<s:elseif test="%{#list.size()==0&&#type=='店铺'}">
					<tr>
						<td><h1 style="font-size: 20px">没有找到与"<s:property value='%{#key}'/>"相关的店铺</h1></td>
					</tr>
				</s:elseif>
			</table>
			<s:else>
				<div class="products-search">
				<div class="cl">&nbsp;</div>
				<ul style="list-style-type: none;">
					<s:iterator value="#list">
						<li><a href="productAction_forwardDetail?id=<s:property value='productId'/>"><img width="232px" height="241px"
								src="${pageContext.request.contextPath}/icons/<s:property value='images'/>"
								alt="" /></a>
						<div class="product-info">
							<h3><s:property value="name" /></h3>
							<div class="product-desc">
								<p><s:property value="description" /></p>
								<strong class="price">￥<s:property value="price"/></strong>
							</div>
						</div></li>
					</s:iterator>
			    </ul>
			    </div>
			</s:else>
			</div>
		</div>
		
		<div class="cl">&nbsp;</div>
</body>
</html>