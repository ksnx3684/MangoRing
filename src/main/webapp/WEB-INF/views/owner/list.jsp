<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사장 관리 페이지</h1>
	<h3>나의 가게</h3>
	${restaurantVO.restaurantName}
	<c:choose>
		<c:when test="${not empty restaurantVO.restaurantPhone}">
			<a href="./shop/update?restaurantNum=${restaurantVO.restaurantNum}">수정</a>
		</c:when>
		<c:otherwise>
			<a href="./shop/add?restaurantNum=${restaurantVO.restaurantNum}">가게 정보 등록</a>
		</c:otherwise>
	</c:choose>
	<a href="./shop/delete?restaurantNum=${restaurantVO.restaurantNum}">삭제</a>
	
	<a href="../owner/reservationManage?restaurantNum=${restaurantVO.restaurantNum}">예약 관리</a>
	
	
</body>
</html>