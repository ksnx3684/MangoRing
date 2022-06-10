<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>resList Page</title>
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
            <h1 class="mb-2 bread">가게 관리</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>DetailSearch <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>


	<div class="row">

			<c:import url="../template/managerSide.jsp"></c:import>
		
		
	<div class="col-md-8">
	
	
	<table class="table res-list">
		<tr>
			<td>가게번호</td>
			<td>카테고리 이름</td>
			<td>아이디</td>
			<td>가게이름</td>
		</tr>
		<c:forEach items="${resList}" var="r">
			<tr>
				<td>${r.restaurantNum}</td>
				<c:if test="${r.categoryNum eq 100}">
					<td>한식</td>
				</c:if>
				<c:if test="${r.categoryNum eq 101}">
					<td>양식</td>
				</c:if>
				<c:if test="${r.categoryNum eq 102}">
					<td>중식</td>
				</c:if>
				<c:if test="${r.categoryNum eq 103}">
					<td>일식</td>
				</c:if>
				<c:if test="${r.categoryNum eq 104}">
					<td>치킨</td>
				</c:if>
				<c:if test="${r.categoryNum eq 105}">
					<td>피자</td>
				</c:if>
				<c:if test="${r.categoryNum eq 106}">
					<td>햄버거</td>
				</c:if>
				<c:if test="${r.categoryNum eq 107}">
					<td>파스타</td>
				</c:if>
				<c:if test="${r.categoryNum eq 108}">
					<td>돈가스</td>
				</c:if>
				<c:if test="${r.categoryNum eq 109}">
					<td>족발</td>
				</c:if>
				<td>${r.id }</td>
				<td>${r.restaurantName }</td>
			</tr>
		</c:forEach>
	</table>
	
	</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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