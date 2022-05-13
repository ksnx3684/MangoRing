<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
	<c:forEach items="${list}" var="v">
		<h1>가게 이름 : ${v.restaurantName}</h1>
		<h1>평점 : ${v.reviewVOs[0].star}</h1>
	</c:forEach>

</body>
</html>