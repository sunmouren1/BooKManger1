<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>添加图书</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
 
<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	/*
	function ValiDatename() {
		var name = document.addBook.name;
		var reg = /^[\u0391-\uFFE5]{1,20}$/;
		var nameMsg = document.getElementById("nameMsg");
		if (reg.test(name.value)) {
			nameMsg.style.color = "green";
			nameMsg.innerHTML = "书名合法";

			return true;
		} else {
			nameMsg.style.color = "red";
			nameMsg.innerHTML = "书名必须1-20位汉字";
			return false;
		}

	}
	function ValiDatejiage() {
		var jiage = document.addBook.jiage;
		var reg = /^[0-9]+$/;
		var jiageMsg=document.getElementById("jiageMsg");
		if (reg.test(jiage.value)) {
			jiageMsg.style.color = "green";
			jiageMsg.innerHTML = "价格合法";
			return true;
		} else {
			jiageMsg.style.color = "red";
			jiageMsg.innerHTML = "价格必须是数字";
			return false;
		}
	}

	function ValiDatechubanshe() {
		var chubanshe = document.addBook.chubanshe;
		var reg = /^[\u0391-\uFFE5]{1,20}$/;
		var chubansheMsg = document.getElementById("chubansheMsg");
		if (reg.test(chubanshe.value)) {
			chubansheMsg.style.color = "green";
			chubansheMsg.innerHTML = "出版社名合法";

			return true;
		} else {
			chubansheMsg.style.color = "red";
			chubansheMsg.innerHTML = "出版社名必须1-20位汉字";
			return false;
		}

	}
	function ValiDatejieshuren() {

		var jieshuren = document.addBook.jieshuren;

		var reg = /^[\u0391-\uFFE5]{1,20}$/;
		var jieshurenMsg = document.getElementById("jieshurenMsg");
		if (reg.test(jieshuren.value)) {
			jieshurenMsg.style.color = "green";
			jieshurenMsg.innerHTML = "借书人名合法";

			return true;
		} else {
			jieshurenMsg.style.color = "red";
			jieshurenMsg.innerHTML = "借书人名必须1-20位汉字";
			return false;
		}

	}
	function jiaoyan() {
		return ValiDatename()&&ValiDatejiage()&&ValiDatechubanshe()&&ValiDatejieshuren();
	}    */
	ajax({
		
		method:"POST",
		url:"Fenleiservlet",
		params:"action=addshowFenlei",
		type:"xml",
		success:function(data){
			
			var select=document.getElementById("fenleiList");
			
			//alert(typeof data);
			
			var names=data.getElementsByTagName("name");
			
			for(var i=0;i<names.length;i++){
				
				var name=names[i];
				
				var opt=document.createElement("option");
				
				var value;
				
				if(window.addEventListener){
					
					value=name.textContent;
					
				}else{
					
					
					value=text;
				}
				
				opt.innerHTML=value;
				
				opt.value=value;
				
				
				select.appendChild(opt);
			
		}
		
	}


	});

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
							message : '书名不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{1,20}$/,
							message : '书名必须是1~20个汉字'
						},
					}
				},
				jiage : {
					validators : {
						notEmpty : {
							message : '书的价格不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '书的价格必须是数字'
						},

					}
				},

				chubanshe : {
					validators : {
						notEmpty : {
							message : '出版社不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{5,10}$/,
							message : '出版社必须是5~10位汉字'
						},
					}
				},
				zhuangtai : {
					validators : {
						notEmpty : {
							message : '必须选择书籍的状态'
						},
					}
				},
				
				jieshuren : {
					validators : {
						notEmpty : {
							message : '借书人不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '借书人的名字必须是2~10位汉字'
						},
					}
				},
				
			}

		})

	});
</script>
</head>
<body background="imgs/3.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="Bookservlet?action=AddBook" method="post">
					<h3 class="text-center text-success">添加图书</h3>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="name" class="form-control" />
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="jiage" class="form-control" />
					</div>
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chubanshe" class="form-control" />
					</div>

					<div class="form-group">
						<label>状&nbsp;&nbsp;态：</label>
						<div class="radio">
							<label class="radio-inline"><input type="radio"
								name="zhuangtai" value="未借出" />未借出</label> <label class="radio-inline"><input
								type="radio" name="zhuangtai" value="借出" />借出</label>
						</div>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> <input
							type="text" name="jieshuren" class="form-control" />
					</div>
					<div class="form-group">
						<label>请选择分类：</label>
					     <select class="form-control"  id="fenleiList" name="fenlei">
                      <option>--请选择--</option>
                       
                 </select>
         
         
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<button type="reset" class="btn btn-success btn-block">重填</button>
					</div>
				</form>

			</div>


		</div>

	</div>
	<!-- -
	<form action="Bookservlet?action=AddBook" method="post" name="addBook" onsubmit="return jiaoyan() ">
		<table align="center" width="200px" height="100px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">添加图书</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			
			<tr align="center">
				<td>图&nbsp;书&nbsp;名&nbsp;称:</td>
				<td><input type="text" name="name" onblur="ValiDatename()"/></td>
				<td width="150px"><span id="nameMsg"></span></td>
			</tr>
			<tr align="center">
				<td>图&nbsp;书&nbsp;价&nbsp;格:</td>
				<td><input type="text" name="jiage" onblur="ValiDatejiage()" /></td>
				<td width="150px"><span id="jiageMsg"></span></td>
			</tr>
			<tr align="center">
				<td>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</td>
				<td><input type="text" name="chubanshe" onblur="ValiDatechubanshe()"/></td>
				<td width="150px"><span id="chubansheMsg"></span></td>
			</tr>
			<tr align="center">
				<td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td>
				<td colspan="2"><input type="radio" name="zhuangtai" value="未借出"  />未借出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="zhuangtai" value="借出" />借出</td>
					
			</tr>
			<tr align="center">
				<td>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</td>
				<td><input type="text" name="jieshuren" onblur="ValiDatejieshuren()"/></td>
				<td width="150px"><span id="jieshurenMsg"></span></td>
			</tr>
			<tr align="center">
				<td >请选择分类:</td>
				<td colspan="2"><select><option name="fenlei">计算机</option>
						<option>哲学</option>
						<option>管理</option>
						<option>教辅</option>
						</select>
				</td>
				
			</tr>
			<tr align="center">
				<td colspan="3"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" /></td>
			</tr>
			
		</table>
	</form>
	 -->
</body>
</html>