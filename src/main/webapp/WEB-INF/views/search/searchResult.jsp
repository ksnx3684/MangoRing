<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="../resources/css/searchResult.css">
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
            <h1 class="mb-2 bread">Result</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Result <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
	
	<div class="container">
		<c:if test="${empty list}">
			<h1>검색 결과가 없습니다</h1>
		</c:if>
		<c:forEach items="${list}" var="v">
			<div class="sector">
				<div class="sector-left">
					<img class="sector-left-img" src="../resources/upload/restaurant/${v.restaurantFileVO.fileName}">
				</div>
				<div class="sector-right">
					<span class="title">
						<a href="../restaurant/detail?">
							<h2>${v.restaurantName}</h2>
						</a>
					</span>
					<strong class="star"><h2>${v.reviewVOs[0].star}</h2></strong>
					<h4 class="address">${v.address} ${v.detailAddress} ${v.extraAddress}</h4>
				</div>
				<div id="map${v.restaurantNum}" style="width:600px;height:400px;"></div>
				<script>
					var mapContainer${v.restaurantNum} = document.getElementById('map${v.restaurantNum}'), // 지도를 표시할 div 
					    mapOption${v.restaurantNum}= {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map${v.restaurantNum} = new kakao.maps.Map(mapContainer${v.restaurantNum}, mapOption${v.restaurantNum}); 
					
					// 지도에 확대 축소 컨트롤을 생성한다
					var zoomControl = new kakao.maps.ZoomControl();
		
					// 지도의 우측에 확대 축소 컨트롤을 추가한다
					map${v.restaurantNum}.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder${v.restaurantNum} = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder${v.restaurantNum}.addressSearch('${v.address}${v.detailAddress}', function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        var coords${v.restaurantNum} = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker${v.restaurantNum} = new kakao.maps.Marker({
					            map: map${v.restaurantNum},
					            position: coords${v.restaurantNum}
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow${v.restaurantNum} = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">${v.restaurantName}</div>'
					        });
					        infowindow${v.restaurantNum}.open(map${v.restaurantNum}, marker${v.restaurantNum});
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map${v.restaurantNum}.setCenter(coords${v.restaurantNum});
					    } 
					}); 
				</script>
				<hr>
			</div>
		</c:forEach>
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


</body>
</html>