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
	<h1>포장 주문 현황</h1>
	
	<div class="container">
		<h5>${paymentVO.memberVO.name}</h5>
		<h5>${paymentVO.memberVO.phone}</h5>
		<h5>${paymentVO.payDate}</h5>
		<h3>주문 내역</h3>
		<table>
			<tr>
				<th>메뉴</th>
				<th>수량</th>
			</tr>
			
			<c:forEach items="${paymentVO.paymentDetailVOs}" var="detail">
				<tr>
					<td>${detail.menuVO.name}</td>
					<td>${detail.menuCount}</td>
				</tr>
			</c:forEach>
		</table>
		<h3>결제 방법</h3>
		${paymentVO.payType}
		
		<h3>픽업 예상 시간</h3>
		
		<form action="./waitingUpdate" method="post" id="updateFrm">
			<input type="hidden" id="payNum" name="payNum" value="${paymentVO.payNum}">
			<input type="radio" class="waiting" name="waiting" value="5"> ~5분
			<input type="radio" class="waiting" name="waiting" value="15"> ~15분
			<input type="radio" class="waiting" name="waiting" value="25"> ~25분
			<input type="radio" class="waiting" name="waiting" value="35"> ~35분
			<input type="radio" class="waiting" name="waiting" value="45"> ~45분
			<input type="radio" class="waiting" name="waiting" value="60"> ~60분
			
			<div>
				<button type="button" id="cancelBtn" class="btn btn-warning">취소</button>
				<button type="button" id="confirmBtn" class="btn btn-warning">접수</button>
			</div>
		</form>
		
	</div>
	
	
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/packageDetail.js"></script>
</body>
</html>