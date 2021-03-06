<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/"
			+ path + "/";
%>
<!-- http://locahost:端口/项目名/ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://localhost/BooKManger1/bootstrap/css/bootstrap.css" />
<script type="text/javascript"
	src="http://localhost/BooKManger1/bootstrap/js/jquery.js"></script>
<script type="text/javascript"
	src="http://localhost/BooKManger1/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="http://localhost/BooKManger1/bootstrap/css/bootstrapValidator.css" />
<script type="text/javascript"
	src="http://localhost/BooKManger1/bootstrap/js/bootstrapValidator.js"></script>

<title>查看所有分类</title>

<script type="text/javascript"
	src="http://localhost/BooKManger1/js/jquery-1.8.3.js"></script>
<script>
	$(function() {

		$("tr:even").css("background-color", "Beige");

		$("tr:odd").css("background-color", "LightYellow");

		$("tr").mouseover(function() {
			$(this).css("background-color", "skyblue");
		});

		$("tr").mouseout(function() {
			$("tr:even").css("background-color", "Beige");

			$("tr:odd").css("background-color", "LightYellow");

		});
	});

	$(function() {

		var chek = document.getElementsByName("ids");

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {
			//全选

			for (i = 0; i < chek.length; i++) {

				chek[i].checked = true;

			}

		}
		//全不选
		var selectNot = document.getElementById("selectNot");

		selectNot.onclick = function() {

			for (i = 0; i < chek.length; i++) {

				chek[i].checked = false;

			}

		}

		//反选
		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			for (i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					chek[i].checked = false;

				} else {
					chek[i].checked = true;

				}

			}

		}

		//删除	  
		var df = document.getElementById("dfd");

		df.onclick = function() {

			var flag = false;

			for (i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}

			if (flag == false) {
				alert("请勾选一项");
				return;

			} else {

				var str = "";
				var m = 0;
				for (var i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {
						m++;
						str += chek[i].value + ",";

					}
					if (m > 1) {
						alert("分类只支持一次删除一个,请重新勾选");
						return;
					}
				}
				str = str.slice(0, str.length - 1);
				//alert(str);

				var flage = confirm("确定删除所勾选的分类吗？");
				if (flage == true) {//确定
					//拿到请求地址
					var $url = "http://localhost/BooKManger1/fenlei_delete/"
							+ str;

					//alert($url);
					//拿到表单
					$("#deleteForm").attr("action", $url);

					//提交表单
					$("#deleteForm").submit();

				} else {//取消

					window.location.href = "http://localhost/BooKManger1/fenleis/1";

				}
			}
		}
		//导出部分	  
		var outIds = document.getElementById("outIds");

		outIds.onclick = function() {

			var flag = false;

			for (i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}

			if (flag == false) {
				alert("请至少选一项");
				return;

			} else {

				var str = "";

				for (var i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {

						str += chek[i].value + ",";

					}
				}
				str = str.slice(0, str.length - 1);

				var flag = confirm("确定导出所勾选的分类信息吗？");
				if (flag == true) {//确定
					window.location.href = "http://localhost/BooKManger1/outPutFenLei/"
							+ str;

				} else {//取消

					window.location.href = "http://localhost/BooKManger1/fenleis/1";
				}
			}
		};
		//导出全部
		var outAll = document.getElementById("outAll");
		outAll.onclick = function() {
			var flag = confirm("确定导出全部的分类信息吗？");
			if (flag == true) {//确定
				window.location.href = "http://localhost/BooKManger1/outPutFenLei/a";

			} else {//取消

				window.location.href = "http://localhost/BooKManger1/fenleis/1";
			}

		}
	});
</script>
<style>
.col {
	width: 1000px;
	height: 500px;
}

#div2 {
	margin-top: 30px;
	width: 1000px;
	height: 520px;
	border-color: pink;
}

#div3 {
	margin-left: 10px;
}

#div1 {
	height: 840px;
	background-size: cover;
}

.table {
	margin-top: 5px;
	width: 860px;
}

#li {
	color: #337AB7;
	font-size: 15px;
}
</style>
<body background="http://localhost/BooKManger1/imges/19.jpg">

	<c:if test="${!empty mag }">
		<script>
			alert("${mag }");
		</script>
	</c:if>
	<c:remove var="mag" />

	<div class="container-fluid" id="div1">

		<div class="col col-md-5 " id="div3">
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a id="selectAll"
					href="#"><font color="red">全选</font></a></li>
				<li role="presentation"><a id="selectNot" href="#"><font
						color="red">全不选</font></a></li>
				<li role="presentation"><a id="fanxuan" href="#"><font
						color="red">反选</font></a></li>
				<li role="presentation"><a id="outIds" href="#"><font
						color="red">导出选中</font></a></li>
				<li role="presentation"><a id="outAll" href="#"><font
						color="red">导出全部</font></a></li>
				<%--  <li role="presentation"  class="dropdown"><a href="<%=base%>FenleiServlet?action=updatefl22&ausername=${ausername }"  role="menuitem" id="li">多项修改 </a></li> --%>


			</ul>
			<div class="container-fluid " id="div2">

				<p align="center" colspan=2>
					<font size="7" color="#337AB7" face="宋体"><strong><font
							color="greed">查看所有分类</font></strong></font><br>
				</p>

				<table align="center" cellspacing="0" id="table1">

					
						<td>
							<table border=2 bordercolor="#C2A5A8"
								class="table table-bordered table-hover " id="table2"
								cellspacing="0">
								<tr align="center">
									<td>编号</td>
									<td colspan="2">分类名称</td>
									<td><button id="dfd">删除</button></td>
									<td>修改</td>
								</tr>
								<c:forEach items="${pb.beanList }" var="s" varStatus="ss">
									<tr align='center'>
										<td>${ss.index+1}</td>
										<td colspan="2">${s.name}</td>
										<td><input type="checkbox" name="ids" value="${s.id}" /></td>
										<td><a href="http://localhost/BooKManger1/fenlei/${s.id}">
												<input type="button" value="修改" class="btn btn-info" />
										</a></td>
									</tr>
								</c:forEach>
							</table>
						</td>
					


					<form action="" method="post" id="deleteForm">
						<input type="hidden" name="_method" value="DELETE">
					</form>


				</table>
				<center>
					<p>第${pb.pageNow }页/共${pb.pages }&nbsp;&nbsp;&nbsp;&nbsp;
					<ul class="pagination ">

						<li><a href="http://localhost/BooKManger1/fenleis/1">首页</a>
							&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<c:if test="${pb.pageNow>1 }">
							<li><a aria-label="Previous"
								href="http://localhost/BooKManger1/fenleis/${pb.pageNow-1}"><span
									aria-hidden="ture">上一页</span></a></li>
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
									<c:set var="end" value="${pb.pages}"></c:set>
								</c:if>

							</c:otherwise>
						</c:choose>
						<!-- 每页面显示10页数 -->

						<c:forEach begin="${begin }" end="${end }" var="i">
							<c:choose>
								<c:when test="${pb.pageNow==i }">
									<li class="active"><span>${i }</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="http://localhost/BooKManger1/fenleis/${i}">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:if test="${pb.pageNow<pb.pages }">
							<li><a
								href="http://localhost/BooKManger1/fenleis/${pb.pageNow+1}"
								aria-label="Previous"><span aria-hidden="ture">下一页</span></a></li>
						</c:if>

						<li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="http://localhost/BooKManger1/fenleis/${pb.pages}">尾页 </a>
						</li>
					</ul>
					</p>
				</center>

				<br>




			</div>
		</div>
	</div>

</body>

</html>