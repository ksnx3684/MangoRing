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


<link rel="stylesheet" href="../resources/css/resDetail.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
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
            <h1 class="mb-2 bread">Restaurant</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Restaurant <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					
					<input type="hidden" id="restNum" name="restaurantNum" value="${vo1.restaurantNum}">
					<input type="hidden" id="cateNum" name="categoryNum" value="${vo.categoryNum}">

					<img src="images/image_2.jpg" alt="" class="img-fluid">
					</p>



					<div class="about-author d-flex p-4 bg-light">
						<div class="bio mr-5">
							<img src="../resources/upload/restaurant/${resFiles.fileName }"
								alt="" class="">
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

									<button type="button" class="btn btn-dark addWishlist_btn">위시리스트
										|</button>

									<a
										href="../reservation/write?restaurantNum=${vo1.restaurantNum }"
										class="tag-cloud-link">예약하기 |</a> <a href="../resNotice/list?restaurantNum=${vo1.restaurantNum }"
										class="tag-cloud-link">공지사항 |</a>
										<a href="../cart/pre?restaurantNum=${vo1.restaurantNum}"
										class="tag-cloud-link">포장하기</a>




								</div>


							</div>


						</div>

					</div>
					<div id="map" style="width: 600px; height: 400px;"></div>


					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25a21d9d0fb4d0a44acbb535edeba07e"></script>

					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.556899,
									126.919581), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 마커가 표시될 위치입니다 
						var markerPosition = new kakao.maps.LatLng(37.556499,
								126.919581);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);

						var iwContent = '<div style="padding:5px; width:150px;">${vo1.restaurantName} <br><a href="https://map.kakao.com/link/map/${vo1.restaurantName},37.556499, 126.919581" style="color:blue" target="_blank">${vo1.restaurantName}</a> <a href="https://map.kakao.com/link/to/Hello World!,37.556499, 126.919581" style="color:blue" target="_blank"><br>길찾기  </a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						iwPosition = new kakao.maps.LatLng(37.556499,
								126.919581); //인포윈도우 표시 위치입니다

						// 지도에 확대 축소 컨트롤을 생성한다
						var zoomControl = new kakao.maps.ZoomControl();

						// 지도의 우측에 확대 축소 컨트롤을 추가한다
						map.addControl(zoomControl,
								kakao.maps.ControlPosition.RIGHT);

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
							position : iwPosition,
							content : iwContent
						});

						// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow.open(map, marker);
					</script>
				</div>
				


				<div class="pt-5 mt-5" style="width: 1300px; background-color: aliceblue;">

					<div id="reviewTextBox">
						<div id="totalBox">
							<h5>리뷰 |</h5>
							<a
								href="./detail?restaurantNum=${vo1.restaurantNum }&rssNum=0&rseNum=5"><h5>전체(${count})</h5></a>
						</div>
						<div>
							<a style="background-color: darkcyan;" class="btn-primary py-3 px-5"
								href="../review/add?restaurantNum=${vo1.restaurantNum }">리뷰
								추가</a>
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
					</div>

					<c:forEach items="${list}" var="revList">

						<%-- <img onload="resize(this);"		사진? 보류중
			
								src="../resources/upload/review/${rFilesVOS.fileName}"
								class="d-block" alt="..."> --%>
						<div class="comment-body">
							<h3>${revList.id } ★:${revList.star}</h3>
							<div class="meta mb-2">${revList.regDate }</div>
							<p>
								<a href="/review/detail?reviewNum=${revList.reviewNum }">
									<div class="listBox">
										<h3 class="listText"> 
											${revList.contents}</h3>

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
	<!-- <script src="/js/google-map.js"></script> -->
	<script src="/js/main.js"></script>

</body>
<script type="text/javascript">
  $(".addWishlist_btn").click(function(){
     var restNum = $("#restNum").val();
     var cateNum = $("#cateNum").val();
     
     var data = {
        restaurantNum : restNum,
        categoryNum : cateNum
     };
     
     console.log("restaurantNum : " + restNum);
     console.log("categoryNum : " + cateNum);
     
     $.ajax({
        url : "/member/wishlist",
        type : "POST",
        data : data,
        success : function(result) {
                       
           if(result == 1) {
              alert("위시리스트 등록 완료");
           } else if (result == 2) {
              alert("이미 위시리스트에 있습니다.");
           }
           else {
              alert("로그인을 하셔야 합니다");
           }
        },
        error : function() {
           alert("등록 실패");
        }
        
     });
  });
</script>
</html>