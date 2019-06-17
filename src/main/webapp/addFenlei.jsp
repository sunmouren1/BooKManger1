<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<title>添加分类</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script>
 
	$(function() {
	$("#register").bootstrapValidator({

		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'

		},
		fields : {
			name:{
				validators : {

					notEmpty : {

						message : '分类名不能为空'
					},
					stringLength : {
						min : 1,
						max : 10,
						message : '分类名长度小于10'
					},

					// threshold :  6 , 有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
					remote : {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
						url : "http://localhost/BooKManger1/yanzhengAddFenlei",//验证地址
						message : '该分类已经存在,请重新输入',  //提示消息
						delay : 500,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
						type : 'GET',//请求方式

						//自定义提交数据，默认值提交当前input value
						data : function(validator) {
							
							return {
								
								name : $("#name").val() 
							 
							}
						}

					}

				}

			},
			
			id: {

				validators : {

					callback : {

						callback : function(value, validator) {

							if (id.value == 0) {
								return {
									valid : false,

									message : '必须选择',
								}

							}
							return true;

						}
					}
				}

			}
		}
	});
	});
</script>
<style type="text/css">
#div1 {
 
	margin-top: 20px;
   border:2px solid ;
   border-color: pink; 
}

form {
	margin-top: 20px;
}


.btn {
	margin-top: 30px;
}
h3{
margin-top: 30px;
}
label{
   font-size: 15px;
}
hr{
border: 1.5px solid red;
 width: 500px;
 
 
}
#div9{
	/* background-image: url("tu/t6.jpg"); */
	background-size:cover;
	height: 840px;
	margin-top: 60px;
}
</style>
</head>
<body background="imgs/3.jpg">
 <div class="container-fluid"  id="div9">
		<!--  <marquee align="texttop" behavior="slide" scrollamount="60"
			direction="up">-->
			<div class="col col-md-5 col-md-offset-2" id="div1">

				<h2 class="text-center text-info"><font color="red">添加分类</font></h2>
             
             <hr>
			<form action="fenlei" method="post" id="register"
			  class="form-horizontal">

				<div class="form-group">
					<label for="Input1" class="col col-sm-5   control-label  text-info"><font color="red">请输入分类的名字: </font>
						</label>
					<div class="col-sm-5">
						<input type="text" name="name"  
							class="form-control" id="Input1" />

					</div>
				 
				</div>
                 <div class="form-group">
						<div class="col-sm-2  col-sm-offset-3 ">
							<button type="submit" class="btn btn-success">
								添加 <span class="glyphicon glyphicon-ok"></span>
							</button>
						</div>
						<div class="col-sm-2  col-sm-offset-1">
							<button type="reset" class="btn btn-success">
								重置 <span class="glyphicon glyphicon-repeat"></span>
							</button>
						</div>
					</div>
			 <br>
			</form>



		</div>
	</div>
 


</body>
</html>