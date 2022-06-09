<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>

<style type="text/css">
	#id {
		outline:none;
	}
	
	body.modal-open {
		overflow: auto;
	}
	
	body.modal-open[style] {
		padding-right: 0px !important;
	}
	
	.container {
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>

<link
		href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
		rel="stylesheet">
	<link
		href="https://fonts.googleapis.com/css?family=Monoton&display=swap"
		rel="stylesheet">
	<link
		href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap"
		rel="stylesheet">
	
	<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="../css/animate.css">
	
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/owl.theme.default.min.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
	
	<link rel="stylesheet" href="../css/aos.css">
	
	<link rel="stylesheet" href="../css/ionicons.min.css">
	
	<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="../css/jquery.timepicker.css">
	
	<link rel="stylesheet" href="../css/flaticon.css">
	<link rel="stylesheet" href="../css/icomoon.css">
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>

<section class="hero-wrap hero-wrap-2"
		style="background-image: url('../images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
				
				<h1 class="mb-2 bread">회원 탈퇴</h1>
				</div>
			</div>
		</div>
	</section>

	<div class="container text-center mb-3">
		회원을 탈퇴하시겠습니까?<br> 
		모든 개인정보가 삭제되며 복구할 수 없습니다

		<form action="./delete" method="POST">
			<div class="mt-3 mb-3 row">
				<label for="id" class="col-sm-2 col-form-label">ID</label>
				<div class="col-sm-10">
					<input type="text" id="id" readonly="readonly" class="form-control-plaintext"
						id="id" value="${member.id}">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword" name="pw">
				</div>
				<div>
					<c:if test="${msg == false}">
						비밀번호가 맞지 않습니다.
					</c:if>
				</div>
			</div>

			<div class="d-grid gap-2 d-md-block mt-5">
				<button class="btn btn-primary me-5" type="button">메인으로 가기</button>
				<button class="btn btn-danger ms-5" type="submit">회원 탈퇴</button>
			</div>
		</form>

	</div>

	<c:import url="../template/cdn_script.jsp"></c:import>
	<!-- <script src="../js/jquery.min.js"></script> -->
	   <script src="../js/jquery-migrate-3.0.1.min.js"></script>
	   <script src="../js/popper.min.js"></script>
	   <script src="../js/bootstrap.min.js"></script>
	   <script src="../js/jquery.easing.1.3.js"></script>
	   <script src="../js/jquery.waypoints.min.js"></script>
	   <script src="../js/jquery.stellar.min.js"></script>
	   <script src="../js/owl.carousel.min.js"></script>
	   <script src="../js/jquery.magnific-popup.min.js"></script>
	   <script src="../js/aos.js"></script>
	   <script src="../js/jquery.animateNumber.min.js"></script>
	   <script src="../js/bootstrap-datepicker.js"></script>
	   <script src="../js/jquery.timepicker.min.js"></script>
	   <script src="../js/scrollax.min.js"></script>
	   <script src="../js/google-map.js"></script>
	   <script src="../js/main.js"></script>
</body>
<script type="text/javascript">
	$(function () {
	    $('input').blur();
	});
</script>
</html>