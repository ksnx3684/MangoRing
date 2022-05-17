<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>망고플레이트</title>
</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<form action="/search/searchResult" method="get">
		<div class="container">
			<h1>hi!</h1>
			<input type="text" placeholder="지역, 메뉴, 점포명 검색" name="name">
			<input type="hidden" name="star" value="0">
			<button>검색</button>
		</div>
	</form>
</body>
</html>