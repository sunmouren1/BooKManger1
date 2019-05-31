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

</body>
</html>