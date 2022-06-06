<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> -->
</head>
<body style="margin-top: -50px;">
	<nav class="navbar navbar-expand-lg navbar-light ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="../">MangoRing</a>
		<li class="nav-item searchbar" style="margin-top: 4px; list-style: none;"><c:import url="/WEB-INF/views/template/search.jsp"></c:import></li>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
		<ul class="navbar-nav ml-auto">
			
			<li class="nav-item active"><a href="/search/detailSearch" class="nav-link">상세검색</a></li>
			<c:choose>
				<c:when test="${not empty member}">
					<!-- <li class="nav-item"><a href="/cart/cartList" class="nav-link">장바구니</a></li> -->
					<li class="nav-item"><a href="/member/myPage" class="nav-link">마이페이지</a></li>
					<li class="nav-item"><a href="/member/logout" class="nav-link">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="/member/login" class="nav-link">로그인</a></li>
				</c:otherwise>
			</c:choose>
			<!-- <li class="nav-item cta"><a href="reservation.html" class="nav-link">Book a table</a></li> -->
		</ul>
		</div>
	</div>
	</nav>
	<!-- END nav -->

</body>
</html>