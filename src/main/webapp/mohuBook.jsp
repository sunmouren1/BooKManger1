<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="imgs/3.jpg">

<table align="center" width="600px" height="200px" border="1px" class="table"
			cellspacing="0" bordercolor="silver">
			 <form action="Bookservlet?action=mohuBook" method="post">
			<tr align="center">
			
			   <td>选择</td>
			   
				<td>编号</td>
				<td>书名</td>
				
			
				<td>价格</td>
				
				<td>出版社</td>
				
				<td>状态</td>
				
				<td>借书人</td>
				
			</tr>
			
			<c:forEach items="${list }" var="s" varStatus="f">
			<tr align=center>
			<td><input type="checkbox" name="ids" value="${s.id}"></td>
				<td>${s.id }</td>
				<td>${s.name }</td>
				<td>${s.jiage }</td>
				<td>${s.chubanshe }</td>
				<td>${s.zhuangtai }</td>
				<td>${s.jieshuren }</td>
			</tr>
			</c:forEach>
			
			</form>
		</table>
	   
</body>
</html>