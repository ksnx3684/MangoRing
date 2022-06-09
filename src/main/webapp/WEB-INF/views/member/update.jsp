<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>
<style>
	body.modal-open {
		overflow: auto;
	}
	
	body.modal-open[style] {
		padding-right: 0px !important;
	}
	
	.container {
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
				
				<h1 class="mb-2 bread">회원정보 수정</h1>
				</div>
			</div>
		</div>
	</section>
	
	<div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <div class="card mt-3" style="border-radius: 15px;">
          <div class="card-body">
<!-- <form:form modelAttribute="memberVO" method="POST"> -->
			<form action="./update" method="POST">			
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">이름</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <input type="text" name="name" class="form-control form-control-lg" value="${vo.name}"/>
<!--  	          	<form:input path="name" cssClass="form-control form-control-lg" value="${vo.name}"/>
	              </div>
	              	<div class="col-md-3 ps-5">
	              		<form:errors path="name"></form:errors>
-->	
	              	</div>
	            </div>
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">전화번호</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <input type="text" name="phone" class="form-control form-control-lg" value="${vo.phone}"/>
<!--  	            <form:input path="phone" cssClass="form-control form-control-lg"/>
	              </div>
	              <div class="col-md-3 ps-5">
	              	<form:errors path="phone"></form:errors>
-->
	              </div>
	            </div>
	
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">이메일</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <input type="email" name="email" class="form-control form-control-lg" value="${vo.email}"/>
<!--  	          	<form:input path="email" cssClass="form-control form-control-lg"/> -->
	              </div>
<!--  	              <div class="col-md-3 ps-5">
	              	<form:errors path="email"></form:errors>
	              </div>
-->
	            </div>
			
            <hr class="mx-n3">
            
            	<div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">주소</h6>
	              </div>
	              <div class="col-md-8 pe-3">
	                <div class="input-group mb-3">
		                <input type="text" id="address" name="address" class="form-control form-control-lg" value="${vo.address}"
		                	readonly="readonly"/>
		                <button type="button" id="search" class="btn btn-outline-secondary">주소 검색</button>
	                </div>
	                
	                <div class="col-md-10 pe-2 mb-3">
	                	<input type="text" id="postCode" name="postCode" class="form-control form-control-lg" value="${vo.postCode}"
	                		readonly="readonly"/>
	                </div>
	                <div class="col-md-10 pe-2 mb-3">
	                	<div class="input-group">
		                	<input type="text" id="detailAddress" name="detailAddress" class="form-control form-control-lg me-4" value="${vo.detailAddress}"
		                		placeholder="상세주소"/>
		                	<input type="text" id="extraAddress" name="extraAddress" class="form-control form-control-lg" value="${vo.extraAddress}"
		                		readonly="readonly"/>
	                	</div>
	                </div>
	                <div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
	              </div>
	            </div>
			
            <hr class="mx-n3">

	            <div class="px-5 py-4 text-center">
	              <button type="submit" class="btn btn-primary btn-lg">수정하기</button>
	            </div>
            <!-- </form:form> -->
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
	
<c:import url="../template/cdn_script.jsp"></c:import>
<!-- KaKaoMap -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0302b66d0992062d842011c6439a7b9&libraries=services"></script>

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
<script type="text/javascript" src="../resources/js/map_search.js"></script>
</html>