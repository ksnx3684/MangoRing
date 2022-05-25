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

	<h1>예약 관리 페이지</h1>
	
	<div class="container">
		<h3>예약 내역</h3>
		<div>
			<input type="date" id="startDate"> ~ <input type="date" id="endDate">
			<button type="button" id="searchBtn">검색</button>
			<select id="visitStatus">
				<option value="10">전체보기</option>
				<option value="0">예약 완료</option>
				<option value="1">방문 완료</option>
				<option value="2">예약 취소</option>
				<option value="3">미방문</option>
			</select>
		</div>
		<div id="list"></div>
		
		<h3>미방문 신고 내역</h3>
		
		<div>
			<input type="date" id="startDate2"> ~ <input type="date" id="endDate2">
			<button type="button" id="searchBtn2">검색</button>
		</div>
		<div id="list2">
		</div>
	</div>
	<input type="hidden" id="restaurantNum" value="${restaurantNum}">
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