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
	font-size: 12px;
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
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/fuzzyQuery.js"></script>
</head>

<body>
<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
        <td valign="top">
        	<table width="100%" border="0" align="top" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="2%" height="19" valign="bottom"><div align="center"><img src="images/background/tb.gif" width="14" height="14" /></div></td>
                            <td width="98%" valign="bottom"><span class="STYLE1">商家基本信息精确查询</span></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr>
                <td height="30" style="border: solid 1px #A8C7CE" align="center">
                	<table width="30%" border="0" cellspacing="0" cellpadding="0">
                		<tr>
                			<s:form action="businessAction_getBusinessById.action">
	                			<td align="right"><label style="font-size: 14px">请输入商家id：</label></td>
	                			<td align="center"><s:textfield name="key"/></td>
                				<td align="left"><s:submit value="查询"></s:submit></td>
               				</s:form>
                		</tr>
                	</table>
                </td>
              </tr>
              <tr>
              	<td>
              		<c:if test="${ msg==null}">
              		<c:if test="${ list.size() > 0}">
              			<c:if test="${list.get(0)!=null }">
	              		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
	              		  <tr>
		                    <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">商家编号</span></div></td>
		                    <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">商家名</span></div></td>
		                    <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">密码</span></div></td>
		                    <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">头像</span></div></td>
		                    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">邮箱</span></div></td>
		                    <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">身份证号</span></div></td>
		                    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">电话</span></div></td>
		                    <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">角色</span></div></td>
		                    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">所属店铺名称</span></div></td>
		                    <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">备注</span></div></td>
		                  </tr>
		                  <s:iterator value="#list">
			              	<tr bgcolor="white" align="center" style="font-size: 14px">
			              		<td><s:property value="businessId"/></td>
			              		<td><s:property value="name"/></td>
			              		<td><s:label>******</s:label><s:hidden value="<s:property value='password'/>"></s:hidden></td>
			              		<td><img alt="" height="30" width="30" src='icons/<s:property value ="icon" />'></td>
			              		<td><s:property value="email"/></td>
			              		<td><s:property value="identityId"/></td>
			              		<td><s:property value="phone"/></td>
			              		<td><s:property value="role.name"/></td>
			              		<td><s:property value="shop.name"/></td>
			              		<td><s:property value="description"/></td>
			              	</tr>
			              </s:iterator>
		                </table>
	                	 </c:if>
		             	 </c:if>
		             	 </c:if>
		             	<s:property value="%{#msg}"/>
	                	<c:if test="${ list.size() == 1}">
	                		<c:if test="${list.get(0)==null }">
		                		<h2 align="center">无记录!</h2>
	                		</c:if>
	                	</c:if>
              	</td>
              </tr>
            </table>
        </td>
        <td width="8">&nbsp;</td>
        <td width="8" height="441" bgcolor="#353c44">&nbsp;</td>
  	</tr>
</table>
</body>
</html>
