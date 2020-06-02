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
<title>商家中心</title>
<link type="text/css" rel="stylesheet" href="css/tab.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery-func.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/tab.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/foreground/businessCenter.js" type="text/javascript"></script>
<style type="text/css">
	#productInfo{margin-left: 1px; text-align: center; border-collapse: collapse; margin-top: 2px}
	#productInfo td{border:solid 1px #DEDEDE; }
</style>
</head>
<body>

	<!-- Shell -->
	<div class="shell">
		<!-- Header -->
		<div>
			<table bgcolor="#8b0000" width="100%" height="64px">
				<tr>
					<td width="26.5%"><h1 style="font-size: 30px;color: white;">商家中心</h1></td>
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
				<td rowspan="3" width="200px" valign="top">
					<div id="sidebar">
						<div class="box categories" align="center">
							<h2 align="center">
								个人信息 <span></span>
							</h2>
							<div class="box-content">
								<img alt="暂无头像图片" width="200" height="200"
									src='icons/<s:property value ="icon" />'><br>
								<s:a action="foreBusinessAction_updatePwd.action">修改密码</s:a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="">退出</s:a>
								<ul style="text-align: center;margin-bottom: 8px">
									<li>角色：<s:property value="role.name" /></li>
									<li>店铺：<s:property value="%{shop==null?'无':shop.name}" /></li>
									<s:hidden value="%{shop==null?'无':shop.shopId}"></s:hidden>
								</ul>
								个人描述：
								<s:property value="%{description==null?'无':description}" />
							</div>
						</div>
					</div>
				</td>
				<td height="2 0px" valign="top">
					<table width="735px" border="0" style="text-align: center;border: solid 1px #fff" >
						<tr>
							<td bgcolor="#dedede"><s:a action="foreBusinessAction_businessCenter.action" cssStyle="text-decoration: none;">个人信息修改</s:a></td>
							<td bgcolor="#dedede"><s:a action="foreBusinessAction_forwardShop.action" cssStyle="text-decoration: none;">店铺管理</s:a></td>
							<td bgcolor="#dedede" style="border-bottom: solid 2px #8B0000;"><s:a action="foreBusinessAction_forwardProduct?currentNum=1" cssStyle="text-decoration: none;">商品管理</s:a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" valign="top">
					<s:if test="%{shop==null}">
						<font style="font-size: 16px">尚无店铺,无法进行商品管理!</font>
					</s:if>
					<s:else>
						<table style="text-align: center;margin-left: 2.5px" id="productInfo">
							<tr><th colspan="8" align="right"><a name="addProduct">添加</a>&nbsp;&nbsp;&nbsp;</th></tr>
							<tr>
								<td width="50px">编号</td>
								<td width="100px">产品名称</td>
								<td width="70px">数量</td>
								<td width="80px">价格</td>
								<td width="80px">所属类型</td>
								<td width="80px">状态</td>
								<td width="158px">产品描述</td>
								<td width="100px">操作</td>
							</tr>
							<s:iterator value="#pageList">
								<tr>
									<td><s:property value="productId"/></td>
									<td style="text-align: left;"><s:property value="name"/></td>
									<td><s:property value="amount"/></td>
									<td>￥<s:property value="price"/></td>
									<td><s:property value="type.name"/></td>
									<td><s:property value="status.name"/></td>
									<td style="text-align: left;"><s:property value="description"/></td>
									<td><a name="updateProduct" id="<s:property value='productId'/>">修改</a>&nbsp;&nbsp;&nbsp;<a name="del" id="<s:property value='productId'/>">删除</a></td>
								</tr>
							</s:iterator>
							<tr>
								<th colspan="8" style="text-align: right;">
									<a href="foreBusinessAction_forwardProduct?currentNum=1">首页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.pageNum==1?1:#page.pageNum-1'/>">上一页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.pageNum==#page.totalPage?#page.totalPage:#page.pageNum+1'/>">下一页</a>&nbsp;&nbsp;<a href="foreBusinessAction_forwardProduct?currentNum=<s:property value='#page.totalPage'/>">尾页</a>
								</th> 
							</tr>
						</table>
					</s:else>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>