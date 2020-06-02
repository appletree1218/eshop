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
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/showAdver.js"></script>
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
                            <td width="98%" valign="bottom"><span class="STYLE1">广告展示管理</span></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>
                	<table class="STYLE10" style="border: solid 1px #A8C7CE;width:100%;height:450px;text-align: right;" cellpadding="0" cellspacing="0" onmouseover="changeto()"  onmouseout="changeback()">
                		<s:form action="showAction_changeShowAdver.action" enctype="multipart/form-data">
                		  <tr align="right">
		                  	<td width="50px"></td>
		                  	<td width="150px">选择需要更换广告的位置：</td>
		                  	<td align="left">
		                    	<select name="index"><option value="1">第一张</option><option value="2">第二张</option><option value="3">第三张</option><option value="4">第四张</option></select>
		                    </td>
		                  </tr>
		                  <tr align="right">
		                  	<td width="50px"></td>
		                  	<td>当前广告图片：</td>
		                  	<td align="left">
		                    	<img id="adverImg" width="400" height="200"  alt="" src="${pageContext.request.contextPath }/icons/adver01.png">
		                    </td>
		                  </tr>
		                  <tr align="right" style="border-top: solid 1px #A8C7CE; height: 50px">
		                  	<td width="50px"></td>
		                    <td height="20" bgcolor="white">
		                    	广告图片：
		                    </td>
		                    <td align="left">
		                    	<s:file name="uploadImage"></s:file>
		                    </td>
		                  </tr>
		                  <%-- <tr align="right" style="height: 50px">
		                  	<td width="50px"></td>	
		                    <td height="20" bgcolor="white" class="STYLE10">
		                    	对应商品id：
		                    </td>
		                    <td align="left">
		                    	<select style="width:200px;"></select>
		                    </td>
		                  </tr> --%>
		                  <tr align="center" style="height: 30px">
		                    <td style="" colspan="3">
		                    	<s:submit value="更换"></s:submit>
		                    </td>
		                  </tr>
	                  	</s:form>
               		</table>
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
