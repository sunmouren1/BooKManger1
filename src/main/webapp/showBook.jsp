<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="tubiao/iconfont.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
 <script type="text/javascript">
 window.onload=function(){
    var deleteStudent=document.getElementById("deleteStudent");
	var chek=document.getElementsByName("ids");
	deleteStudent.onclick=function(){
		
		var flag=false;
		
		for(var i=0;i<chek.length;i++){
			
			if(chek[i].checked==true){
				
				flag=true;
				
				break;
			}
		}
		
		if(flag==false){
			
			alert("请至少勾选一个进行删除");
			
			return;
		}
		
		
		var str="";
		
		for(var i=0;i<chek.length;i++){
			
			if(chek[i].checked==true){
				
				str+=chek[i].value+",";
			}
		}
		

		str=str.slice(0,str.length-1);
		
		var queren=confirm("您确认要删除这些学生吗？");
		
		if(queren==true){
			
			location.href="Bookservlet?action=deleteBook&ids="+str;
		}else{
			
			location.reload();
		}
	}
	 $(function() {
	        
	       
         $("#deleteStudent").button();
        
         $("#addbook").button();
       
})

$(function(){
   $("table tr:even").addClass("warning");
   $("table tr:odd").addClass("danger");
})  

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

  
	};
 </script>
 <style type="text/css">
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

#u1{
    width: 300px;
    height: 365px;
    margin-left: 130px;
    
}
#li {
	color: #337AB7;
	font-size: 17px;
}
 
 </style>
<body background="imgs/3.jpg">
  <div class="container">
  <caption align="top">
				<h1 align="center">
					<font color="red" >查看图书</font>
				</h1>
			</caption>
		<table align="center"  frame="void" class="table">
		
			
			
			<div class="col col-md-5 " id="div2">
			<ul class="nav nav-tabs">
			<li class="dropdown">
					 
					
				   <a href="addBook.jsp">添加图书</a>
					 </li>
			 <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">高级搜索<span class="caret"></span></a>
					
					<ul class="dropdown-menu dropdown-menu-right" role="menu" id="u1">
						<li>
							<form action="Bookservlet" class="form-horizontal" id="f1">

                            <input type="hidden" name="action" value="findBookByWhere"> 
								<div class="control-group   ">
									<br>
									<label class="col-sm-4  control-label ">选择分类： </label>
									<div class="controls col-sm-6 ">
										<select name="name" class="form-control  input-sm" id="fenleiList">
											<option>----请选择----</option>
											<c:forEach items="${list }" var="s">

												<option>${s.name}</option>
											</c:forEach>
										</select><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">书名:</label>
									<div class="controls col-sm-6 ">
										<input name="name" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group   ">
									<label class="col-sm-4 control-label  "> 出版社:</label>
									<div class="controls  col-sm-6">
										<input name="chubanshe" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>



								<div class="control-group    ">
									<label class="control-label col-sm-4 "> 状态:</label>
									<div class="controls  col-sm-6">
										<input name="zhuangtai" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>
                                 
								<div class="control-group   ">
									<label class="col-sm-4 control-label ">借书人:</label>
									<div class="controls  col-sm-6">
										<input name="jieshuren" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>
								<div class="control-group  ">

									<div class="controls ss">
										<button type="submit" class="btn   btn-info ">
											<span class="glyphicon glyphicon-search"></span> 开始搜索
										</button>
										<br>
										<br>
									</div>
								</div>

							</form>
						</li>
                      
					</ul>
					</li>
					
					</ul>
			</div>
			
			
			
			
			<!-- -
				<td>选择分类
				<select  name="name" >
						<option >请选择你要查看的分类</option>
						</select>
						</td>
				
				<td>书名<input type="text" name="name" ><button >高级搜索</button></td>
				<!--  <td>作者<input type="text" id="mohuzuozhe"/></td>
				<td>借书人<input type="text" id="mohujieshuren" /></td>
				
			</tr>
			<tr>
				- <td colspan="3">状态<input type="text" /></td>
				<!-- <td colspan="2"><textarea cols="22px" rows="1.5px">搜索图书</textarea></td>
			</tr>
			</form>
			-->
		</table>
		<div class="container">
		<table align="center" width="800px" height="200px" border="1px" class="table"
			cellspacing="0" bordercolor="silver">
			
			<tr align="center">
			
			   <td>选择</td>
			   
				<td>编号</td>
				<td>书名</td>
				
			
				<td>价格</td>
				
				<td>出版社</td>
				
				<td>状态</td>
				
				<td>借书人</td>
				
				<td>分类</td>
				
				<td>修改</td>
				
			</tr>
			
			<c:forEach items="${pb.beanList }" var="s" varStatus="f">
			<tr align=center>
			<td><input type="checkbox" name="ids" value="${s.id}"></td>
				<td>${s.id }</td>
				<td>${s.name }</td>
				<td>${s.jiage }</td>
				<td>${s.chubanshe }</td>
				<td>${s.zhuangtai }</td>
				<td>${s.jieshuren }</td>
				<td>${s.fenlei }</td>
				<td><a href='Bookservlet?action=showoneBook&id=${s.id }'>${s.id } </a></td>
			</tr>
			</c:forEach>
			
			<tr align="center"><td colspan="9"><p id="deleteStudent"><span class="ui-icon ui-icon-trash"></span>删除</button></p></td></tr>
		</table>
	    <p>  
		   <center>
		     第${pb.pageNow }页/共 ${pb.pages }页
		      <ul class="pager text-center" >
		     &nbsp;&nbsp;
		   <li><a href="Bookservlet?action=showBookByPage&pageNow=1">首页</a></li>
		   &nbsp;&nbsp;
		   <c:if test="${pb.pageNow>1 }">
		  <li> <a href="Bookservlet?action=showBookByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
		    </c:if>
		   &nbsp;
		   <c:choose >
		     <c:when test="${pb.pages<=10 }">
		       <c:set var="begin" value="1"></c:set>
		       <c:set var="end" value="${pb.pages }"></c:set>
		     </c:when>
		     <c:otherwise>
		       <c:set var="begin" value="${pb.pageNow-5 }"></c:set>
		       <c:set var="end" value="${pb.pageNow+4 }"></c:set>
		          <c:if test="${begin<=1}">
		             <c:set var="begin" value="1" ></c:set>
		             <c:set var="end" value="10"></c:set>
		          </c:if>
		          <c:if test="${end>=pb.pages }">
		              <c:set var="begin" value="${pb.pages-9 }"></c:set>
		       <c:set var="end" value="${pb.pages }"></c:set>
		          </c:if>
		     </c:otherwise>
		   </c:choose>
		   <!-- 开始循环 -->
		  <c:forEach begin="${begin }" end="${end }" var="i">
		     <c:choose>
		      <c:when test="${pb.pageNow==i }">
		        <li class="active"><span>${i }</span> </li> 
		       </c:when>
		       <c:otherwise>
		     <li>   <a href="Bookservlet?action=showBookByPage=${i }">${i }</a><li>
		       </c:otherwise>
		     </c:choose>
		  </c:forEach>
		   &nbsp;
		   <c:if test="${pb.pageNow<pb.pages }">
		  <li> <a href="Bookservlet?action=showBookByPage&pageNow=${pb.pageNow+1 }"> 下一页</a><li>
		     </c:if>
		   &nbsp;&nbsp;
		 
		  <li> <a href="Bookservlet?action=showBookByPage&pageNow=${pb.pages }">尾页</a></li>
		   </center>
		   </ul>
		</p>
		
		
</body>
</html>