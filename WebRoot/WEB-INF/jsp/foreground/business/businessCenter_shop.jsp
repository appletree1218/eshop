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
	<script src="js/jquery-1.8.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/js/foreground/businessCenter.js" type="text/javascript"></script>
	<script src="js/tab.js" type="text/javascript"></script>
	<style type="text/css">
		.modifyInfor td{
			width: 80px;
			height: 50px;
			text-align: left;
		}
		.modifyInfor input{
			width: 300px;
		}
		#orderTable{border-collapse: collapse;}
		#orderTable td{border:solid 1px #DEDEDE; }
		#shopEmployee{border-collapse: collapse; margin-left: 3px; text-align: center;}
		#shopEmployee td{border:solid 1px #DEDEDE; }
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
			<tr height="12%">
				<td rowspan="3" width="20%" valign="top">
					<div id="sidebar">
						<div class="box categories" align="center">
							<h2 align="center">
								个人信息 <span></span>
							</h2>
							<div class="box-content">
								<img alt="暂无头像图片" width="200" height="200"
									src='${pageContext.request.contextPath }/icons/<s:property value ="icon" />'><br>
								<s:a action="foreBusinessAction_updatePwd.action">修改密码</s:a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="">退出</s:a>
								<ul style="text-align: center;">
									<li>角色：<s:property value="role.name" /></li>
									<li>店铺：<s:property value="%{shop==null?'无':shop.name}" /></li>
									<li></li>
								</ul>
								个人描述：
								<s:property value="%{description==null?'无':description}" />
							</div>
						</div>
					</div>
				</td>
				<td height="5%" valign="top">
					<table width="100%" border="0" style="text-align: center;" >
						<tr>
							<td bgcolor="#dedede"><s:a action="foreBusinessAction_businessCenter.action" cssStyle="text-decoration: none;">个人信息修改</s:a></td>
							<td bgcolor="#dedede" style="border-bottom: solid 2px #8B0000;"><s:a action="foreBusinessAction_forwardShop.action" cssStyle="text-decoration: none;">店铺管理</s:a></td>
							<td bgcolor="#dedede" ><s:a action="foreBusinessAction_forwardProduct?currentNum=1" cssStyle="text-decoration: none;">商品管理</s:a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height="150">
				<td align="left" valign="top">
                	 <c:if test="${shop!=null }">
	                	 <table style="text-align: center;border:solid 1px #DEDEDE;margin-left:2px;">
	                	 	<tr height="50">
	                	 		<td width="422" align="left">
	                	 			<span style="font-size:30px">${shop.name }</span>
	                	 			<input type="hidden" value="${shop.shopId }" />
	                	 		</td>
	                	 		<td width="300" align="center" rowspan="4">
	                	 			<img alt="" src='${pageContext.request.contextPath }/icons/<s:property value ="%{#shop.logo}" />' width="200" height="100">
	                	 		</td>
	                	 	</tr>
	                	 	<tr align="left">
	                	 		<td>注册时间：${shop.regTime }</td>
	                	 	</tr>
	                	 	<tr align="left">
	                	 		<td>地址：${shop.address }</td>
	                	 	</tr>
	                	 	<tr align="left">
	                	 		<td>状态：${shop.status.name }</td>
	                	 	</tr>
	                	 	<tr align="left">
	                	 		<td>店铺描述：${shop.description==""?"无": shop.description}</td>
	                	 		<td align="center">
	                	 			<a href="foreBusinessAction_forwardShop?flag=1" name="shopManage">修改店铺信息</a>
	                	 			<a href="foreBusinessAction_forwardShop?flag=2" name="shopManage">店铺人员管理</a>
	                	 			<a href="foreBusinessAction_forwardShop?flag=3" name="shopManage">订单管理</a>
	                	 			<s:hidden value="%{shop.status.statusId}" name="status"></s:hidden>
	                	 			<s:hidden value="%{shop.status.name}" name="statusName"></s:hidden>
	                	 		</td>
	                	 	</tr>
	                	 </table>
                	 </c:if>
                	 <c:if test="${shop==null }">
                	 	<font style="margin-left: 250px;font-size: 16px">
                	 		<s:if test="%{role.roleId==1}">
                	 		尚无创建店铺！点<s:a cssStyle="font-size: 16px" action="foreForwardAction_registerShop.action">这里</s:a>创建店铺
                	 		</s:if>
                	 		<s:else>
                	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	 		尚无关联店铺！	
                	 		</s:else>
                	 	</font>
                	 </c:if>
				</td>
			</tr>
			<tr height="300px" bordercolor="red">
				<td valign="top"><!-- 修改店铺信息 -->
					<c:if test="${flag==1 }">
						<s:if test="%{role.roleId==2}">
								<script type="text/javascript">alert("对不起，您没有权限修改!");</script>
						</s:if>
						<s:else>
							<s:form action="foreBusinessAction_foreUpdateShop.action" enctype="multipart/form-data">
								<table border="0" style="margin: 5px;" class="modifyInfor">
									<tr>
										<s:hidden name="statusId" value="%{#shop.status.statusId}"></s:hidden> 
										<s:hidden name="shopId" value="%{#shop.shopId}"></s:hidden>
										<td>店铺名称:</td>
										<td><s:textfield name="name" cssClass="field" value="%{shop.name}"></s:textfield></td>
										<s:hidden name="regTime" value="%{shop.regTime}"></s:hidden>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>店铺logo:</td>
										<td><s:file cssClass="field" name="uploadImage"></s:file></td>
										<s:hidden name="logo" value="%{shop.logo}"></s:hidden>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>地址:</td>
										<td><s:textfield cssClass="field" name="address" value="%{shop.address}"></s:textfield></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>店铺描述:</td>
										<td><s:textfield cssClass="field" name="description" value="%{shop.description}"></s:textfield></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td colspan="3" style="text-align: right;">
											<s:submit cssClass="search-submit" cssStyle="width:75" value="确认"></s:submit>
											<s:a action="foreBusinessAction_forwardShop.action"><button class="search-submit">取消</button></s:a> 
										</td>
									</tr>
								</table>
							</s:form>	
						</s:else>
					</c:if>
					<!-- 店铺人员管理 -->
					<c:if test="${flag==2}">
						<s:if test="%{role.roleId==2}">
							<script type="text/javascript">alert("对不起，您没有权限管理!");</script>
						</s:if>
						
						<table id="shopEmployee">
							<tr>
								<th colspan="7" align="right"><a name="add">添加</a>&nbsp;&nbsp;&nbsp;</th>
							</tr>	
							<tr style="border: none;">
								<td width="50px">编号</td>
								<td width="72px">姓名</td>
								<td width="150px">身份证号</td>
								<td width="100px">电话</td>
								<td width="150px">电子邮箱</td>
								<td width="150px">备注</td>
								<td width="50px">操作</td>
							</tr>
							<s:iterator value="#shopEmployee">
								<tr>
									<td><s:property value="businessId"/></td>
									<td><s:property value="name"/></td>
									<td><s:property value="identityId"/></td>
									<td><s:property value="phone"/></td>
									<td><s:property value="email"/></td>
									<td><s:property value="description"/></td>
									<td><a name="delete" id="<s:property value='businessId'/>">删除</a></td>
								</tr>
							</s:iterator>
						</table>
					</c:if>
					<!-- 订单管理 -->
					<c:if test="${flag==3 }">
						<table id="orderTable" width="99.9%" style="margin: 2px 0px 2px 2px; text-align: center;">
							<tr>
								<td>订单号</td>
								<td>买家id</td>
								<td>买家昵称</td>
								<td>下单时间</td>
								<td>商品编号</td>
								<td>数量</td>
								<td>订单状态</td>
							</tr>
							<s:iterator value="#orderList" var="order">
								<tr>
									<td rowspan="<s:property value='#order.shopcars.size()+1'/>">
										<a name="orderNumber"><s:property value="number"/></a>	
									</td>
									<td rowspan="<s:property value='#order.shopcars.size()+1'/>">
										<s:property value="#order.user.userId"/>
									</td>
									<td rowspan="<s:property value='#order.shopcars.size()+1'/>">
										<s:property value="#order.user.name"/>
									</td>
									<td rowspan="<s:property value='#order.shopcars.size()+1'/>"><s:property value="createDate"/></td>
								</tr>
								<s:iterator value="#order.shopcars" var="shopcars">
									<tr>
										<td><s:property value="#shopcars.product.productId"/></td>
										<td>
											<s:property value="amount"/>
										</td>
										<td>
											<s:property value="status.name"/>	
										</td>
									</tr>
								</s:iterator>
							</s:iterator>
						</table>
					</c:if>
				</td>
			</tr>
		</table>
     </div>
</body>
</html>