<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Appetizer - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Monoton&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">

<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">

<link rel="stylesheet" href="/css/aos.css">

<link rel="stylesheet" href="/css/ionicons.min.css">

<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/css/jquery.timepicker.css">


<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/icomoon.css">
<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet" href="../resources/css/resDetail.css">
</head>
<body>
	<div class="py-1 bg-black top">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">+ 1235 2355 98</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">youremail@email.com</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
							<p class="mb-0 register-link">
								<span>Open hours:</span> <span>Monday - Sunday</span> <span>8:00AM
									- 9:00PM</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Appetizer</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li>
					<li class="nav-item active"><a href="blog.html"
						class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
					<li class="nav-item cta"><a href="reservation.html"
						class="nav-link">Book a table</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">Blog</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
							href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog
							Single<i class="ion-ios-arrow-forward"></i>
						</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<h2 class="mb-3">A small river named Duden flows by their
						place and supplies it with the necessary regelialia.</h2>
				
					<h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>
				
						<img src="images/image_2.jpg" alt="" class="img-fluid">
					</p>
				
					

					<div class="about-author d-flex p-4 bg-light">
						<div class="bio mr-5">
							<img src="images/person_1.jpg" alt="Image placeholder"
								class="img-fluid mb-4">
						</div>
						<div class="desc">
								<div class="BoxMap">
		<div>
			<h1 class="infoRes">${vo1.restaurantName }</h1>


			<h1 class="infoRes">
				★${review.star }<br>
			</h1>
			<hr>
			<h1 class="infoRes">
				주소 : ${vo1.address }<br>
			</h1>
			<h1 class="infoRes">
				음식종류 : ${vo.categoryName }<br>
			</h1>
			<!-- 1이면 주차 가능 0 이면 주차 불가능 -->
			<c:if test="${vo1.parkingCheck eq 1 }">
				<h1 class="infoRes">
					주차 : 주차 가능<br>
				</h1>
			</c:if>
			<c:if test="${vo1.parkingCheck eq 0 }">
				<h1 class="infoRes">
					주차 : 주차 불가능<br>
				</h1>
			</c:if>
		
			<h1 class="infoRes">
				메뉴 :
				<c:forEach items="${menu}" var="menus">
				 ${menus.name} ${menus.price}원<br>
				</c:forEach>
			</h1>
			
			<button type="button" class="btn btn-dark addWishlist_btn">위시리스트 |</button>
		
		<a href="../reservation/write?restaurantNum=${vo1.restaurantNum }"
								class="tag-cloud-link">예약하기 |</a>
								<a href="../resNotice/list"
								class="tag-cloud-link">공지사항</a>
		</div>

		</div>
		<div id="map" style="width: 500px; height: 400px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25a21d9d0fb4d0a44acbb535edeba07e"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(37.556899, 126.919581),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);

			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(37.556899, 126.919581), // 마커의 좌표
				map : map
			// 마커를 표시할 지도 객체
			});
			marker.setMap(map);
		</script>

	</div>
						</div>
					</div>


					<div class="pt-5 mt-5" style="width:1300px;">

<div id="reviewTextBox">
		<div id="totalBox">
			<h5>리뷰 |</h5>
			<a href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=0&rseNum=5"><h5>전체(${count})</h5></a>
		</div>
		<div>
		<a class="btn-primary py-3 px-5" href="../review/add?restaurantNum=${vo1.restaurantNum }">리뷰 추가${vo1.restaurantNum }</a>
		</div>
		
		<div id="etcBox">
			<a href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=4&rseNum=5">
				<h5 class="tasteText">맛있어요(${goodCount }) |</h5>
			</a> <a href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=2&rseNum=3">
				<h5 class="tasteText">보통이에요(${normalCount }) |</h5>
			</a> <a href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=0&rseNum=1">
				<h5 class="tasteText">별로에요(${badCount})</h5>
			</a>
		</div>
	</div>

						<c:forEach items="${list}" var="revList">

							<%-- <img onload="resize(this);"		사진? 보류중
			
								src="../resources/upload/review/${rFilesVOS.fileName}"
								class="d-block" alt="..."> --%>
							<div class="comment-body">
								<h3>${revList.id }</h3>
								<div class="meta mb-2">${revList.regDate }</div>
								<p>
									<a href="/review/detail?reviewNum=${revList.reviewNum }">
										<div class="listBox">
											<h3 class="listText">[회원 사진/ ID추가] 별점:${revList.star}
												내용:${revList.contents}</h3>

										</div>
									</a>
								</p>
							</div>
							<p>
								<a href="/review/detail?reviewNum=${revList.reviewNum }"
									class="reply">Detail</a>
							</p>
							<hr>
						</c:forEach>
					</div>





					<!-- END comment-list -->


				</div>
			</div>
			<!-- .col-md-8 -->

			<div class="col-lg-4 sidebar ftco-animate">
				<div class="sidebar-box">
					<form action="#" class="search-form">
						<div class="form-group">
							<span class="icon icon-search"></span> <input type="text"
								class="form-control" placeholder="Type a keyword and hit enter">
						</div>
					</form>
				</div>
				<div class="sidebar-box ftco-animate">
					<h3>Category</h3>
					<ul class="categories">
						<li><a href="#">Breakfast <span>(6)</span></a></li>
						<li><a href="#">Lunch <span>(8)</span></a></li>
						<li><a href="#">Dinner <span>(2)</span></a></li>
						<li><a href="#">Desserts <span>(2)</span></a></li>
						<li><a href="#">Drinks <span>(2)</span></a></li>
						<li><a href="#">Wine <span>(2)</span></a></li>
					</ul>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Popular Articles</h3>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(images/image_1.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> June 25,
										2019</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Dave Lewis</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(images/image_2.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> June 25,
										2019</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Dave Lewis</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(images/image_3.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> June 25,
										2019</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Dave Lewis</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Tag Cloud</h3>
					<ul class="tagcloud m-0 p-0">
						<a href="#" class="tag-cloud-link">Dish</a>
						<a href="#" class="tag-cloud-link">Food</a>
						<a href="#" class="tag-cloud-link">Lunch</a>
						<a href="#" class="tag-cloud-link">Menu</a>
						<a href="#" class="tag-cloud-link">Dessert</a>
						<a href="#" class="tag-cloud-link">Drinks</a>
						<a href="#" class="tag-cloud-link">Sweets</a>
					</ul>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Archives</h3>
					<ul class="categories">
						<li><a href="#">January 2019 <span>(20)</span></a></li>
						<li><a href="#">December 2018 <span>(30)</span></a></li>
						<li><a href="#">Novemmber 2018 <span>(20)</span></a></li>
						<li><a href="#">September 2018 <span>(6)</span></a></li>
						<li><a href="#">August 2018 <span>(8)</span></a></li>
					</ul>
				</div>


				<div class="sidebar-box ftco-animate">
					<h3>Paragraph</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Ducimus itaque, autem necessitatibus voluptate quod mollitia
						delectus aut, sunt placeat nam vero culpa sapiente consectetur
						similique, inventore eos fugit cupiditate numquam!</p>
				</div>
			</div>
			<!-- END COL -->
		</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container-fluid px-md-5 px-3">
			<div class="row mb-5">
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Appetizer</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Open Hours</h2>
						<ul class="list-unstyled open-hours">
							<li class="d-flex"><span>Monday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Tuesday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Wednesday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Thursday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Friday</span><span>9:00 -
									02:00</span></li>
							<li class="d-flex"><span>Saturday</span><span>9:00 -
									02:00</span></li>
							<li class="d-flex"><span>Sunday</span><span> 9:00 -
									02:00</span></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<form action="#" class="subscribe-form">
							<div class="form-group">
								<input type="text" class="form-control mb-2 text-center"
									placeholder="Enter email address"> <input type="submit"
									value="Subscribe" class="form-control submit px-3">
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Instagram</h2>
						<div class="thumb d-sm-flex">
							<a href="#" class="thumb-menu img"
								style="background-image: url(images/insta-1.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-2.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-3.jpg);"> </a>
						</div>
						<div class="thumb d-flex">
							<a href="#" class="thumb-menu img"
								style="background-image: url(images/insta-4.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-5.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-6.jpg);"> </a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/jquery.stellar.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/aos.js"></script>
	<script src="/js/jquery.animateNumber.min.js"></script>
	<script src="/js/bootstrap-datepicker.js"></script>
	<script src="/js/jquery.timepicker.min.js"></script>
	<script src="/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/js/google-map.js"></script>
	<script src="/js/main.js"></script>

</body>
</html>