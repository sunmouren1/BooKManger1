<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<!-- 
<c:if test="${!(empty userNameture) }">

	<script>
		alert("${userNameture}");
	</script>
	<c:remove var="userNameture" scope="session"></c:remove>
</c:if>
 -->
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login").bootstrapValidator({

			feedbackIcons : {
				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {
				name : {
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '姓名必须2-10位汉字'
						},
					}
				},
				phone : {
					validators : {
						notEmpty : {
							message : '手机号不能为空'
						},
						regexp : {
							regexp : /^1[3-9][0-9]{9}$/,
							message : '手机号不合法'
						},
					}
				},
				
				userName : {
					validators : {
						notEmpty : {
							message : '账号不能为空'
						},
						regexp : {
							regexp : /^\w{5,15}$/,
							message : '账号必须是由5~15字母下划线组成'
						},
						remote : {
							message : '用户名已经存在',
							url : 'Adminservlet',
							type : 'post',
							data : {
								userName : $('input[name=userName]').val(),
								action : 'userName1'

							}

						}
					}
				},
				password : {
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						regexp : {
							regexp : /^(\w|\W){6,15}$/,
							message : '密码必须至少六位数'
						},
						different : {
							field : 'uname',
							message : '密码不能和用户名一样'
						}

					}
				},
				repassword : {
					validators : {
						notEmpty : {
							message : '确认密码不能为空'
						},
						identical : {
							field : 'password',
							message : '两次密码不一致'
						}

					}
				},

				touxiang : {
					validators : {
						notEmpty : {
							message : '头像不能为空'
						},

					}
				},
			}

		})

	});
</script>
<!--  
 <script type="text/javascript">
        var flag=false;
		function ValiDatename(){
			var name=document.register.name;
				var reg=/^[\u0391-\uFFE5]{2,10}$/;
				var nameMsg=document.getElementById("nameMsg");
				if(reg.test(name.value)){
					nameMsg.style.color="green";
					nameMsg.innerHTML="姓名合法";
				
					return true;
				}else{
					nameMsg.style.color="red";
					nameMsg.innerHTML="姓名必须2-10位汉字";
					return false;
				}
			
		}
		function ValiDatephone(){
			var phone=document.register.phone;
			
				var reg=/^1[3-9][0-9]{9}$/;
				var phoneMsg=document.getElementById("phoneMsg");
				if(reg.test(phone.value)){
					phoneMsg.style.color="green";
					phoneMsg.innerHTML="手机号合法";
				
					return true;
				}else{
					phoneMsg.style.color="red";
					phoneMsg.innerHTML="手机号不合法";
					return false;
				}
		}
		 function validateUserName(){
			 var userName=document.register.userName;
			    		var reg=/^\w{5,15}$/;
			    		var usernameMsg=document.getElementById("usernameMsg");
			    		if(reg.test(userName.value)){
			    			//usernameMsg.style.color="green";
			    			//usernameMsg.innerHTML="用户名合法";
			    			var xmlhttp=getXMLHttpRequest();
							
							xmlhttp.open("POST","Adminservlet",true);
							
						    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
							
							xmlhttp.send("action=validateUserName&userName="+userName.value);
							
							xmlhttp.onreadystatechange=function(){
								if(xmlhttp.readyState==4 && xmlhttp.status==200){
							       var content=xmlhttp.responseText;
							       //alert(content);
							       var span=document.getElementById("usernameMsg");
							       if(content=="0"){
							    	   span.style.color="green";
							    	   span.innerHTML="用户名第一次注册是合法的哦！";
							    	   span.focus();
							    	   flag=false;
							    	   return true;
							       }else{
							    	   span.style.color="red";
							    	   span.innerHTML="你注册的用户名已经存在，请重新注册";
							    	   span.focus();
							    	   flag=true;
							    	   return true;
							       }
							       
								}
							}
			    			
			    		}else{
			    			usernameMsg.style.color="red";
			    			usernameMsg.innerHTML="用户名不合法";
			    			return false;
			    		}
				
				
			}
		    
			 function ValiDateupassword(){
			 	var password=document.register.password;
			 		var reg=/^(\w|\W){6,15}$/;
			 		var passwordMsg=document.getElementById("passwordMsg");
			 		if(reg.test(password.value)){
			 			passwordMsg.style.color="green";
			 			passwordMsg.innerHTML="密码合法";
			 		
			 			return true;
			 		}else{
			 			passwordMsg.style.color="red";
			 			passwordMsg.innerHTML="密码至少六位数";
			 			return false;
			 		}
			 }
			 function ValiDateurepassword(){
			 var password=document.register.password;
			 	var repassword=document.register.repassword;
			 	var repasswordMsg=document.getElementById("repasswordMsg");
			 	if(repassword.value==password.value){
			 		repasswordMsg.style.color="green";
			 		repasswordMsg.innerHTML="密码一致";
			 		return true;
			 	}else{
			 		repasswordMsg.style.color="red";
			 		repasswordMsg.innerHTML="两次密码不一致";
			 		return false;
			 	}
			 }
			
		function jiaoyan(){
		return ValiDatename()&&ValiDatephone()&&validateUserName()&&ValiDateupassword()&&ValiDateurepassword();
		return flag;
		}
	</script>
	-->

<body background="./imgs/3.jpg">
	<!--  
<center>
   <br/>s
   <br/>
   <br/>
   <br/>
   <br/>
   <tr>	   
		   <td width="50%" >		      
		   </td>
		   <td align="center">
			<form action="Adminservlet?action=register" method="post" name="register" enctype="multipart/form-data" onsubmit="return jiaoyan()" >
			<table frame="box" width="500px" height="400px" bordercolor="white">
				<tr>
					<td colspan="3">&nbsp;&nbsp;&nbsp;<font color="black" size="4"><b>注册账号</b></font></td>
				</tr>
				<tr>
					<td align="center"><font color="black"><b>姓&nbsp;&nbsp;&nbsp;&nbsp;名:<b></font></td>
					<td><input type="text" name="name" onblur="ValiDatename()"></td>
					<td ><span id="nameMsg"></span></td>
				</tr>
				 <tr>
					<td align="center"><font color="black" ><b>手机号码:</b></td>
					<td><input type="text" name="phone" onblur="ValiDatephone()" /></td>
					<td ><span id="phoneMsg"></span></td>
				</tr>
				<tr>
					<td align="center"><font color="black"><b>帐&nbsp;&nbsp;&nbsp;&nbsp;号:<b></font></td>
					<td><input type="text" name="userName" onblur="validateUserName()" /></td>
					<td ><span id="usernameMsg"></span></td>
				</tr>
				<tr>
					<td align="center"><font color="black"><b>密&nbsp;&nbsp;&nbsp;&nbsp;码:</b></font></td>
					<td><input type="password" name="password" onblur="ValiDateupassword()" /></td>
					<td ><span id="passwordMsg"></span></td>
				</tr>
				<tr>
					<td align="center"><font color="black"><b>确认密码:</b></font></td>
					<td><input type="password"  name="repassword"  onblur="ValiDateurepassword()"/></td>
					<td ><span id="repasswordMsg"></span></td>
				</tr>
				<tr>
					<td align="center"><font color="black"><b>头像:</b></font></td>
					<td><input type="file"  name="touxiang" /></td>
				</tr>
				<tr>
				<td colspan="2" align="center"><input type="image" src="imgs/zhuce.png"/></td>
			</tr>
			</table>
		</form>
	</td>
	</tr>
	</center>
	-->
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<form id="login" action="Adminservlet?action=register" method="post" enctype="multipart/form-data">
				<h3 class="text-center text-danger">注册页面</h3>
				<div class="form-group">
					<label>管理员姓名：</label> <input type="text" name="name"
						class="form-control" />
				</div>
				<div class="form-group">
					<label>手&nbsp;机&nbsp;号&nbsp;码：</label> <input type="text"
						name="phone" class="form-control" />
				</div>
				<div class="form-group">
					<label>帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
					<input type="text" name="userName" class="form-control" />
				</div>
				<div class="form-group">
					<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
					<input type="password" name="password" class="form-control" />
				</div>
				<div class="form-group">
					<label>确&nbsp;认&nbsp;密&nbsp;码：</label> <input type="password"
						name="repassword" class="form-control" />
				</div>
				<div class="form-group">
					<label>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</label>
					<input type="file" name="touxiang" class="form-control" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success btn-block">注册</button>
					<button type="reset" class="btn btn-success btn-block">重填</button>
					<button type="submit" class="btn btn-success btn-block"><a href="login.jsp">已是管理员点击登录</a></button>
					
				</div>
			</form>

		</div>

	</div>
</div>
  
</body>
</html>