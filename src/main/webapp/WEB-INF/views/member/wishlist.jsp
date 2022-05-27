<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>
	<h1 class="text-center">Wishlist Page</h1>
	
	<div class="container">
		<c:forEach items="${wishList}" var="wish">
			<span>위시리스트 사용하는 사람 ID : ${wish.id}</span><br>
			<c:forEach items="${wish.restaurantVOs}" var="rest">
				<span>가게 번호 : ${rest.restaurantNum}</span><br>
				<span>가게 주소 : ${rest.address}</span><br>
				<span>가게 이름 : ${rest.restaurantName}</span><br>
				<span>${rest}</span><br>
				<hr><br>
			</c:forEach>
		</c:forEach>
	</div>
	
	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
</html>