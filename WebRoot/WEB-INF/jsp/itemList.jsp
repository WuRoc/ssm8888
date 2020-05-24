<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查询商品列表</title>
	<script type="text/javascript">
		function selAll(chkAll) {
			var chks=document.getElementsByName("ids");
			for(var i=0;i<chks.length;i++){
				chks[i].checked=chkAll.checked;
			}
		}
	</script>
</head>
<body> 
<form action="${pageContext.request.contextPath }/queryItem.action" method="post">
	查询条件：
	<table width="50%" border=1>
		<tr>
		    <td>商品id:<input type="text" name="item.id"></td>
		    <td>商品名称:<input type="text" name="item.name"></td>
			<td><input type="submit" value="查询"/></td>
		</tr>
	</table>
  </form>
  <form action="${pageContext.request.contextPath }/delSelectedItems.action" method="post">
	商品列表：
	<table width="100%" border=1>
	<tr>
		<td><input type="checkbox" onclick="selAll(this)">全选</td>
		<td>商品名称</td>
		<td>商品价格</td>
		<td>生产日期</td>
		<td>商品图片</td>
		<td>商品描述</td>
		<td>操作</td>
	</tr>
	<c:forEach items="${itemList }" var="item">
	<tr>
		<td><input type="checkbox"  name="ids" value="${item.id }"></td>
		<td>${item.name }</td>
		<td>${item.price }</td>
		<td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>${item.detail }</td>
		
		<td>
			<a href="${pageContext.request.contextPath }/itemPreEdit.action?id=${item.id}">修改</a>
			<a href="${pageContext.request.contextPath }/delItem.action?id=${item.id}" onclick="return confirm('确定要删除吗？')">删除</a>
			<a href="${pageContext.request.contextPath }/item/${item.id}" onclick="return confirm('确定要删除吗？')">删除2</a>
			<c:if test="${item.pic!=null }">
				<a href="${pageContext.request.contextPath }/download.action?picname=${item.pic}" >下载图片</a>
			</c:if>
		</td>
	
	</tr>
	</c:forEach>
	<tr>
		<td colspan="6">
		   <a href="${pageContext.request.contextPath }/toAdd.action">添加商品</a>
		   <input type="submit" value="删除选定商品">
		</td>
	</tr>
	</table>
</form>
</body>

</html>