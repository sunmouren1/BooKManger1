<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
     var flag;
    function VDpassword(){
    	 
    	var password=document.changepassword.password;
    	var pwMsg=document.getElementById("pwMsg");
    	ajax({
    		method:"POST",
    		
    	    url:"Adminservlet",
    	    
    	    params:"action=VDpassword&password="+password.value,
    	    
    	    type:"text",
    		success:function(date){
    			if(date=="1"){
    				pwMsg.style.color="green";
    				pwMsg.innerHTML="原密码输入正确";
    				flag=true;
    			}else{
    				pwMsg.style.color="red";
    				
    				pwMsg.innerHTML="原密码输入错误，请重新输入";
    				
    				password.focus();
    				
    				flag=false;
    			}
    		}
    	});
    }

    function VDnewpassword(){
    	 var reg=/^\w{6,}$/;
    	 var newpassword=document.changepassword.newpassword;
    	 var npwMsg=document.getElementById("npwMsg");
    	 var password=document.changepassword.password;
    	 if(!reg.test(newpassword.value)){
    		 npwMsg.style.color="red";
    		 npwMsg.innerHTML="新密码必须大于六位数!";
				return false;
    	 }
    	if(password.value==newpassword.value){
    			 npwMsg.style.color="red";
        		 npwMsg.innerHTML="新密码不能和原密码一样";
        		 return false;
    		 }
    		 npwMsg.style.color="green";
    		 npwMsg.innerHTML="新密码可用";
    	    return true;
    }
    function VDrepassword(){
    	 var newpassword=document.changepassword.newpassword;
		 	var repassword=document.changepassword.repassword;
		 	var rpwMsg=document.getElementById("rpwMsg");
		 	if(newpassword.value==repassword.value){
		 		rpwMsg.style.color="green";
		 		rpwMsg.innerHTML="密码一致";
		 		return true;
		 	}else{
		 		rpwMsg.style.color="red";
		 		rpwMsg.innerHTML="两次密码不一致";
		 		return false;
		 	}
    }

    function test(){
	 return flag&&VDpassword()&&VDnewpassword()&&VDrepassword();
    }
    </script>
</head>
<body background="imgs/3.jpg">
 <form action="Adminservlet?action=Update" method="post" name="changepassword"  enctype="application/x-www-form-urlencoded"     onsubmit="return test()"><!--  提交修改管理员密码-->
		<table align="center" width="800px" height="200px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h2>
					<font color="red">修改管理员密码</font>
				</h2>
			</caption>
			<tr align="center" >
				<td>原密码:</td>
				<td><input name="password" type="password"  onblur="VDpassword()"/><span id="pwMsg"></span></td>
			</tr>
			<tr align="center">
				<td>请输入新的密码:</td>
				<td><input name="newpassword" type="password"  onblur="VDnewpassword()"/><span id="npwMsg"></span></td>
			</tr>
		  	<tr align="center">
				<td>确认新的密码:</td>
				<td><input type="password" name="repassword" onblur="VDrepassword()"/><span id="rpwMsg"></span></td>
			</tr>
			<tr align="center"><td colspan="2"><input type="submit" value="确认修改"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重新填写"/></td></tr>
		</table>
	</form>
  </body>
</html>