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
<script src="js/jquery-1.8.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<script src="js/foreground/userCenter.js" type="text/javascript"></script>
<style type="text/css">
	.productInfo{text-align:center; width:99.4%; margin-left: 2px; border-collapse: collapse; margin-top: 2px; }
	.productInfo tr{border:solid 1px #DEDEDE;}
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
								<li style="font-size: 18px;margin-top: 19px" class="colorStyle">
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
		                    	<td style="color:#8b0000;">&nbsp;&nbsp;商品评价</td>
			                </tr>
			         </table>
				</td>
			</tr>
			<tr>
				<s:form action="reviewAction_publishReview.action">
					<td align="center" valign="top">
						<table width="100%" class="productInfo">
							<tr style="border: solid 1px #DEDEDE; text-align: left;">
								<td colspan="3">&nbsp;商品信息</td>
							</tr>
							<tr style="border: solid 1px #DEDEDE;">
								<td>
									<img width="100px" height="100px" src='${pageContext.request.contextPath }/icons/
									<s:if test="%{#product.images.contains('png,')}"><s:property value="#product.images.substring(0,#product.images.indexOf(','))"/></s:if>
									<s:else>
										<s:property value ="#product.images" />
									</s:else>'><br/>
									<s:property value="#product.name"/>
								</td>
								<s:hidden name="username" value="%{#session.username}" />
								<s:hidden name="productId" value="%{#product.productId}"></s:hidden>
								<td width="120px">￥<s:property value="#product.price"/></td>
								<td style="text-align: left;"><s:property value="#product.description"/></td>
							</tr>
							<tr style="text-align: left; border: none;">
								<td colspan="3">&nbsp;发表评价</td>
							</tr>
							<tr style="text-align: left; border: none;">
								<td colspan="3">
									<s:textarea name="content" rows="4" style="resize:none; width: 100%"></s:textarea>
								</td>
							</tr>
							<tr style="text-align: right; border: none;">
								<td colspan="3">
									<input id="review" class="search-submit" type="button" value="评&nbsp;&nbsp;&nbsp;价"/>
								</td>
							</tr>
						</table>
					</td>
				</s:form>
			</tr>
		</table>
	</div>
</body>
</html>