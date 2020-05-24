<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	    function chageCode(){
	    	$("#imgCode").attr("src","${pageContext.request.contextPath}/vcode.action?aa="+new Date().getTime().toString());
	    }
	</script>
  </head>
  
  <body>
      <center><h3>登录</h3></center>
      <form action="${pageContext.request.contextPath }/login.action" method="post">
         <table width="30%" align="center" border="1px">
         	  <tr>
         	  	  <td colspan="3" style="color: red">${errorMsg }</td>
         	  </tr>
         	  <tr>
         	  	  <td>用户名</td>
         	  	  <td colspan="2"><input type="text" name="username" value="${username }"></td>
         	  </tr>
         	  <tr>
         	  	  <td>密码</td>
         	  	  <td colspan="2"><input type="password" name="password"></td>
         	  </tr>
         	  <tr>
         	  	  <td width="20%">验证码</td>
         	  	  <td width="30%"><input type="text" width="30px" name="vcode"></td>
         	  	  <td align="left"><img  id="imgCode" src="${pageContext.request.contextPath}/vcode.action" onclick="chageCode()"></td>
         	  </tr>
         	  <tr>
         	  	  <td colspan="3" align="center">
         	  	  	<input type="submit" value="登录">
         	  	  	<input type="button" value="注册" onclick="window.location.href='${pageContext.request.contextPath}/regist.jsp'">
				  </td>
         	  </tr>
         	  
         </table>
      </form>
  </body>
</html>
