<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

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

	<div class="row">


		<div class="col-md-4">
			<c:import url="../template/managerSide.jsp"></c:import>
		</div>
		
	<div class="col-md-8">
	
	<h1>MemberChange Detail</h1>

	<div class="member-info">
		<h5>회원 정보</h5>
		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.id}" readonly="readonly">
			</div>
		</div>

		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.name}" readonly="readonly">
			</div>
		</div>

		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.phone}" readonly="readonly">
			</div>
		</div>

		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.email}" readonly="readonly">
			</div>
		</div>
	</div>

	<div class="change-info">
		<h5>추가 정보</h5>
		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">사업자
				번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${re.restaurantVO.businessNum}" readonly="readonly">
			</div>

			<div class="row mb-3">
				<label for="colFormLabel" class="col-sm-2 col-form-label">가게 주소
					</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="colFormLabel"
						value="${re.address}" readonly="readonly">
				</div>

				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">카테고리
						</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="colFormLabel"
							value="${re.categoryNum}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">주차가능 여부
						</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="colFormLabel"
							value="${re.parkingCheck}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">키즈존 여부
						</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="colFormLabel"
							value="${re.kidCheck}" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
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