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
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h1>조건에 맞는</h1>
		<h1>맞춤 맛집을 찾아드려요!</h1>
		<form action="./detailSearchResult" method="get">
			<div>
				<input type="text" name="city" value="" placeholder="지역">
			</div>
			<div>
				<input type="text" name="menu" placeholder="메뉴">
			</div>
			<div>
				<select name="star">
		 			<option value="0">평점 순</option>
		 			<option value="1">리뷰 순</option>
	 			</select>
			</div>
	 		<div>
				<input type="checkbox" name="kidCheck" value="1"> 노키즈존
	 			<input type="checkbox" name="parkingCheck" value="1"> 주차가능여부
			</div>
	 		<div>
	 			<h3>해시태그</h3>
	 			<c:forEach items="${list}" var="li">
		 			<label>
		 				<input type="checkbox" name="hashtag" value="${li.tagNum}"> ${li.name}
		 			</label>
	 			</c:forEach>
	 		</div>
			<button>검색</button>
		</form>
	</div>
</body>
</html>