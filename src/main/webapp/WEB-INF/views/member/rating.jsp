<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 평점</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>
<h1 class="text-center mb-5">My Rate</h1>

<c:forEach items="${reviewList}" var="rv">
	<img alt="메뉴 사진" src="/resources/upload/review/${rv.reviewFilesVOs[0].fileName}">
	<c:forEach items="${rv.restaurantVOs}" var="rest">
		<h3>가게 이름 : ${rest.restaurantName}</h3>
		<h3>가게 주소 : ${rest.address}</h3>
	</c:forEach>
	<h3>별점 : ${rv.star}</h3>
	<hr>
</c:forEach>

<c:import url="../template/cdn_script.jsp"></c:import>
</body>
</html>