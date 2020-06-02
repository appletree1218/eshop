<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/clock.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/top.js"></script>
<title>top</title>
<style type="text/css">
<!--
body {
	margin:0px 0px 0px 0px;
}
#quit{
	cursor: pointer;
}
.STYLE1 {
	font-size: 12px;
	color: #000000;
}
.STYLE5 {font-size: 12}
.STYLE7 {font-size: 12px; color: #FFFFFF; }
a{
	cursor: pointer;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="${pageContext.request.contextPath }/images/background/main_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="378" height="57" background="${pageContext.request.contextPath }/images/background/main_01.gif">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="281" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="27"><img src="${pageContext.request.contextPath }/images/background/main_05.gif" width="33" height="27" /></td>
            <td width="248" background="${pageContext.request.contextPath }/images/background/main_06.gif"><table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="17"><div align="right"><s:a action="forwardAction_updatePassword.action" target="rightFrame"><img src="${pageContext.request.contextPath }/images/background/pass.gif" width="69" height="17" /></s:a></div></td>
                <td><div align="right"><img src="${pageContext.request.contextPath }/images/background/user.gif" width="69" height="17" /></div></td>
                <td><div align="right"><s:a target="_parent" id="quit"><img src="${pageContext.request.contextPath }/images/background/quit.gif" width="69" height="17" /></s:a></div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" background="images/background/main_10.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="194" height="40" background="images/background/main_07.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        </table></td>
        <td width="248" background="images/background/main_11.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="16%"><span class="STYLE5"></span></td>
            <td width="65%"><div align="center" class="STYLE7">时间：<span class="STYLE7">2008-03-18 14:35:56</span></div></td>
            <td width="19%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30" background="images/background/main_31.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" height="30"><img src="images/background/main_28.gif" width="8" height="30" /></td>
        <td width="147" background="images/background/main_29.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="24%">&nbsp;</td>
            <td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="39"><img src="images/background/main_30.gif" width="39" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="20" valign="bottom"><span class="STYLE1">当前登录用户：<s:property value="#session.name"/> &nbsp;</span></td>
            <td valign="bottom" class="STYLE1"><div align="right"></div></td>
          </tr>
        </table></td>
        <td width="17"><img src="images/background/main_32.gif" width="17" height="30" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>