<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
  </head>
  
  <body>
      <center><h3>注册新用户</h3></center>
      <form action="${pageContext.request.contextPath }/regist.action" id="regForm">
         <table width="50%" align="center" border="1px">
         	  <tr>
         	  	  <td width="20%">用户名</td>
         	  	  <td ><input type="text" name="username" id="uname" >
         	  	  <span id="nameError" style="color: red"></span></td>
         	  </tr>
         	  <tr>
         	  	  <td>密码</td>
         	  	  <td><input type="password" name="password" id="pwd">
         	  	  <span id="pwdError" style="color: red"></span></td>
         	  </tr>
         	  <tr>
         	  	  <td>重复密码</td>
         	  	  <td ><input type="password" name="repassword" id="repwd">
         	  	  <span id="repwdError" style="color: red"></span></td>
         	  </tr>
         	  
         	   <tr>
         	  	  <td >出生日期</td>
         	  	  <td ><input type="text" name="birthday" class="Wdate" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="birth">
         	  	  	<span id="birthError" style="color: red"></span></td>
         	  </tr>
         	   <tr>
         	  	  <td width="30%">性别</td>
         	  	  <td  >
         	  	  	<input type="radio" value="0" name="sex" checked="checked">男
         	  	  	<input type="radio" value="1" name="sex">女
         	  	  </td>
         	  	  
         	  </tr>
         	  <tr>
         	  	  <td colspan="2" align="center">
         	  	  	<input type="button" value="注册" id="btnReg">
				  </td>
         	  </tr>
         	  
         </table>
      </form>
  </body>
  <script type="text/javascript">
    	 
     $(function(){
		
    	 //用户名文本框
    	 $("#uname").on("blur",function(){
    		  var uname=$("#uname").val();
			  $.ajax({
				    url:"${pageContext.request.contextPath}/chkName.action",
					type:"post",
					data:JSON.stringify({"username":uname}),
					contentType:"application/json;charset=utf-8",
				    success:function(data){
				      //判断data是否为空
					  if(data){  
						  $("#nameError").text("用户名已存在");
					  }else{
						  $("#nameError").text("");
					  }
				  }
			  });
    	 });
    	
		//注册按钮
		$("#btnReg").on("click",function(){
			var bool=true;
			//用户名空判断
			if(!$("#uname").val()){
				alert("uname");
				$("#nameError").text("用户名不能为空");
				bool=false;
			}
			//密码空判断
			if(!$("#pwd").val()){
				alert("pwd");
				$("#pwdError").text("密码不能为空");
				bool=false;
			}
			//两次密码判断
			if($.trim($("#pwd").val())!=$.trim($("#repwd").val())){
				alert("repwd==pwd");
				$("#repwdError").text("两次密码不一致");
				bool=false;
			}
			//生日判断
			var selBirth=new Date($("#birth").val().replace("-", "/").replace("-", "/"));
			var curDate=new Date();
			if(selBirth>curDate){
				alert("bir");
				$("#birthError").text("生日很奇怪");
				bool=false;
			}
			alert(bool);
			//通过验证时，提交表单
			if(bool){
				$("#regForm").submit();
			}
		});
     });
  </script>
</html>
