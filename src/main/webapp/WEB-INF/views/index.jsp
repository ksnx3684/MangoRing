<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>MangoRing</title>
<c:import url="./template/bootstrap_css.jsp"></c:import>
    <%-- <c:import url="./template/mango_header.jsp"></c:import> --%>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="../resources/css/index.css">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container" style="padding-top: 50px; padding-bottom: 50px;">
	      <a class="navbar-brand" href="/">MangoRing</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item active"><a href="./search/detailSearch" class="nav-link">상세검색</a></li>
	        	<c:choose>
	        		<c:when test="${not empty member}">
                		<!-- <li class="nav-item"><a href="./cart/cartList" class="nav-link">장바구니</a></li> -->
	        			<li class="nav-item"><a href="./member/myPage" class="nav-link">마이페이지</a></li>
                		<li class="nav-item"><a href="./member/logout" class="nav-link">로그아웃</a></li>
	        		</c:when>
		        	<c:otherwise>
		        		<li class="nav-item"><a href="./member/login" class="nav-link">로그인</a></li>
		        	</c:otherwise>
	        	</c:choose>
	        	
	        	<!-- <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	          <li class="nav-item cta"><a href="reservation.html" class="nav-link">Book a table</a></li> -->
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

 
    <section class="home-slider owl-carousel js-fullheight">
      <div class="slider-item js-fullheight" style="background-image: url(images/bg_1.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 col-sm-12 text-center ftco-animate">
              <h1 class="mb-4 mt-5"> yuum </h1>
              <p><a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a> <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a></p>
            </div>

          </div>
        </div>
      </div>

      <div class="slider-item js-fullheight" style="background-image: url(images/bg_2.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 col-sm-12 text-center ftco-animate">
              <h1 class="mb-4 mt-5">The Best Place to Kick of Your Day</h1>
              <p><a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a> <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a></p>
            </div>

          </div>
        </div>
      </div>

      <div class="slider-item js-fullheight" style="background-image: url(images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 col-sm-12 text-center ftco-animate">
              <h1 class="mb-4 mt-5">Creamy Hot and Ready to Serve</h1>
              <p><a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a> <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a></p>
            </div>

          </div>
        </div>
      </div>
    </section>
    
    <div class="row d-flex justify-content-center mt-100">
	    <div class="col-md-4">
		    <form class="flex-nowrap col ml-auto footer-subscribe p-0" action="/search/result" method="get">
				<div class="container mainSearch">
					<input type="hidden" name="address" value="">
					<input type="text" class="form-control searchBox" placeholder="원하는 키워드로 검색해 보세요!" name="name">
					<input type="hidden" name="star" value="0">
					<button class="btn search">검색</button>
				</div>
			</form>
			<a href="../cart/pre?restaurantNum=1">aa</a>
		</div>
	</div>

		<c:forEach items="${prolist}" var="list">
			${list.restaurantName}
		</c:forEach>

    <section class="ftco-section">
    	<div class="container-fluid px-4">
    		<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Specialties</span>
            <h2 class="mb-4">Promotion</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		<div class="heading-menu text-center ftco-animate">
        			<h3>Seoul</h3>
        		</div>
        		<c:forEach items="${seoul}" var="list">
        			<a href="./restaurant/detail?restaurantNum=${list.restaurantNum}">
		        		<div class="menus d-flex ftco-animate">
			              <div class="menu-img img" style="background-image: url(images/breakfast-1.jpg);"></div>
			              <div class="text">
			              	<div class="d-flex">
				                <div class="one-half">
				                  <h3>${list.restaurantName}</h3>
				                </div>
				                <div class="one-forth">
				                  <span class="price">${list.reviewVOs[0].star}</span>
				                </div>
				              </div>
				              <p><span>${list.address}</span></p>
			              </div>
			            </div>
		            </a>
	            </c:forEach> 
	        </div>
	
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		<div class="heading-menu text-center ftco-animate">
        			<h3>Busan</h3>
        		</div>
        		<c:forEach items="${busan}" var="list">
        			<a href="./restaurant/detail?restaurantNum=${list.restaurantNum}">
		        		<div class="menus d-flex ftco-animate">
			              <div class="menu-img img" style="background-image: url(images/lunch-1.jpg);"></div>
			              <div class="text">
			              	<div class="d-flex">
				                <div class="one-half">
				                  <h3>${list.restaurantName}</h3>
				                </div>
				                <div class="one-forth">
				                  <span class="price">${list.reviewVOs[0].star}</span>
				                </div>
				              </div>
				              <p><span>${list.address}</span></p>
			              </div>
			            </div>
		            </a>
	            </c:forEach>
        	</div>
	
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		<div class="heading-menu text-center ftco-animate">
        			<h3>Incheon</h3>
        		</div>
        		<c:forEach items="${incheon}" var="list">
        			<a href="./restaurant/detail?restaurantNum=${list.restaurantNum}">
		        		<div class="menus d-flex ftco-animate">
			              <div class="menu-img img" style="background-image: url(images/dinner-1.jpg);"></div>
			              <div class="text">
			              	<div class="d-flex">
				                <div class="one-half">
				                  <h3>${list.restaurantName}</h3>
				                </div>
				                <div class="one-forth">
				                  <span class="price">${list.reviewVOs[0].star}</span>
				                </div>
				              </div>
				              <p><span>${list.address}</span></p>
			              </div>
		            	</div>
	            	</a>
            	</c:forEach>
        	</div>
	
	        	<!--  -->
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		<div class="heading-menu text-center ftco-animate">
        			<h3>Daegu</h3>
        		</div>
        		<c:forEach items="${daegu}" var="list">
        			<a href="./restaurant/detail?restaurantNum=${list.restaurantNum}">
		        		<div class="menus d-flex ftco-animate">
			              <div class="menu-img img" style="background-image: url(images/dessert-1.jpg);"></div>
			              <div class="text">
			              	<div class="d-flex">
				                <div class="one-half">
				                  <h3>${list.restaurantName}</h3>
				                </div>
				                <div class="one-forth">
				                  <span class="price">${list.reviewVOs[0].star}</span>
				                </div>
				              </div>
				              <p><span>${list.address}</span></p>
			              </div>
			            </div>
		            </a>
            	</c:forEach>
        	</div>
        	
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		<div class="heading-menu text-center ftco-animate">
        			<h3>Daejeon</h3>
        		</div>
        		<c:forEach items="${daejeon}" var="list">
        			<a href="./restaurant/detail?restaurantNum=${list.restaurantNum}">
		        		<div class="menus d-flex ftco-animate">
			              <div class="menu-img img" style="background-image: url(images/wine-1.jpg);"></div>
			              <div class="text">
			              	<div class="d-flex">
				                <div class="one-half">
				                  <h3>${list.restaurantName}</h3>
				                </div>
				                <div class="one-forth">
				                  <span class="price">${list.reviewVOs[0].star}</span>
				                </div>
				              </div>
				              <p><span>${list.address}</span></p>
			              </div>
			            </div>
		            </a>
            	</c:forEach>
        	</div>

        	<div class="col-md-6 col-lg-4 menu-wrap">
        		<div class="heading-menu text-center ftco-animate">
        			<h3>Gwangju</h3>
        		</div>
        		<c:forEach items="${gwangju}" var="list">
        			<a href="./restaurant/detail?restaurantNum=${list.restaurantNum}">
	        			<div class="menus d-flex ftco-animate">
			              <div class="menu-img img" style="background-image: url(images/drink-1.jpg);"></div>
			              <div class="text">
			              	<div class="d-flex">
				                <div class="one-half">
				                  <h3>${list.restaurantName}</h3>
				                </div>
				                <div class="one-forth">
				                  <span class="price">${list.reviewVOs[0].star}</span>
				                </div>
				              </div>
				              <p><span>${list.address}</span></p>
			              </div>
			            </div>
		            </a>
	            </c:forEach>
	        	</div>
	        </div>
	    	</div>
	   </section>
    
    
<footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container-fluid px-md-5 px-3">
        <div class="row mb-5">
          <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">MangoRing</h2>
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
              <h2 class="ftco-heading-2">Notice</h2>
              <ul class="list-unstyled open-hours">
              	<li class="d-flex"><a href="./notice/list"><span>공지사항</span></a></li>
              	<li class="d-flex"><span>회사 소개</span></li>
              	<li class="d-flex"><span>광고 문의</span></li>
              	<li class="d-flex"><span>투자 정보</span></li>
                <li class="d-flex"><span>이용약관</span></li>
                <li class="d-flex"><span>개인정보처리방침</span></li>
                <li class="d-flex"><span>위치기반서비스 이용약관</span></li>
                <li class="d-flex"><span>커뮤니티 가이드라인</span></li>
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


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>


<%-- 
	<a href="./reservation/write?restaurantNum=7">예약하기</a>
	

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
	</form> --%>

	<!-- Option 1: Bootstrap Bundle with Popper -->
<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script> -->
</body>
</html>