<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改分类</title>
   <script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
    window.onload=function(){
    	var select=document.getElementById("fenleiList");
    	ajax({
    		method:"POST",
    		url:"Fenleiservlet",
    		params:"action=UpdateFenlei",
    		type:"xml",
    		success:function(date){
    				//var content=http.responseXML;
    				var names=date.getElementsByTagName("name");
    				for(var i=0;i<names.length;i++){
    					var name=names[i];
    					var opt=document.createElement("option");
    					var value;
    					if(window.addEventListener){
    						value=name.textContent;
    					}else{
    						value=text;
    					}
    					opt.innerHTML=value;
        				opt.value=value;
        				select.appendChild(opt);
    				}
    		}
    	});
    	
        }
    </script>
</head>
<body background="imgs/3.jpg">
	<form action=Fenleiservlet?action=Update method="post">
		<table align="center" width="400px" height="200px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h2>
					<font color="red">修改分类页面</font>
				</h2>
			</caption>
			<tr align="center">

				<td>选择你要修改的分类名称:</td>
				<td>
				<select name="name" id="fenleiList">
				 <option>-----选择你要修改的分类-----</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>请输入新的分类名称:</td>
				<td><input type="text" name="newname"/></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="清空" /></td>
			</tr>
		</table>
	</form>
</body>
</html>