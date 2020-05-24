<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加商品信息</title>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	
</head>
<body> 
	<!-- 上传图片是需要指定属性 enctype="multipart/form-data" -->
	<!-- <form id="itemForm" action="" method="post" enctype="multipart/form-data"> -->
	<form id="addForm"	action="${pageContext.request.contextPath }/itemAdd.action" method="post">
		<table width="100%" border=1>
			<tr>
				<td>商品名称</td>
				<td>
					<input type="text" name="name" id="name"/>
					<span id="nameError" style="color: red"></span>
				</td>
			</tr>
			<tr>
				<td>商品价格</td>
				<td>
					<input type="text" name="price" id="price"/>
					<span id="priceError" style="color: red"></span>
				</td>
			</tr>
			<tr>
				<td>商品生产日期</td>
				<td><input type="text" name="createtime" class="Wdate" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
			</tr>
			<%-- 
			<tr>
				<td>商品图片</td>
				<td>
					<c:if test="${item.pic !=null}">
						<img src="/pic/${item.pic}" width=100 height=100/>
						<br/>
					</c:if>
					<input type="file"  name="pictureFile"/> 
				</td>
			</tr>
			 --%>
			<tr>
				<td>商品简介</td>
				<td><textarea rows="3" cols="30" name="detail"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" id="btnAdd" value="添加" />
				</td>
			</tr>
		</table>

	</form>
</body>
  <script type="text/javascript">
	 $(function(){
		 $("#btnAdd").click(function(){
			 var bool=true;
			 $("#nameError").text("");
			 $ ("#priceError").text("");
			 //判断商品名称是否为空
			 if(!$("#name").val()){
				 $("#nameError").text("商品名称不能为空");
				 bool=false;
			 }
			 if(!$("#price").val()){
				 $("#priceError").text("价格不能为空");
				 bool=false;
			 }
			 
			 var reg=/^\+?[0-9][1-9]*\.[0-9]*$/;
			 if(!reg.test($("#price").val())){
				 $("#priceError").text("价格必须为数字！");
				 bool=false;
			 }
			 alert(bool);
			 if(bool){
				 $("#addForm").submit();
			 }
		 });
	 });
  </script>
</html>

