<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>
<style>
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
					<h1 class="mb-2 bread">My Reservation</h1>
					
					<p class="breadcrumbs">
						<span class="mr-2"><a href="../">Home <i class="ml-2 ion-ios-arrow-forward">
						</i></a></span>
						<span><a href="/member/myPage">My Page
						<i class="ml-2 mr-2 ion-ios-arrow-forward"></i></a></span>
						<span><a href="/member/reservation">My Reservation</a></span>
					</p>
					
				</div>
			</div>
		</div>
	</section>

<c:forEach items="${reserList}" var="rl">

		<div class="container-fluid">
			<section>
				<div class="row mx-auto justify-content-center">
					<div class="col-xl-6 col-md-12 mt-5 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between p-md-1">
									<div class="d-flex flex-row">
										<div class="align-self-center">
											<c:if test="${not empty rl.restaurantFileVO.fileName}">
												<img alt="가게 사진" src="/resources/upload/restaurant/${rl.restaurantFileVO.fileName}" 
													style="width: 200px; height: 250px;"/>
											</c:if>
										</div>
										<div class="ms-3">
												<p class="mb-0">${rl.restaurantVO.address}</p>
												<h4>${rl.restaurantVO.restaurantName}</h4>
										</div>
									</div>
									<div class="align-self-center">
										<h4 class="h4 mb-0">
											<c:choose>
												<c:when test="${rl.visitStatus eq 0}">
													예약 완료
												</c:when>
												<c:when test="${rl.visitStatus eq 1}">
													방문 완료
												</c:when>
												<c:when test="${rl.visitStatus eq 2}">
													예약 취소
												</c:when>
												<c:when test="${rl.visitStatus eq 3}">
													미방문
												</c:when>
											</c:choose>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
</c:forEach>

	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="./reservation?pn=${pager.pre?pager.startNum-1:1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./reservation?pn=${i}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./reservation?pn=${pager.next?pager.lastNum+1:pager.lastNum}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
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
</html>