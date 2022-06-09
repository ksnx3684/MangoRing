<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
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
					<h1 class="mb-2 bread">My Page</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="../">Home <i
								class="ml-2 ion-ios-arrow-forward"></i></a></span> <span><a href="/member/myPage">My Page</a></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<div class="container mb-3">
		<c:choose>
	      	<c:when test="${empty member || member.memberFileVO == null}">
	      		<img src="/resources/upload/member/default_profile.png" alt="photo" width="200" height="200">
	      	</c:when>
			<c:otherwise>
				<img src="/resources/upload/member/${member.memberFileVO.fileName}" alt="photo" width="200" height="200">
			</c:otherwise>
	    </c:choose>
    </div>
	
	<div class="container">
		<div class="row">
		  <div class="col-4 text-truncate">
		    ID : ${member.id}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    NAME : ${vo.name}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    EMAIL : ${vo.email}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    PHONE : ${vo.phone}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
			<c:choose>
				<c:when test="${vo.gender == 0}">
					GENDER : 남자
				</c:when>
				<c:when test="${vo.gender == 1}">
					GENDER : 여자
				</c:when>
			</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    JOINDATE : ${vo.joinDate}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:choose>
		  		<c:when test="${vo.userType == 1}">
		  			USERTYPE : 일반회원
		  		</c:when>
		  		<c:when test="${vo.userType == 2}">
		  			USERTYPE : 가게사장
		  		</c:when>
		  		<c:when test="${vo.userType == 3}">
		  			USERTYPE : 관리자
		  		</c:when>
		  	</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:if test="${vo.userType == 2}">
		    	BUSINESSNUM : ${vo.businessNum}
		    </c:if>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    POSTCODE : ${vo.postCode}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    ADDRESS : ${vo.address}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    DETAILADDRESS : ${vo.detailAddress}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    EXTRAADDRESS : ${vo.extraAddress}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:choose>
		  		<c:when test="${vo.blackList == 0}">
		  			BLACKLIST : 정상
		  		</c:when>
		  		<c:when test="${vo.blackList == 1}">
		  			BLACKLIST : 불량회원
		  		</c:when>
		  	</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:choose>
		  		<c:when test="${vo.businessOk eq 0}">
		  			businessOk : 미신청
		  		</c:when>
		  		<c:when test="${vo.businessOk eq 1}">
		  			businessOk : 승인대기
		  		</c:when>
		  		<c:when test="${vo.businessOk eq 2}">
		  			businessOk : 승인
		  		</c:when>
		  		<c:when test="${vo.businessOk eq 4}">
		  			businessOk : 승인 거절
		  		</c:when>
		  	</c:choose>
		  	
		  </div>
		</div>
	</div>
	
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button id="wishlist" class="btn btn-primary btn-lg" type="button">위시리스트</button>
	  <button id="rating" class="btn btn-primary btn-lg" type="button">내 평점</button>
	</div>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button id="payment" class="btn btn-primary btn-lg" type="button">결제내역</button>
	  <button id="reservation" class="btn btn-primary btn-lg" type="button">예약내역</button>
	</div>
	
	<div class="container">
	  <footer class="py-3 my-4 mt-auto">
	    <ul class="nav justify-content-around border-bottom pb-3 mt-5 mb-3">
	      
	      <c:choose>
	      	<c:when test="${vo.userType eq 1 and vo.businessOk eq 0}">
	      		<li class="nav-item">
		      		<a href="./business" class="nav-link px-2 text-muted">사업자 신청</a>
		      	</li>
	      	</c:when>
	      	<c:when test="${vo.userType eq 1 and vo.businessOk eq 1}">
	      		<li class="nav-item">
		      		<a class="nav-link px-2 text-muted">사업자 신청 대기</a>
		      	</li>
	      	</c:when>
	      	<c:when test="${vo.userType eq 2}">
	      		<li class="nav-item">
		      		<a href="../owner/shop/ownerPage" class="nav-link px-2 text-muted">음식점 관리 페이지</a>
		      	</li>
	      	</c:when>
	      	<c:when test="${vo.userType eq 3}">
	      		<li class="nav-item">
		      		<a href="../manager/list" class="nav-link px-2 text-muted">관리자 페이지</a>
		      	</li>
	      	</c:when>
	      </c:choose>
	      
	      <li class="nav-item"><a href="./update" class="nav-link px-2 text-muted">회원정보수정</a></li>
	      <li class="nav-item"><a href="./delete" class="nav-link px-2 text-muted">회원탈퇴</a></li>
	    </ul>
	    <p class="text-center text-muted">&copy; 2022 MangoRing</p>
	  </footer>
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

	$("#wishlist").click(function(){
		location.href="./wishlist";
	});
	
	$("#rating").click(function(){
		location.href="./rating";
	});
	
	$("#reservation").click(function(){
		location.href="./reservation";
	});
	
	$("#payment").click(function(){
		location.href="./payment";
	});
	
</script>
</html>