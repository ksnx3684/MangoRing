<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세검색</title>
</head>
<body>
	<form action="./detailSearchResult" method="get">
		지역<input type="text" name="city" value="">
		메뉴<input type="text" name="menu">
 		평점<select name="star">
 			<option value="0">선택</option>
 			<option value="1">1점 이상</option>
 			<option value="2">2점 이상</option>
 			<option value="3">3점 이상</option>
 			<option value="4">4점 이상</option>
 		</select>
 		노키즈존<input type="checkbox" name="kidCheck" value="1">
 		주차가능여부<input type="checkbox" name="parkingCheck" value="1">
 		<div>
 			<h1>해시태그</h1>
 			<c:forEach items="${list}" var="li">
 				<input type="checkbox" name="hashtag" value="${li.tagNum}">${li.name}
 			</c:forEach>
 		</div>
		<button>검색</button>
	</form>
</body>
</html>