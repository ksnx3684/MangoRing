<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사장 관리 페이지</h1>
	<h3>나의 가게</h3>
	<a href="./add?restaurantNum=${restaurantVO.restaurantNum}">${restaurantVO.restaurantName}</a>
</body>
</html>