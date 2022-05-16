<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>
	<form action="/search/searchResult" method="get">
		<input type="text" placeholder="지역, 메뉴, 점포명 검색" name="name">
		<input type="hidden" name="star" value="0">
		<button>검색</button>
	</form>
</body>
</html>