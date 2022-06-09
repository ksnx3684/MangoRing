<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
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
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">

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
					<h1 class="mb-2 bread">wishlist</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="../">Home <i class="ml-2 ion-ios-arrow-forward">
						</i></a></span>
						<span><a href="/member/myPage">My Page
						<i class="ml-2 mr-2 ion-ios-arrow-forward"></i></a></span>
						<span><a href="/member/wishlist">wishlist</a></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<div class="container">
		<c:forEach items="${wishList}" var="wish">
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card flex-md-row mb-4 shadow-sm h-md-250">
						<c:forEach items="${wish.restFileVO}" var="wishFile">
							<img class="card-img-right flex-auto d-none d-lg-block"
								alt="Thumbnail [200x250]"
								src="/resources/upload/restaurant/${wishFile.fileName}"
								style="width: 200px; height: 250px;">
						</c:forEach>
						<c:forEach items="${wish.restaurantVOs}" var="rest">
							<div class="card-body d-flex flex-column align-items-start">
								<div class="mb-1 text-muted small">${rest.address}</div>
								<h6 class="mb-1">
									<a class="text-dark" href="#">${rest.restaurantName}</a>
								</h6>
								<p class="card-text mb-auto">Test</p>
								<div class="align-self-end pb-3">
									<button class="btn btn-outline-danger btn-sm delete_btn"
										data-num="${wish.wishNum}" type="button">삭제</button>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="./wishlist?pn=${pager.pre?pager.startNum-1:1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link" href="./wishlist?pn=${i}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./wishlist?pn=${pager.next?pager.lastNum+1:pager.lastNum}"
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
<script type="text/javascript">

	$('.delete_btn').click(function(){
		var confirm_val = confirm("삭제하시겠습니까?");
		var wishNum = $(this).attr("data-num");
		
		console.log("wishNum : " + wishNum);
		
		// 확인을 클릭했을 때
		if(confirm_val) {
			
			$.ajax({
				url : "/member/delWishlist",
				type : "POST",
				data : {
					wishNum : wishNum
				},
				success : function(result) {
					if(result == 1) {
						location.href = "/member/wishlist";
					} else {
						alert("삭제 실패");
					}
				},
				error : function() {
					alert("에러 발생");
				}
			});
		// 취소를 클릭했을 때
		} else {
//			location.replace("/member/wishlist");
			return;
		}
		
	});
	
</script>
</html>