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
	<script src="js/jquery-1.8.js" type="text/javascript"></script>	
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>	
	<script src="js/jquery-func.js" type="text/javascript"></script>	
	<script src="js/foreground/shopCar.js" type="text/javascript"></script>	
	<style type="text/css">
		.productInfo{text-align:center; margin-left: 1px; border-collapse: collapse; margin-top: 2px}
		.productInfo tr{border:solid 1px #DEDEDE; padding-left: 2px}
		#slider { position:relative; overflow:hidden; }
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
                            	<s:hidden name="username" value="%{#session.username}" />
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
			<div id="slider" style="height: 852px;position:relative; overflow:hidden; border: 0px" class="box" style="border: 0px">
				<c:if test="${isExist==false }">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>购物车中暂无商品!</h1>
				</c:if>
				<c:if test="${isExist==true }">
					<table class="productInfo">
						<tr>
							<td width="25px"><input id="allcheck" type="checkbox" /></td>
							<td colspan="2" style="text-align: left;">商品</td>
							<td width="100px">单价</td>
							<td width="100px">数量</td>
							<td width="100px">小计</td>
							<td width="43px">操作</td>
						</tr>
						<s:iterator value="shopCarList" var="shopCar">
							<tr>
								<td><input name="check" type="checkbox" id='<s:property value="productId" />' /></td>
								<td width="80px" align="center">
									<table>
										<tr><td align="center">
											<img width="100px" height="100px" src='${pageContext.request.contextPath }/icons/<s:property value="#shopCar.product.images"/>'>
										</td></tr>
										<tr><td align="center">
											<s:property value='#shopCar.product.name'/>
										</td></tr>
									</table>
								</td>
								<td width="530px" style="text-align: left;"><s:property value="#shopCar.product.description"/></td>
								<td>
									<label id="price"><s:property value='#shopCar.product.price'/></label>
								</td>
								<td>
									<s:hidden name="scId" value="%{#shopCar.scId}"/>
									<s:hidden name="username" value="%{#session.username}"></s:hidden>
									<button style="height: 30px; width: 20px" name="decrease">-</button>
									<input type="text" id="<s:property value='#shopCar.product.productId'/>" name="amountText" style="height: 30px; width: 30px;" disabled="disabled" value='<s:property value="#shopCar.amount"/>'/>
									<button name="increase" style="height: 30px; width: 20px">+</button>
								</td>
								<td><s:property value="%{#shopCar.amount*#shopCar.product.price}"/></td>
								<td><a name="del" id="<s:property value='#shopCar.product.productId'/>">删除</a></td>
							</tr>
						</s:iterator>
						<s:if test="">
						<tr style="border-style: none;">
							<th colspan="7" style="text-align: right;">									
								<a href="foreBusinessAction_forwardProduct?currentNum=1">首页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.pageNum==1?1:#page.pageNum-1'/>">上一页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.pageNum==#page.totalPage?#page.totalPage:#page.pageNum+1'/>">下一页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.totalPage'/>">尾页</a>
							</th>
						</tr>
						</s:if>
						
						<tr style="border: 0px">
							<th colspan="7" align="right">
								<a href="#"><button name="pay" class="search-submit">结算</button></a>
							</th>
						</tr>
					</table>
				</c:if>
			</div>
			<!-- End Content Slider -->
		</div>
		<div class="cl">&nbsp;</div>
	</div>
	<!-- End Main -->
</body>
</html>