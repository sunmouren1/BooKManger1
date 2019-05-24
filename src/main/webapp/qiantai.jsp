<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">
<title>前台界面</title>
</head>
<body  background="imgs/ben.jpg">
     <form action=""></form>
	<table width="100%" height="150px" border="1" cellspacing="0" align="center"  >
	  <tr align="center"><td><font size="8" face="黑体" ><b>爱玲图书管理系统前台</b></font></td></tr>

	</table>
	<br>
	<br>
	<br>
	 	
		<table align="center" width="800px" height="200px" border="1px" class="table" back
			cellspacing="0" bordercolor="silver">
			
			<tr align="center">
			
			 
			   
				<td><b>编号</b></td>
				<td><b>书名</b></td>
				
			
				<td><b>价格</b></td>
				
				<td><b>出版社</b></td>
				
				<td><b>状态</b></td>
				
				<td><b>借书人</b></td>
				
				<td><b>分类</b></td>
				
				<td><b>修改</b></td>
				
			</tr>
			
			<c:forEach items="${pb.beanList }" var="s" varStatus="f">
			<tr align=center>
			
				<td>${s.id }</td>
				<td>${s.name }</td>
				<td>${s.jiage }</td>
				<td>${s.chubanshe }</td>
				<td>${s.zhuangtai }</td>
				<td>${s.jieshuren }</td>
				<td>${s.fenlei }</td>
			</tr>
			</c:forEach>
			
			
		</table>
	<br>
	<br>
	<br>
	<br>
	
	<p align="center"><font size="3" color="silver" >&copy;爱玲图书管理系统版权所有2018~~</font></p>
	<p align="center"><a href="login.jsp">进入图书管理系统</a></p>
	
	
  </body>

</html>