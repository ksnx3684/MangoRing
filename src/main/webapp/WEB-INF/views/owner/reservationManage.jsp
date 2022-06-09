<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
<title>Insert title here</title>
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
	
	<!-- 템플릿 -->
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
            <h1 class="mb-2 bread">예약 관리 페이지</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="./shop/ownerPage">가게 관리 페이지 <i class="ion-ios-arrow-forward"></i></a></span> <span>예약 관리 페이지</span></p>
          </div>
        </div>
      </div>
    </section>
	
	
	<div class="container">
		<div class="my-5">
			<figure>
			  <blockquote class="blockquote">
			    <h1>예약 관리 페이지</h1>
			  </blockquote>
			  <figcaption class="blockquote-footer">
			    예약 현황 및 손님의 방문 상태를 확인하고 관리 할 수 있습니다.
			  </figcaption>
			</figure>
		</div>
		<h3>예약 내역</h3>
		<div class="mt-5 mb-3">
			<select id="visitStatus">
				<option value="10">전체보기</option>
				<option value="0">예약 완료</option>
				<option value="1">방문 완료</option>
				<option value="2">예약 취소</option>
				<option value="3">미방문</option>
			</select>
			<input type="date" id="startDate"> ~ <input type="date" id="endDate">
			<button type="button" class="btn btn-outline-dark btn-sm" id="searchBtn">검색</button>
		</div>
		<div id="list" class="mb-5"></div>
		
		<h3>미방문 신고 내역</h3>
		
		<div class="mt-5 mb-3">
			<input type="date" id="startDate2"> ~ <input type="date" id="endDate2">
			<button type="button" class="btn btn-outline-dark btn-sm" id="searchBtn2">검색</button>
		</div>
		<div id="list2">
		</div>
	</div>
	<input type="hidden" id="restaurantNum" value="${restaurantNum}">

<!-- 템플릿 -->
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

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/reservationManage.js"></script>
<script type="text/javascript">
	getList(${restaurantNum});
	getReportList(${restaurantNum});
</script>
</body>
</html>