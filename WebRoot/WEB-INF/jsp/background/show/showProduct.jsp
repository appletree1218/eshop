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
<title>list</title>
<style type="text/css">
body {
	margin: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
a{
	cursor: pointer;
	color: #e1e2e3;
	font-size: 12px;
	text-decoration: none;
}
#info td{ border: solid 0.01px #A8C7CE; }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/showProduct.js"></script>
</head>

<body>
<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
        <td valign="top">
        	<table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="2%" height="19" valign="bottom"><div align="center"><img src="images/background/tb.gif" width="14" height="14" /></div></td>
                            <td width="98%" valign="bottom"><span class="STYLE1">商品展示管理</span></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>
                	<table class="STYLE10" style="border: solid 1px #A8C7CE;width:100%;text-align: right;" cellpadding="0" cellspacing="0" onmouseover="changeto()"  onmouseout="changeback()">
               		  <s:form action="showAction_showProduct.action">
                		  <tr align="right">
		                  	<td width="50px"></td>
		                  	<td width="150px">选择需要更换商品的位置：</td>
		                  	<td align="left" width="180px">
		                    	第<select name="rowNum"><option value="1">一</option><option value="2">二</option></select>行
		                    	第<select name="colNum"><option value="1">一</option><option value="2">二</option><option value="3">三</option></select>列
		                    </td>
		                     <td height="20" bgcolor="white" style="text-align: left;">
			                    	商品编号：<s:textfield name="productId"></s:textfield><input type="submit" value="查询" />
		                    </td>
		                  	</tr>
                    	</s:form>
	                </table>
	           	</td></tr>
	           	</table>
	           	<s:if test="#productList.size()>0">
           		<table class="STYLE10" id="info" style="width:100%;text-align: right;border-collapse: collapse;" cellpadding="0" cellspacing="0">
           			<tr>
	                   <td width="10%" height="20px" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">商品编号</span></div></td>
	                   <td width="20%" height="20px" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">商品名</span></div></td>
	                   <td width="10%" height="20px" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">数量</span></div></td>
	                   <td width="10%" height="20px" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">价格</span></div></td>
	                   <td width="40%" height="20px" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">描述</span></div></td>
	                   <td width="10%" height="20px" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
           			</tr>
           			<s:iterator value="#productList">
           				<tr bgcolor="white" align="center" style="font-size: 14px">
		              		<td><s:property value="productId"/></td>
		              		<td style="text-align: left;"><s:property value="name"/></td>
		              		<td><s:property value="amount"/></td>
		              		<td><s:property value="price"/></td>
		              		<td style="text-align: left;"><s:property value="description"/></td>
		              		<td>
	              				<button name="change" id="<s:property value='productId'/>">更换</button>
	              			</td>
             			</tr>
           			</s:iterator>
           		</table>
           		</s:if>
        </td>
        <td width="8">&nbsp;</td>
        <td width="8" height="441" bgcolor="#353c44">&nbsp;</td>
  	</tr>
</table>
</body>
</html>
