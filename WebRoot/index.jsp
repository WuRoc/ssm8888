<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>测试JSON交互</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" 
      src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js">
</script>
<script type="text/javascript">

    $(function(){   //当页面加载完毕时调用
         //给用户名文本框添加失去焦点的事件属性
         $("#username").on("blur",function(){
        	 var uname=$("#username").val();
        	 //alert(uname);
        	 //向服务器发出请求，判断uname是否存在
        	 $.ajax({
        		 url:"${pageContext.request.contextPath}/chkName.action",
        		 type:"post",
        		 data:JSON.stringify({username:uname}),
        		 contentType:"application/json;charset=utf-8",
				    success:function(data){
				      //判断data是否为空
					  if(data){  
						  $("#msg").text("用户名已存在");
					  }else{
						  $("#msg").text("");
					  }
				    }
        	 });
         });
    	
    });
</script>
</head>
<body>
    <h3>JSON交互测试</h3>
    <form action="${pageContext.request.contextPath}/login2.action" method="post" id="form">
        <table width="60%" border=1>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="username" id="username" />
				 <span style="color: red" id="msg">${errorMsg }</span></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" id="password"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="JSON交互测试" id="btnLogin">
				</td>
			</tr>
			</table>
    </form> 
</body>
</html>
