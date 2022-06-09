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



<link rel="stylesheet" href="../../resources/css/ownerPage.css">
<link rel="stylesheet" href="../resources/css/resDetail.css">
</head>
<body>

    <c:import url="../../template/header.jsp"></c:import>
    <style>
        body.modal-open {
          overflow: auto;
        }
        body.modal-open[style] {
          padding-right: 0px !important;
        }
        .container{
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
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
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

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<h2 class="mb-3">A small river named Duden flows by their
						place and supplies it with the necessary regelialia.</h2>

					<h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>

					<img src="images/image_2.jpg" alt="" class="img-fluid">
					</p>




					<div class="bio mr-5">
						<img src="images/person_1.jpg" alt="Image placeholder"
							class="img-fluid mb-4">
					</div>
					<div class="desc">
						<div class="BoxMap">
							<div>
								<h1>나의 가게</h1>
								
								<div class="bigBox">
									<div id="resName">
										<div>상호명${rest.restaurantName}</div>
										<div id="change">수정</div>
									</div>
									<div id="reserPackBox">
										<c:choose>
											<c:when test="${not empty rest.restaurantPhone}">
												<a href="../shop/update?restaurantNum=${rest.restaurantNum}">수정 |</a>
											</c:when>
											<c:otherwise>
												<a href="../shop/add?restaurantNum=${rest.restaurantNum}">가게 정보 등록 |</a>
											</c:otherwise>
										</c:choose>
										<a href="../shop/delete?restaurantNum=${rest.restaurantNum}">삭제 |</a>
										<a href="../../owner/reservationManage?restaurantNum=${restaurantVO.restaurantNum}" class="tag-cloud-link">예약관리 |</a>
										<a href="../../owner/packageManage" class="tag-cloud-link">포장관리</a>
									</div>
								</div>
								







							</div>

						</div>

					</div>


 <section class="ftco-section">
    	<div class="container-fluid px-4">
    		<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Discount</span>
            <h2 class="mb-4">Promotion</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		
        	
					

<h1>프로모션</h1>
		<div class="comment-body" id="promo">
		프로모션리스트
		<c:forEach items="${listPromo }" var="listP">
		<!-- <div class="listBox"> -->
		  <div class="row">
        	<div class="col-md-6 col-lg-4 menu-wrap">
        		
        		<div class="menus d-flex ftco-animate">             
              <div class="text">
              	<div class="d-flex">
	                <div class="one-half">
	<%-- 	<h3>이름 : ${listP.promotionName } 내용 : ${listP.promotionDetail } 시작:${listP.startDate } 종료:${listP.endDate } 할인가격:${listP.discount }</h3> --%>
		<p><span>${listP.promotionDetail }</span>, <br> <span>시작:${listP.startDate }</span>,<br> <span>종료:${listP.endDate }</span></p>

					</div>
				</div>
			</div>
				</div>
				<div class="one-forth">
				
	                  <span class="price">할인가격:${listP.discount }</span>
	                  <hr>
	                </div>
			</div>
		</div>


	<!-- 	</div> -->
	
		</c:forEach>
		</div>


<div class="pt-5 mt-5" style="width: 1300px;">

					<%-- 	<div id="reviewTextBox">
							<div id="totalBox">
								<h5>리뷰 |</h5>
								<a
									href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=0&rseNum=5"><h5>전체(${count})</h5></a>
							</div>
						

							<div id="etcBox">
								<a
									href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=4&rseNum=5">
									<h5 class="tasteText">맛있어요(${goodCount }) |</h5>
								</a> <a
									href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=2&rseNum=3">
									<h5 class="tasteText">보통이에요(${normalCount }) |</h5>
								</a> <a
									href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=0&rseNum=1">
									<h5 class="tasteText">별로에요(${badCount})</h5>
								</a>
							</div>
						</div> --%>

 <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">My Stroe</span>
            <h2 class="mb-4">Review</h2>
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