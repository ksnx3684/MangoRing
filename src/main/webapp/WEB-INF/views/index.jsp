<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<c:import url="./template/bootstrap_css.jsp"></c:import>
<c:import url="./template/mango_header.jsp"></c:import>
</head>
<body>
	<h1>hi!</h1>
	

	<a href="./reservation/write?restaurantNum=1">예약하기</a>
	

<c:import url="./template/cdn_script.jsp"></c:import>

	<c:import url="./template/header.jsp"></c:import>
	<form action="/search/result" method="get">
		<div class="container">
			<h1>hi!</h1>
			<input type="hidden" name="address" value="">
			<input type="text" placeholder="지역, 메뉴, 점포명 검색" name="name">
			<input type="hidden" name="star" value="0">
			<button>검색</button>
		</div>
	</form>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>