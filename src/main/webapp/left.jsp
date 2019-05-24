<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
      <style type="text/css">
li {
	list-style-type: none;
	padding-top: 5px;
}

a {
	text-decoration: none;
}
       </style>
<script type="text/javascript">
	             $(function() {
		         $("#accordion").accordion();
		        
		        
		         
	})
</script>
<body background="">
     <h2 class="demoHeaders" align="center">菜单</h2>
	<div id="accordion">
		<h3>分类管理</h3>
		<div>
			
				<li><a href="addFenlei.jsp" target="right" ><span class="ui-icon ui-icon-circle-plus"></span>添加分类</a></li>
				<li><a href="UpdateFenlei.jsp" target="right"   ><span class="ui-icon ui-icon-wrench"></span>修改分类</a></li>
				<li><a href="Fenleiservlet?action=showFenleiByPage" target="right"><span class="ui-icon ui-icon-copy"></span>查看分类</a></li>
				


		</div>
		<h3>图书管理</h3>
		<div>
	

				<li><a href= "addBook.jsp" target="right" ><span class="ui-icon ui-icon-circle-plus"></span>添加图书</a></li>
				<li><a href="Bookservlet?action=showBookByPage" target="right" ><span class="ui-icon ui-icon-copy"></span>查看图书</a></li>
				<!--  <li><a href="xiugaiBook.jsp" target="right"><span class="ui-icon ui-icon-wrench"></span>修改图书</a></li>-->
				

	
	  
	  
	  </div>
	  <h3>用户管理</h3>
		<div>
				<li><a  href="addUser.jsp" target="right"><span class="ui-icon ui-icon-circle-plus"></span>添加用户</a></li>
				<li><a href="monsters" target="right"  ><span class="ui-icon ui-icon-copy"></span>查看用户</a></li>
				
			

	 
	  </div>
	  <h3>管理员信息管理</h3>
		<div>
				<li><a href="showAdmin.jsp" target="right"><span class="ui-icon ui-icon-copy"></span>查看管理员信息</a></li>
				<li><a href="UpdateAdminPassword.jsp" target="right" ><span class="ui-icon ui-icon-wrench"></span>修改管理员密码</a></li>
				<li><a href="Adminservlet?action=exit" target="_parent"><span class="ui-icon ui-icon-info"></span>退出系统</a></li>
				<!--  <li><a href="#"><span class="ui-icon ui-icon-trash"></span>删除分类</a></li>-->

	  </div>
	<!-- - <table bgcolor="pink" width="200px" border="1" align="center"
		bordercolor="white">
     
		<tr align="center">
			<td><font size="5" color="white"><p id="root">+分类管理</p></font></td>
		</tr>

		<tr >
			<td>
			   <div id="changroot">
				<table height="80px" align="center" cellspacing="0" width="100px">
					<tr align="center">
						<td><p><a href="addFenlei.jsp" target="right"><input
								type="button" value="添加分类" /></a></p></td>
					</tr>
					<tr align="center">
						<td><p><a href="Fenleiservlet?action=showFenleiByPage"
							target="right"><input type="button" value="查看分类" /></a></p></td>
					</tr>
					<tr align="center">
						<td><p><a href="UpdateFenlei.jsp"
							target="right"><input type="button" value="修改分类" /></a></p></td>
					</tr>
				</table>
              </div>
			</td>
		</tr>

		<tr align="center">
			<td><font size="5" color="white"><p id="book">+图书管理</p></font></td>
		</tr>
		<tr >
			<td>
			<div id="changbook">
				<table height="80px" align="center" cellspacing="0" width="100px">
					<tr align="center">
						<td><p><a href="addBook.jsp" target="right"><input
								type="button" value="添加图书" /></a></p></td>
					</tr>
					<tr align="center">
						<td><p><a href="Bookservlet?action=showBook" target="right"><input
								type="button" value="查看图书" /></a></p></td>
					</tr>
					<!--  <tr align="center">
						<td><p><a href="xiugaiBook.jsp" target="right"><input
								type="button" value="修改图书" /></a></p></td>
					</tr>
					
				</table>
				</div>
			</td>
		</tr>
		<tr align="center">
			<td><font size="5" color="white"><p id="user">+用户管理</p></font></td>
		</tr>
		<tr >
			<td>
			<div id="changuser">
				<table height="80px" align="center" cellspacing="0" width="100px">
					<tr align="center">
						<td><p><a href="addUser.jsp" target="right"><input
								type="button" value="添加用户" /></a></p></td>
					</tr>
					<tr align="center">
						<td><p><a href="Userservlet?action=showUserByPage" target="right"><input
								type="button" value="查看用户" /></a></p></td>
					</tr>
					<!-- Userservlet?action=showUserByPage -->
				<!-- 	<tr align="center">
						<td><p><a href="xiugaiUser.jsp" target="right"><input
								type="button" value="修改用户" /></a></p></td>
					</tr>
					 
				</table>
				</div>
			</td>
		</tr>
		<tr align="center">
			<td><font size="5" color="white"><p id="admin">+管理员信息管理</p></font></td>
		</tr>
		<tr>
			<td>
			<div id="changadmin">
				<table height="100px" align="center" cellspacing="0" width="100px">
					<tr align="center">
						<td><p><a href="showAdmin.jsp" target="right"><input
								type="button" value="查看管理员信息" /></a></p></td>
					</tr>
					<tr align="center">
						<td><p><a href="UpdateAdminPassword.jsp" target="right"><input
								type="button" value="修改密码" /></a></p></td>
					</tr>
					<tr align="center">
						<td><p><a href="Adminservlet?action=exit" target="_parent"><input
								type="button" value="退出系统" /></a></p></td>
					</tr>
				</table>
				<div>
			</td>
		</tr>

	</table>
        -->
			</body>
</html>