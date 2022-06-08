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

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<style type="text/css">

#box {
	border: 2px solid #D8D8D8;
	padding: 30px;
}

#orderList {
	width: 90%;
	margin: auto;
	text-align: center;
	vertical-align: middle;
	font-size: 15pt;
}

</style>
</head>
<body>
	
	<div class="container">
		<h1>포장 주문 현황</h1>
		
		<div class="row my-5">
			<h5>주문자 : ${paymentVO.memberVO.name}</h5>
			<h5>고객 연락처 : ${paymentVO.memberVO.phone}</h5>
			<h5>주문시간 : <fmt:formatDate value="${paymentVO.payDate}" pattern="yyyy년 M월 d일"/></h5>
		</div>
		<div class="row mb-5 justify-content-center text-center">
			<div class="col-8" id="box">
				<h3>주문 내역</h3>
				<table class="mt-5" id="orderList">
					<tr>
						<th>메뉴</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					
					<c:forEach items="${paymentVO.paymentDetailVOs}" var="detail">
						<tr>
							<td>${detail.menuVO.name}</td>
							<td>${detail.menuCount}</td>
							<td>
								<fmt:formatNumber value="${detail.menuVO.price}" pattern="#,###원"/>
							</td>
						</tr>
					</c:forEach>
				</table>
				<hr>
				<div class="col-12" style="text-align: right; font-size: 15pt; font-weight: bold;">
					총 <fmt:formatNumber value="${paymentVO.totalPrice}" pattern="#,###원"/>
				</div>
			</div>
		</div>
		<div class="row mb-5">
			<h3>결제 방법</h3>
			<h5>${paymentVO.payType}</h5>
		</div>
		<div class="row">
		<h3>픽업 예상 시간</h3>
			
			<form action="./waitingUpdate" method="post" id="updateFrm">
				<input type="hidden" id="payNum" name="payNum" value="${paymentVO.payNum}">
				<input type="radio" class="waiting" name="waiting" value="5"> ~5분
				<input type="radio" class="waiting" name="waiting" value="15"> ~15분
				<input type="radio" class="waiting" name="waiting" value="25"> ~25분
				<input type="radio" class="waiting" name="waiting" value="35"> ~35분
				<input type="radio" class="waiting" name="waiting" value="45"> ~45분
				<input type="radio" class="waiting" name="waiting" value="60"> ~60분
				
				<div class="my-5 text-center">
					<button type="button" id="cancelBtn" class="btn btn-outline-secondary btn-lg">주문 취소</button>
					<button type="button" id="confirmBtn" class="btn btn-primary btn-lg">주문 접수</button>
				</div>
			</form>
		</div>
	</div>
	
	
<!-- 템플릿 -->
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>

<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/aos.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>

<script src="../js/scrollax.min.js"></script>

<script src="../js/main.js"></script>
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/packageDetail.js"></script>
</body>
</html>