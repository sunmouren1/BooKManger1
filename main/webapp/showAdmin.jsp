<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看管理员</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	window.onload = function() {
         var opt={
        	method:"POST",
            url:"Adminservlet",
            params:"action=ShowOneAdmin",
            type:"json",
            success:function(date){
            	var admin=date;
            	var id=document.getElementById("id");
            	id.innerHTML=admin.id;
            	var name=document.getElementById("name");
            	name.innerHTML=admin.name;
            	var phone=document.getElementById("phone");
            	phone.innerHTML=admin.phone;
            	var userName=document.getElementById("userName");
            	userName.innerHTML=admin.userName;
            	var password=document.getElementById("password");
            	password.value=admin.password;
            	var touxiang=document.getElementById("touxiang");
            	var img9=document.createElement("img");
            	img9.src="/img9"+admin.touxiang;
            	  img9.width=50;
            	  img9.height=50;
            	//alert(img9.src);
            	touxiang.appendChild(img9);
            }
         };
         ajax(opt);
	};
</script>
</head>
<body background="imgs/3.jpg">
	<br />
	<br />
	<br />
	<br />
	<center>
		<table width="300px" height="280px" border="1px" bordercolor="pink"
			cellspacing="0">
			<caption align="top">
				<h1>
					<font color="red">查看管理员信息</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			<tr align="center">
				<td>编号</td>
				<td id="id"></td>
			</tr>
			<tr align="center">
				<td>姓名</td>
				<td id="name"></td>
			</tr>
			<tr align="center">
				<td>手机</td>
				<td id="phone"></td>
			</tr>
			<tr align="center">
				<td>账号</td>
				<td id="userName"></td>
			</tr>
			<tr align="center">
				<td>密码</td>
				<td ><input   type="password" id="password" 
					disabled="disabled"/></td>
			</tr>
			<tr align="center">
				<td>头像</td>
				<td id="touxiang"></td>
			</tr>
		</table>
	</center>
</body>
</html>