<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="tubiao/iconfont.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">

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
window.onload = function() {

	var selectAll = document.getElementById("selectAll");

	var flag = false;
	//按钮1
	selectAll.onclick = function() {

		var check = document.getElementsByName("ids");

		for (var i = 0; i < check.length; i++) {

			check[i].checked = true;
		}

	};

	var unselsectAll = document.getElementById("unselectAll");

	unselsectAll.onclick = function() {

		var check = document.getElementsByName("ids");

		for (var i = 0; i < check.length; i++) {

			check[i].checked = false;
		}

	};

	var fanxuan = document.getElementById("fanxuan");

	fanxuan.onclick = function() {

		var check = document.getElementsByName("ids");

		for (var i = 0; i < check.length; i++) {

			if (check[i].checked == true) {

				check[i].checked = false;

			} else {

				check[i].checked = true;
			}

		}

	};

	var deleteStudent = document.getElementById("deleteStudent");

	deleteStudent.onclick = function() {

		var check = document.getElementsByName("ids");

		var flag = false;
		for (var i = 0; i < check.length; i++) {
			if (check[i].checked == true) {

				flag = true;

				break;

			}

		}
		if (flag == false) {

			alert("请至少勾选一个？？？");

			return;
		}

		var str = "";
		for (var i = 0; i < check.length; i++) {
			if (check[i].checked == true) {

				str += check[i].value + ",";

			}
		}

		str = str.slice(0, str.length - 1);

		var queren = confirm("你确定删除吗？");

		if (queren == true) {

			//location.href =	 "delete/" + str;
		 var  $url= "delete/" + str;

				
			 $("#deleteForm").attr("action",$url);
			 
			 $("#deleteForm").submit();
			 
			 return false;
		} else {
			

			location.reload();
		}

	}

	var outputAll = document.getElementById("outputAll");

	outputAll.onclick = function() {

		var queren = confirm("你确定导出所有页面数据吗？");

		if (queren == true) {

			window.location.href = "outAll";
		}

	};

	var outputSelect = document.getElementById("outputSelect")

	outputSelect.onclick = function() {

		var check = document.getElementsByName("ids");

		var flag = false;
		for (i = 0; i < check.length; i++) {
			if (check[i].checked == true) {

				flag = true;

				break;

			}

		}
		if (flag == false) {

			alert("请至少勾选一个？？？");

			return;
		}

		var str = "";
		for (var i = 0; i < check.length; i++) {

			if (check[i].checked == true) {

				str += check[i].value + ",";

			}
		}
		str = str.slice(0, str.length - 1);

		var queren = confirm("你确定导出所选用户的数据吗？");

		if (queren == true) {

			// window.location.href = "OutPutUserServlet?action=outSelect&ids="+ str;
			location.href = "outputSelect/"
					+ str;
		}

	};

};
$(function(){
	  
	  $(".deleteId").click(function(){
		
		  //alert("ok")
		 var  $url=this.href;
		
		 $("#deleteForm").attr("action",$url);
		 
		 $("#deleteForm").submit();
		 
		 return false;
	  });
	 
});


    
 </script>
<style type="text/css">

h1 {
	font-size: 200%;
	color:skyblue;
	opacity: 0.75;
}

#div3 {
	margin-top: 30px;
	width: 1000px;
	height: 520px;
	margin-left: 30px;
}

#div2 {
	margin-left: 10px;
}

#div1 {
	background-image: url("tu/t6.jpg");
	background-size: cover;
}

#u1 {
	width: 300px;
	height: 365px;
	margin-left: 130px;
}

#li {
	color: #337AB7;
	font-size: 17px;
}
</style>
<body background="imges/1.jpg">
<div class="col col-md-4  col-md-offset-4" id="div2">
			<ul class="nav nav-tabs">
				<li><a href="addUI">添加图书</a></li>
				<li><a id="selectAll" >全选</a></li>
				<li><a id="unselectAll" >全不选</a></li>
				<li><a id="fanxuan" >反选</a></li>
				<li><a id="outputSelect" >导出选择</a></li>
				<li><a id="outputAll" >导出全部</a></li>
				</ul>
				<div class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><font
			size="3" face="幼圆"><span class="glyphicon glyphicon-search">高级搜索</span></font><span
			class="caret"></span></a>
		<div class="col-md-1 "></div>
		<br>
		<ul class="dropdown-menu dropdown-menu-left" role="menu">
			<li>
				<form  action="showBookByWhere/${pb.pageNow}"  name="where" class="form-horizontal" method="GET">
			
					
					<div class="control-group  ">
						<br>
						<label class="col-sm-4 ">书名:</label>
						<div class="col-sm-7 ">
							<input name="name" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group   ">
						<br>
						<label class="col-sm-4"> 出版社:</label>
						<div class="col-sm-7">
							<input name="chubanshe" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group   ">
						<label class="col-sm-4 ">借书人:</label>
						<div class="col-sm-7">
							<input name="jieshuren" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group">
						<label class="col-sm-4"> 状态:</label>
						<div class="col-sm-7">
							<input name="zhuangtai" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>
                       <div class="control-group">
						<label class="col-sm-4"> 价格:</label>
						<div class="col-sm-7">
							<input name="jiage" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>
					
					<div class="control-group">
						<br> <label class="col-md-4">选择分类： </label>
						<div class="col-sm-7">
						 
						<select name="fId"	class="form-control input-sm">
					    <option value="0">----请选择----</option>
											 
					  <c:forEach items="${flist}" var="f">
					  
					  <option value="${f.id}">${f.name}</option>
					  </c:forEach>
					</select> 
						<br>
						</div>
					
					<!-- pageNow-->
	        <input type="hidden" name="pageNow" value="1">
					<div class="control-group  ">
						<label class="col-sm-4 "></label>
						<div class="controls ss">
							<button type="submit" class="btn   btn-warning ">
								<span class="glyphicon glyphicon-search"></span> 开始搜索
							</button>
						</div>
					</div>
				</form>
			</li>
		</ul>
		
	</div>
	<div class="container">
		<caption align="top">
			<h1 align="center">
				<font >查看图书</font>
			</h1>
		</caption>

		<div class="container">
			<table align="center" width="800px" height="200px" border="1px"
				class="table" cellspacing="0" bordercolor="silver">

				<tr align="center">

                
                <td>选项</td>
					<td>编号</td>
					
					<td>书名</td>

					<td>价格</td>

					<td>出版社</td>

					<td>状态</td>

					<td>借书人</td>
					
					<td>分类名称</td>

					<td>分类Id</td>

					
                  

				</tr>

				<c:forEach items="${pb.beanList }" var="s">
					<tr align=center>
          <td><input type="checkbox" name="ids" value="${s.id}" /></td>
						<td>${s.id }</td>
						<td>${s.name }</td>
						<td>${s.jiage }</td>
						<td>${s.chubanshe }</td>
						<td>${s.zhuangtai }</td>
						<td>${s.jieshuren }</td>
						<td>${s.fenlei}</td>
						<td>${s.fId}</td>
							</tr></c:forEach>
			</table>



			<form action=""  method="post" id="deleteForm">

				<input type="hidden"  name="_method" value="DELETE" />

			</form>
		
			<div>
			<br>
			
				<p>
			<center>
				第${pb.pageNow }页/共${pb.pages }页 <br/> &nbsp;&nbsp;&nbsp;&nbsp;
				<ul class="pager">
					<li><a href="${pb.url}?pageNow=1">首页</a></li>

					<c:if test="${pb.pageNow>1 }">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<li><a href="${pb.url}?pageNow=${pb.pageNow-1 }">上一页(Previous)</a></li>

					</c:if>
					&nbsp;&nbsp;

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
					<c:forEach begin="${begin}" end="${end }" var="i">

						<c:choose>
							<c:when test="${pb.pageNow==i }">
								<li><span class="active">${i}(current)</span></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pb.url}?pageNow=${i }">[${i}]</a></li>
							</c:otherwise>

						</c:choose>
					</c:forEach>
					&nbsp;&nbsp;
					<c:if test="${pb.pageNow<pb.pages }">
						<li><a href="${pb.url}?pageNow=${pb.pageNow+1 }">下一页(Next)</a></li>
					</c:if>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<li><a href="${pb.url}?pageNow=${pb.pages }">尾页</a></li>
				</ul>

			</center>
			
			</p>
			</div>
</body>
</html>