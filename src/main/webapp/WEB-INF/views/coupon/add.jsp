<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<link rel="stylesheet" href="../resources/css/couponAdd.css">
<title>Insert title here</title>
</head>
<body>



<div class="couponText">
<h1>쿠폰목록</h1>
</div>

<div id="couponResult" class="container" >  <!-- 쿠폰 목록 리스트 들어갈 박스 -->
<h3>내역</h3>
</div>

<form action="./add" method="get" >
<div  class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">쿠폰이름</span>
  <input  type="text" class="form-control" placeholder="Coupon Name" aria-label="Username" aria-describedby="basic-addon1">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">쿠폰내용</span>
  <input type="text" class="form-control" placeholder="Coupon Contents" aria-label="Username" aria-describedby="basic-addon1">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">할인률  </span>
  <input type="text" class="form-control" placeholder="Discount Percent" aria-label="Username" aria-describedby="basic-addon1">
</div>

Year : <select id="select_year" onchange="javascript:lastday();"></select><br /> 
Month : <select id="select_month" onchange="javascript:lastday();"></select><br /> 
Day : <select id="select_day"></select><br /><br />

Year : <select id="select_year" onchange="javascript:lastday();"></select><br /> 
Month : <select id="select_month" onchange="javascript:lastday();"></select><br /> 
Day : <select id="select_day"></select><br /><br />


</form>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
<script type="text/javascript" src="../resources/js/couponAdd.js"></script>


</body>
</html>