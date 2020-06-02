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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/background/userList.js"></script>
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
                            <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/background/tb.gif" width="14" height="14" /></div></td>
                            <td width="94%" valign="bottom"><span class="STYLE1">用户基本信息列表</span></td>
                          </tr>
                        </table></td>
                        <td><div align="right"><span class="STYLE1">
                          <input type="checkbox" name="checkbox1" id="checkbox1" />
                          全选      &nbsp;&nbsp;
                          <s:a action="userAction_addUI.action" id="add"><img src="images/background/add.gif" width="10" height="10"/> 添加    &nbsp;</s:a>
                          <s:a action="" id="delete"><img src="images/background/del.gif" width="10" height="10" /> 删除    &nbsp;&nbsp;</s:a>
                          <s:a action="" id="update"><img src="images/background/edit.gif" width="10" height="10" /> 编辑   &nbsp;</s:a></span><span class="STYLE1"> &nbsp;</span></div></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
                  <tr>
                    <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
                      <input type="checkbox" name="checkbox2" id="checkbox2"/>
                    </div></td>
                    <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户编号</span></div></td>
                    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
                    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">密码</span></div></td>
                    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">头像</span></div></td>
                    <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">邮箱</span></div></td>
                    <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">身份证号</span></div></td>
                    <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">电话</span></div></td>
                    <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">备注</span></div></td>
                  </tr>
                  <s:iterator value="#page.records">
	              	<tr bgcolor="white" align="center" style="font-size: 14px">
	              		<td width="4%" height="20" class="STYLE10"><div align="center">
	              			<!-- <input type="checkbox" name="checkbox" id='<s:property value="userId"/>' />  -->
	              			<s:checkbox name="checkbox"></s:checkbox>
	                    </div></td>
	              		<td><s:property value="userId"/></td>
	              		<td><s:property value="name"/></td>
	              		<td><s:label>******</s:label><s:hidden value="<s:property value='password'/>"></s:hidden></td>
	              		<td><img alt="" height="30" width="30" src='icons/<s:property value ="icon" />'></td>
	              		<td><s:property value="email"/></td>
	              		<td><s:property value="identityId"/></td>
	              		<td><s:property value="phone"/></td>
	              		<td><s:property value="description" escape="false"/></td>
	              	</tr>
             	 </s:iterator>
                </table></td>
              </tr>
              <tr>
                <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong id="totalData"> <s:property value="#page.records.size()"/></strong> 条记录，当前第<strong> <s:property value="#page.pageNum"/></strong> 页，共 <strong><s:property value="#page.totalPage"/></strong> 页</span></div></td>
                    <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="49"><div align="center">
                        	<a href="userAction_getUserList?pageNum=1"><img src="images/background/main_54.gif" width="40" height="15" /></a>
                        	</div>
                        </td>
                        <td width="49"><div align="center">
                        	<a href="userAction_getUserList?pageNum=${page.pageNum-1==0?1:page.pageNum-1}"><img src="images/background/main_56.gif" width="45" height="15" /></a>
                        </div>
                        </td>
                        <td width="49"><div align="center">
                        	<a href="userAction_getUserList?pageNum=${page.pageNum==page.totalPage?page.totalPage:page.pageNum+1}"><img src="images/background/main_58.gif" width="45" height="15" /></a>
                        </div>
                        </td>
                        <td width="49"><div align="center">
	                        <a href="userAction_getUserList?pageNum=${page.totalPage}"><img src="images/background/main_60.gif" width="40" height="15" /></a>
	                        </div>
                        </td>
                        <td width="37" class="STYLE22"><div align="center">转到</div></td>
                        <td width="22"><div align="center">
                          <select id="jump">
		  					<c:forEach begin="1" end="${page.totalPage}" var="num">
		  						<option value="${num}" ${page.pageNum==num?'selected="selected"':''}>${num}</option>
		  					</c:forEach>
		  				  </select>
                        </div></td>
                        <td width="22" class="STYLE22"><div align="center">页</div></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table>
        </td>
        <td width="8">&nbsp;</td>
        <td width="8" height="441" bgcolor="#353c44">&nbsp;</td>
  	</tr>
</table>
</body>
</html>
