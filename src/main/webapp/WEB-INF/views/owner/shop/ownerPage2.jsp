<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet" href="../../resources/css/ownerPage.css">

<title>Insert title here</title>
</head>
<body>
	
		<h1>나의 가게 </h1>
	<div class="bigBox">
		<div id="resName">
			<div>상호명${rest.restaurantName}</div>
			<div id="change">수정</div>
		</div>
		<div id="reserPackBox">
			<div id="reser">예약관리</div>
			<div id="pack">포장관리</div>
		</div>
	</div>
		<hr>
		<h1>프로모션</h1>
		<div id="promo">
		프로모션리스트
		<c:forEach items="${listPromo }" var="listP">
		<h3>프로모션 이름 : ${listP.promotionName } 내용 : ${listP.promotionDetail } 시작:${listP.startDate } 종료:${listP.endDate } 할인가격:${listP.discount }</h3>
		
		</c:forEach>
		</div>
		<a href="../../promotion/add"  >생성</a>
		<hr>
		<h1>리뷰관리</h1>
		<div id="review">
		<c:forEach items="${list}" var="revList">
		<a href="/review/detail?reviewNum=${revList.reviewNum }"> <div class="listBox">
			<h1 class="listText">[회원 사진/ ${revList.id} 별점:${revList.star}
				내용:${revList.contents}</h1>  <div>삭제 요청</div>

		</div></a>

	</c:forEach>
		
		</div>
		

	
	
	

<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>