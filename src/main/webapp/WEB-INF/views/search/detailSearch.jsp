<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세검색</title>
<link rel="stylesheet" href="../resources/css/detailSearch.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f927ec8d2f1aa0fb9dcced47b0904408&libraries=services"></script>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

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


	
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="../">MangoRing</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
		<ul class="navbar-nav ml-auto">
			
			<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
			<li class="nav-item active"><a href="about.html" class="nav-link">About</a></li>
			<li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li>
			<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
			<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
			<li class="nav-item cta"><a href="reservation.html" class="nav-link">Book a table</a></li>
		</ul>
		</div>
	</div>
	</nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">DetailSearch</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>DetailSearch <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

	

	<div class="container">
		<h1>조건에 맞는</h1>
		<h1>맞춤 맛집을 찾아드려요!</h1><br>
		<form action="./detailSearchResult" method="get">
			<div class="sector">
				<div class="sector-left">
					<div style="display: flex">
						<input type="text" class="form-control city" name="city" placeholder="지역">
						<button type="button" class="btn btn-info" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button>
					</div>
					<!-- 최대 검색 범위<br>
					<label>
		 				<input type="radio" name="distance" value="100"> 500m 내
		 			</label>
		 			<label>
		 				<input type="radio" name="distance" value="1000"> 1km 내
		 			</label>
		 			<label>
		 				<input type="radio" name="distance" value="2000"> 2km 내
		 			</label> -->
					<br>
					<div>
						<input type="text" class="form-control menu" id="menu" name="menu" placeholder="메뉴">
					</div><br>
					<div>
						<select class="form-select star" id="star" name="star">
				 			<option value="0">평점 순</option>
				 			<option value="1">리뷰 순</option>
			 			</select>
					</div><br>
					<div class="selectZone">
			 			<div class="custom-control custom-checkbox mb-3">
					    	<input type="checkbox" class="custom-control-input" id="customCheck1" name="kidCheck" value="1">
					    	<label class="custom-control-label" for="customCheck1">노키즈존</label>
					    </div>
					    <div class="custom-control custom-checkbox mb-3">
					    	<input type="checkbox" class="custom-control-input" id="customCheck2" name="parkingCheck" value="1">
					    	<label class="custom-control-label" for="customCheck2">주차가능</label>
					    </div>
					</div>
				</div>
				<div class="sector-right">
					<div id="map" style="width:600px;height:300px;"></div>
				</div>
			</div>
			<hr>
	 		<div class="mt-4 p-5 bg-secondary text-black rounded" style="background-color: #e7e7e7!important">
	 			<h3>음식 카테고리</h3>
	 			<c:forEach items="${categoryList}" var="li">
		 			<label>
		 				<input type="checkbox" class="mb-3" name="category" value="${li.categoryNum}"> ${li.categoryName}
		 			</label>
	 			</c:forEach>
	 		</div>
			<hr>
	 		<div class="mt-4 p-5 bg-secondary text-black rounded" style="background-color: #e7e7e7!important">
	 			<h3>#해시태그</h3>
	 			<c:forEach items="${list}" var="li">
		 			<label>
		 				<input type="checkbox" class="mb-3" name="hashtag" value="${li.tagNum}"> #${li.name}
		 			</label>
	 			</c:forEach>
	 		</div>
	 		<br>
			<button class="btn btn-outline-primary mb-2" onclick="search()">검색</button>
		</form>
	</div>


	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container-fluid px-md-5 px-3">
		  <div class="row mb-5">
			<div class="col-md-6 col-lg-3">
			  <div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Appetizer</h2>
				<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
				<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
				  <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
				  <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
				  <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
				</ul>
			  </div>
			</div>
			<div class="col-md-6 col-lg-3">
			  <div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Open Hours</h2>
				<ul class="list-unstyled open-hours">
				  <li class="d-flex"><span>Monday</span><span>9:00 - 24:00</span></li>
				  <li class="d-flex"><span>Tuesday</span><span>9:00 - 24:00</span></li>
				  <li class="d-flex"><span>Wednesday</span><span>9:00 - 24:00</span></li>
				  <li class="d-flex"><span>Thursday</span><span>9:00 - 24:00</span></li>
				  <li class="d-flex"><span>Friday</span><span>9:00 - 02:00</span></li>
				  <li class="d-flex"><span>Saturday</span><span>9:00 - 02:00</span></li>
				  <li class="d-flex"><span>Sunday</span><span> 9:00 - 02:00</span></li>
				</ul>
			  </div>
			</div>
			<div class="col-md-6 col-lg-3">
			  <div class="ftco-footer-widget mb-4">
				  <h2 class="ftco-heading-2">Newsletter</h2>
				  <p>Far far away, behind the word mountains, far from the countries.</p>
				<form action="#" class="subscribe-form">
				  <div class="form-group">
					<input type="text" class="form-control mb-2 text-center" placeholder="Enter email address">
					<input type="submit" value="Subscribe" class="form-control submit px-3">
				  </div>
				</form>
			  </div>
			</div>
			<div class="col-md-6 col-lg-3">
			   <div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Instagram</h2>
				<div class="thumb d-sm-flex">
					  <a href="#" class="thumb-menu img" style="background-image: url(images/insta-1.jpg);">
					  </a>
					  <a href="#" class="thumb-menu img" style="background-image: url(images/insta-2.jpg);">
					  </a>
					  <a href="#" class="thumb-menu img" style="background-image: url(images/insta-3.jpg);">
					  </a>
				  </div>
				  <div class="thumb d-flex">
					  <a href="#" class="thumb-menu img" style="background-image: url(images/insta-4.jpg);">
					  </a>
					  <a href="#" class="thumb-menu img" style="background-image: url(images/insta-5.jpg);">
					  </a>
					  <a href="#" class="thumb-menu img" style="background-image: url(images/insta-6.jpg);">
					  </a>
				  </div>
			  </div>
			</div>
		  </div>
		  <div class="row">
			<div class="col-md-12 text-center">
  
			  <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		  </div>
		</div>
	  </footer>
	
  
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  
  
	<script src="../js/jquery.min.js"></script>
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


	<script type="text/javascript" src="../resources/js/detailSearch.js"></script>
</body>
</html>