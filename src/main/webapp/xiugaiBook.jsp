<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
 
<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<title>Update</title>
<style>
h2 {
	font-size: 200%;
	color:skyblue;
	opacity: 0.75;
}


</style>
</head>
<body background="imgs/3.jpg">
	<center>
	<h2>修改图书</h2>
		<form class="form-horizontal" action="updatebook" method="post">
			<input type="hidden" value="PUT" name="_method"> 
			
			<input type="hidden" name="id" value="${b.id}" />
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">图书名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						value="${b.name}">
				</div>
			</div>

			<div class="form-group">
				<label for="jiage" class="col-sm-4 control-label">价格:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="jiage" name="jiage"
						value="${b.jiage }">
				</div>
			</div>


			<div class="form-group">
				<label for="chubanshe" class="col-sm-4 control-label">出版社:</label>
				<div class="col-sm-4">
					<input  class="form-control" id="chubanshe"
						name="chubanshe" value="${b.chubanshe}">
				</div>
			</div>


			<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态:</label>
				<div class="col-sm-4">
					<input class="form-control" id="zhuangtai"
						name="zhuangtai" value="${b.zhuangtai}">
				</div>
			</div>

			<div class="form-group">
				<label for="jieshuren" class="col-sm-4 control-label">借书人:</label>
				<div class="col-sm-4">

					<input name="jieshuren" id="jieshuren" class="form-control"
						value="${b.jieshuren}" />
				</div>

			</div>

			<div class="form-group">
				<label for="fenlei" class="col-sm-4 control-label">分类名称:</label>
				<div class="col-sm-4">

					<input name="fenlei" id="fenlei" class="form-control"   value="${b.fenlei}" />
				</div>

			</div>

			<div class="form-group">
				<label for="fId" class="col-sm-4 control-label">分类名:</label>
				<div class="col-sm-4">
				<select  name="fId" id="fId" class="form-control" value="${b.fId}" >
			  <c:forEach items="${flist}" var="f">
			
			    <c:if test="${f.id==fenLei.id}">
			   
			      <option value="${f.id}" selected="selected" >${f.name}</option>
			     </c:if>
			     <c:if test="${f.id!=fenLei.id}">
			  <option value="${f.id}">${f.name}</option>
			  </c:if>
			  
			  </c:forEach>
				</select>	
				</div>

			</div>

            <br>
			<div class="form-group">
				<div class="col-sm-11">
					<button type="submit" class="btn btn-info">修改图书</button>
				</div>
			</div>
			
					<br>
					<div class="form-group">
				<div class="col-sm-11">
				 
					<button type="reset" class="btn btn-info">重置</button>
					
				</div>
		</form>

		<!--  <form >
   <table width="350px" height="200px" align="center" border="1px" bordercolor="silver" cellspacing="0";>
    <caption align="top"><h1><font color="red">修改图书</font></h1><hr size="2px" color="red" width="600px"/></caption>
     <tr align="center"><td>请选择分类:</td><td><select><option value="name">计算机</option><option value="name">哲学</option><option value="name">java入门</option></select></td></tr>
     <tr align="center"><td>图&nbsp;书&nbsp;名&nbsp;称:</td><td><input type="text" value=""></td></tr>
     <tr align="center"><td>图&nbsp;书&nbsp;价&nbsp;格:</td><td><input type="text" value=""></td></tr>
     <tr align="center"><td>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</td><td><input type="text" value=""></td></tr>
     <tr align="center"><td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td><td><input type="radio" name="zt"/>未借出<input type="radio" name="zt"/>借出</td></tr>
     <tr align="center"><td>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</td><td><input type="text" value=" "></td></tr>
     <tr align="center"><td colspan="2"><input type="submit"value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"value="重置"></td></tr>
    </table>
   </form> -->
	</center>
</body>
</html>