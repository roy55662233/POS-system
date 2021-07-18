<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	a{
	text-decoration: none;
	color: blue;
	}
	</style>
</head>
<body>
	<h1>前台</h1>
	<h3>
		<a href="<c:url value="/pages/home.page" />">Home</a>
	</h3>
	<h3>
		<a href="<c:url value="/pages/menu1.page" />">Menu</a>
	</h3>
	<h3>
		<a href="<c:url value="/pages/shopcar.page" />">ShopCar</a>
	</h3>
	<h3>
		<a href="<c:url value="/pages/order.page" />">Order</a>
	</h3>

	<h1>後台</h1>
	<h3>
		<a href="<c:url value="/pages/emp.page" />">Employee</a>
	</h3>
	
	<h3>
		<a href="<c:url value="/back-pages/includeBackpage.page" />">後台</a>
	</h3>
	
	<h3>
		<a href="<c:url value="/shop/orderCheck.page" />">OrderCheck</a>
	</h3>

	<!-- 		<h3> -->
	<%-- 			<a href="<c:url value="/pages/menutestAjaxpage" />">MenuTestAjax</a> --%>
	<!-- 		</h3> -->
	<h3>
		<a href="<c:url value="/pages/menutestJava.page" />">MenuTestJava</a>
	</h3>
	
	
	<h1>API</h1>
	<h3>
		<a href="<c:url value="/public/api/prod" />">Product</a>
	</h3>
	<h3>
		<a href="<c:url value="/public/api/prodOrderby" />">ProductOrderby &ensp; (public/api/prodOrderby)</a>
	</h3>
	<h3>
		<a href="<c:url value="/public/api/oderds" />">Orders &ensp; (public/api/oderds) </a>
	</h3>
	<h3>
		<a href="<c:url value="/public/api/oderdetail" />">OrdersDerdetail &ensp; (public/api/oderdetail) </a>
	</h3>
	
</body>
</html>