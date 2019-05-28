<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的CSS文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件-->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		$(".deleteId").click(function() {

			var $url = this.href;

			$("#deleteForm").attr("action", $url);

			//提交表单

			$("#deleteForm").submit();

			return false;
		});

	});
</script>
</head>

<body>
<br>
<br>
<br>
	<div class="container">
		<h1 align="center">图书管理系统</h1>
		<br>
		<br>
		<table class="table table-bordered table-striped">
			<tr>
				<th>分类编号</th>
				<th>类名</th>
				<th>删除</th>
				<th>修改</th>
			</tr>

			<c:forEach items="${pb.beanList }" var="m">
				<tr>
					<td>${f.fenleiId}</td>
					<td>${f.fenleiname}</td>
					<td><a href="deleteMonster/${m.fenleiId}"
						class="deleteId  btn btn-danger">删除</a></td>
					<td><a href="updateUI/${f.fenleiId}" class="btn btn-primary">修改</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 准备一个隐藏表单 -->
		<form action="" method="post" id="deleteForm">
			<input type="hidden" name="_method" value="DELETE">
		</form>


		<center>
			<p>第${pb.pageNow }页/共${pb.pages }页</p>
			<ul class="pagination">
				<li><a href="showByPage?pageNow=1">首页</a></li>
				<c:if test="${pb.pageNow>1 }">
					<li><a href="showByPage?pageNow=${pb.pageNow-1 }">上一页</a></li>
				</c:if>
				<c:choose>
					<c:when test="${pb.pages<=10 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
						<c:set var="end" value="${pb.pageNow+4 }"></c:set>
						<c:if test="${begin<=1 }">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="10"></c:set>
						</c:if>
						<c:if test="${end>=pb.pages }">
							<c:set var="begin" value="${pb.pages-9 }"></c:set>
							<c:set var="end" value="${pb.pages }"></c:set>
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${pb.pageNow==i }">
							<li class="active"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="showByPage?pageNow=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pb.pageNow<pb.pages }">
					<li><a href="showByPage?pageNow=${pb.pageNow+1 }">下一页</a></li>
				</c:if>
				<li><a href="showByPage?pageNow=${pb.pages }">尾页</a></li>
			</ul>
		</center>


	</div>
</body>
</html>