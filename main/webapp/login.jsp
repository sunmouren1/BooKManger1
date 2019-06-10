<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${!(empty msg2) }">
   <script>
   alert("${msg2}");
   </script>
   <c:remove var="msg2" scope="session"/>
</c:if>
<title>登录</title>
<style>
body {
	margin: 0;
}

</style>
<!--  
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">


  function test(){
	  return validateUserName();
  }
</script>
-->
</head>
<body>
	<table width="100%" height="1000px" cellspacing="0">
		<tr height="80px">
			<td colspan="2" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b></b></font>&nbsp;<font size="6">图书管理系统</font>&nbsp;<font
				size="6" color="silver">|</font>&nbsp;<font color="silver" size="5" >登录</font>
			</td>
		</tr>
		<tr background="./imgs/3.jpg">
			<td width="30%"></td>
			<td align="center">
				<form action="Adminservlet?action=login"  method="post"  name="login1"  onsubmit="return test()">
					<table frame="box" width="600px" height="280px" bordercolor="white">
						<tr>
							<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								size="15" color=""><b>会员登录</font></b></td>
						</tr>
						<tr>
							<td align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="5">登录账号:</font></b></td>
							<td><input type="text" name="userName" onblur="validateUserName()"/><span id="userNameMsg"></span></td>
						</tr>
						<tr>
							<td align="center"><b><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:</font></b></td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" checked><font size="2" color="white"><font size="3">两周内自动登录</font></font></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src="imgs/login.png"/></td>
							
							<!--  <a
								href="index.jsp">确定</a></td>
								-->
						</tr>
						<tr>
							<td></td>
							<td><a href="register.jsp"><font size="4" color="red">还不是会员？立即注册</font></a></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="100px">
			<td align="center" colspan="2"><font color="gray" size="4"
				face="楷体">oracle公司版权所有&copy;2000-2018</font></td>
		</tr>
	</table>
</html>