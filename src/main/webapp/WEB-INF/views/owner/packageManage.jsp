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
</head>
<body>

	<div class="container">
		
		<div class="my-5">
			<figure>
			  <blockquote class="blockquote">
			    <h1>포장 주문 내역</h1>
			  </blockquote>
			  <figcaption class="blockquote-footer">
			    포장 주문 현황 및 손님의 방문 상태를 확인하고 관리 할 수 있습니다.
			  </figcaption>
			</figure>
		</div>
		
		<div class="mt-5 mb-3">
			<form action="./packageManage" method="get" id="searchFrm">
				<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
				<button type="button" class="btn btn-outline-dark btn-sm" id="searchBtn">검색</button>
			</form>
		</div>
		
		<table class="table" style="text-align: center; vertical-align: middle;">
			<tr>
				<th>번호</th>
				<th>주문자</th>
				<th>아이디</th>
				<th>주문 일시</th>
				<th>메뉴</th>
				<th>수량</th>
				<th>상태</th>
				<th>예상 시간</th>
				<th></th>
			</tr>
			<c:forEach items="${packageList}" var="order" varStatus="status">
				<tr>
					<td>${fn:length(packageList) - status.index}</td>
					<td>${order.memberVO.name}</td>
					<td>${order.id}</td>
					<td>
						<fmt:formatDate value="${order.payDate}" pattern="yyyy년 M월 d일"/>
					</td>
					<td>
						<c:forEach items="${order.paymentDetailVOs}" var="detail">
							${detail.menuVO.name} <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach items="${order.paymentDetailVOs}" var="detail">
							${detail.menuCount} <br>
						</c:forEach>
					</td>
					<td>
						<c:choose>
							<c:when test="${order.status eq 1}">
								방문 대기
								<button type="button" class="btn btn-primary visitBtn" data-num="${order.payNum}">방문 완료</button>
							</c:when>
							<c:when test="${order.status eq 2}">
								주문 취소
							</c:when>
							<c:when test="${order.status eq 3}">
								방문 완료
							</c:when>
						</c:choose>
					
					</td>
					<td>
						<c:choose>
							<c:when test="${order.waiting eq 0}">
								예상 시간을 설정해주세요.
							</c:when>
							<c:otherwise>
								${order.waiting}분
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:if test="${order.status eq 1}">						
							<a class="btn btn-primary" href="./packageDetail?payNum=${order.payNum}">상세 보기</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="row mt-5 justify-content-center">
			<div class="col-3">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			    <c:choose>
			    	<c:when test="${empty pager.startDate and empty pager.endDate}">
			    		<a class="page-link" href="./packageManage?pn=${pager.pre?pager.startNum-1:1}&restaurantNum=${pager.restaurantNum}" aria-label="Previous">
				    		<span aria-hidden="true">&laquo;</span>
					    </a>
			    	</c:when>
			    	<c:otherwise>
			    		<a class="page-link" href="./packageManage?pn=${pager.pre?pager.startNum-1:1}&restaurantNum=${pager.restaurantNum}&startDate=${pager.startDate}&endDate=${pager.endDate}" aria-label="Previous">
					    	<span aria-hidden="true">&laquo;</span>
					    </a>
			    	</c:otherwise>
			    </c:choose>

			    </li>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<c:choose>
			    		<c:when test="${pager.pn eq i}">
			    			<c:choose>
			    				<c:when test="${empty pager.startDate and empty pager.endDate}">
			    					<li class="page-item active" aria-current="page">
								      <a class="page-link" href="./packageManage?pn=${i}">${i}</a>
								    </li>
			    				</c:when>
			    				<c:otherwise>
					    			<li class="page-item active" aria-current="page">
								      <a class="page-link" href="./packageManage?pn=${i}&startDate=${pager.startDate}&endDate=${pager.endDate}">${i}</a>
								    </li>
			    				</c:otherwise>
			    			</c:choose>
			    		</c:when>
			    		<c:otherwise>
			    			<c:choose>
						    	<c:when test="${empty pager.startDate and empty pager.endDate}">
						    		<li class="page-item"><a class="page-link" href="./packageManage?pn=${i}">${i}</a></li>
						    	</c:when>
						    	<c:otherwise>
						    		<li class="page-item"><a class="page-link" href="./packageManage?pn=${i}&startDate=${pager.startDate}&endDate=${pager.endDate}">${i}</a></li>
						    	</c:otherwise>
						    </c:choose>
			    		</c:otherwise>
			    	</c:choose>
			    </c:forEach>
			    <li class="page-item">
			    	<c:choose>
			    	<c:when test="${empty pager.startDate and empty pager.endDate}">
			    		<a class="page-link" href="./packageManage?pn=${pager.next?pager.lastNum+1:pager.lastNum}" aria-label="Previous">
				    		<span aria-hidden="true">&raquo;</span>
					    </a>
			    	</c:when>
			    	<c:otherwise>
			    		<a class="page-link" href="./packageManage?pn=${pager.next?pager.lastNum+1:pager.lastNum}&startDate=${pager.startDate}&endDate=${pager.endDate}" aria-label="Previous">
					    	<span aria-hidden="true">&raquo;</span>
					    </a>
			    	</c:otherwise>
			    </c:choose>
			    </li>
			  </ul>
			</nav>
			</div>
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

<script type="text/javascript" src="../resources/js/packageManage.js"></script>

</body>
</html>