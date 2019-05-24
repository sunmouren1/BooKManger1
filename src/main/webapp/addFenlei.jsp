<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
</head>
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
							message : '分类名称不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '分类名称必须是2~10个汉字'
						},
					}
				},
				 
				

				
			
				
			}

		})

	});
 
 </script>
<body background="imgs/3.jpg">
  <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="Fenleiservlet?action=addFenlei" method="post">
					<h3 class="text-center text-success">添加分类</h3>
					<div class="form-group">
						<label>请输入分类的名称:</label> <input type="text"
							name="name" class="form-control" />
					</div>

                   
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<button type="reset" class="btn btn-success btn-block">重填</button>
					</div>
				</form>

			</div>


		</div>

	</div>
	<!--  <form action="Fenleiservlet?action=addFenlei" method="post">
		<table align="center" width="200px" height="100px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">添加分类</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			<tr align="center">
				<td>请输入分类的名字:</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" /></td>
			</tr>
		</table>
	</form>
	-->
</body>
</html>