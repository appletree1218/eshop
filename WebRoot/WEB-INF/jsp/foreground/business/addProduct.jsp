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
    
    <title>添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		table{ text-align: left; border-collapse: collapse; }
		.field { background:#ebebeb; border:solid 1px #dedede; padding:2px;}
		.search-submit { width:70px; background:#8b0000; border:0; color:#fff; height:27px; line-height:26px; cursor:pointer; margin:5px 0 10px 0;}
		body{ align: center;color: #636363; }
		a { color:#8b0000; text-decoration: underline; cursor:pointer; }
		a:hover { color:#666; text-decoration: none; }
		.search-submit { width:70px; background:#8b0000; color:#fff; height:27px; line-height:26px; cursor:pointer; margin:5px 0 10px 0;}
	</style>
	<script src="js/jquery-1.8.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/foreground/addProduct.js"></script>
  </head>
  
  <body>
	<table id="productInfo" align="center">
		<s:form action="productAction_addProduct.action" enctype="multipart/form-data">
		<tr>
			<td>产品名称：</td>
			<td><s:textfield name="name"></s:textfield></td>
		</tr>
		<tr>
			<td>产品图片：</td>
			<td>
				<table>
					<tr>
						<td>
							<img width="40" height="40" alt="" src="" align="middle"/>
							<s:file name="uploadImages"></s:file><br/>
						</td>
					</tr>
					<tr>
						<td>
							<img width="40" height="40" alt="" src="" align="middle"/>
							<s:file name="uploadImages"></s:file><br/>
						</td>
					</tr>
					<tr>
						<td>
							<img width="40" height="40" alt="" src="/" align="middle"/>
							<s:file name="uploadImages"></s:file><br/>
						</td>
					</tr>
					<tr>
						<td>
							<img width="40" height="40" alt="" src="" align="middle"/>
							<s:file name="uploadImages"></s:file><br/>
						</td>
					</tr>
					<tr>
						<td>
							<img width="40" height="40" alt="" src="" align="middle"/>
							<s:file name="uploadImages"></s:file><br/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>数&nbsp;&nbsp;&nbsp;&nbsp;量：</td>
			<td><s:textfield name="amount"></s:textfield></td>
		</tr>
		<tr>
			<td>价&nbsp;&nbsp;&nbsp;&nbsp;格：</td>
			<td><s:textfield name="price"></s:textfield></td>
		</tr>
		<tr>
			<td>所属类型：</td>
			<td>
				<s:if test="%{#typeList.size()>0}">
					<s:select name="parentType" list="#typeList" headerKey="" headerValue="-请选择-" listKey="typeId" listValue="name"></s:select>
				</s:if>
				<select name="childType" style="width:85px"></select>
			</td>
		</tr>
		<tr>
			<td>状&nbsp;&nbsp;&nbsp;&nbsp;态：</td>
			<td>
				<input type="hidden" name="shopId" />
				<select name="productStatus"><option value="4">在售</option><option value="5">下架</option></select>
			</td>
		</tr>
		<tr>
			<td>产品描述：</td>
			<td ><s:textarea name="description" rows="4" cols="20" cssStyle="resize: none;"></s:textarea></td>
		</tr>
		<tr bordercolor="1">
			<td colspan="2" align="right"><input onclick="javascript:window.opener=null;window.returnValue='ok';window.close();" type="submit" class="search-submit" value="添加"/></td>
		</tr>
		</s:form>
	</table>
  </body>
</html>
