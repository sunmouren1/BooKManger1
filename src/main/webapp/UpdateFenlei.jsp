<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>修改分类</title>
<script type="text/javascript" src="/BookManger1/js/ajax.js"></script>
<script>
	$(function() {

		$(".form-horizontal")
				.bootstrapValidator(
						{
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'

							},
							fields : {
								id : {

									validators : {

										callback : {

											callback : function(value,
													validator) {

												if (id.value == "----请选择----") {
													return {
														valid : false,

														message : '必须选择',
													}

												}
												return true;

											}
										}
									}

								},
								name : {
									validators : {

										notEmpty : {

											message : '分类名不能为空'
										},

										
										remote : {//ajax验证
											url : "http://localhost/BooKManger1/yzfenleiupdate",//验证地址
											//提示消息
											message : '该分类已存在或该分类下有图书 ',
											delay : 500,
											type : 'GET',

							
											data : function(validator) {
												return {

													name : $("#name").val(),
													id : $("#id").val()
												}
											}

										}

									}

								}

							}

						});

	});
</script>
<style>
#div1 {
	margin-top: 60px;
	border: 2px solid #D7E4E8;
	border-color: pink;
}

form {
	margin-top: 30px;
	width: 900px;
}

.container {
	margin-top: 100px;
}

.btn {
	margin-top: 30px;
}

h3 {
	margin-top: 30px;
}

label {
	font-size: 15px;
}

hr {
	border: 1.5px solid red;
	width: 500px;
}

#div9 {
	height: 700px;
	margin-top: 20px;
}
</style>
</head>
<body background="http://localhost/BooKManger1/imgs/3.jpg">
	<div class="container-fluid" id="div9" >
		<c:if test="${!empty mag }">
			<script>
				alert("${mag}");
			</script>
		</c:if>
		<c:remove var="mag" />
		<!--  <marquee align="texttop" behavior="slide" scrollamount="60"
			direction="up">-->
		<div class="col col-md-8 col-md-offset-1" id="div1">
			<h2 class="text-center text-info"><font color="red">修改分类</font></h2>
			<hr>
			<table>
				<tr>
					<td>
						<form class="form-horizontal"
							action="http://localhost/BooKManger1/fenleiupdate" method="post">
							<input type="hidden" name="_method" value="PUT"> <input
								type="hidden" name="id" value="${f.id }" id="id" />

							<div class="form-group f1">
								<label class="col-sm-5  control-label text-info"><font color="red">请输入新的分类的名字:</font></label>
								<div class="col-sm-4">
									<input type="text" name="name" value="${f.name }" id="name"
										class="form-control input-md" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5 ">
									<button type="submit" class="btn btn-success">
										修改 <span class="glyphicon glyphicon-cog"></span>
									</button>
								</div>

								<div class="col-sm-2    ">

									<a href="http://localhost/BooKManger1/fenleis/1"
										class="btn btn-success ">返回 <span
										class="glyphicon glyphicon-repeat"></span></a>

								</div>
							</div>

						</form>
					</td>
				</tr>
			</table>
			<br>
		</div>

		<!-- </marquee>-->
	</div>
</body>

</html>