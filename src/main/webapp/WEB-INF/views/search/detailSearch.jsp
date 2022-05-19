<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세검색</title>
<link rel="stylesheet" href="../resources/css/detailSearch.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f927ec8d2f1aa0fb9dcced47b0904408&libraries=services"></script>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h1>조건에 맞는</h1>
		<h1>맞춤 맛집을 찾아드려요!</h1><br>
		<form action="./detailSearchResult" method="get">
			<div class="sector">
				<div class="sector-left">
					<div style="display: flex">
						<input type="text" class="form-control city" name="city" placeholder="지역">
						<button type="button" class="btn btn-info" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button>
					</div>
					<!-- 최대 검색 범위<br>
					<label>
		 				<input type="radio" name="distance" value="100"> 500m 내
		 			</label>
		 			<label>
		 				<input type="radio" name="distance" value="1000"> 1km 내
		 			</label>
		 			<label>
		 				<input type="radio" name="distance" value="2000"> 2km 내
		 			</label> -->
					<br>
					<div>
						<input type="text" class="form-control menu" id="menu" name="menu" placeholder="메뉴">
					</div><br>
					<div>
						<select class="form-select star" id="star" name="star">
				 			<option value="0">평점 순</option>
				 			<option value="1">리뷰 순</option>
			 			</select>
					</div><br>
					<div class="selectZone">
			 			<div class="custom-control custom-checkbox mb-3">
					    	<input type="checkbox" class="custom-control-input" id="customCheck1" name="kidCheck" value="1">
					    	<label class="custom-control-label" for="customCheck1">노키즈존</label>
					    </div>
					    <div class="custom-control custom-checkbox mb-3">
					    	<input type="checkbox" class="custom-control-input" id="customCheck2" name="parkingCheck" value="1">
					    	<label class="custom-control-label" for="customCheck2">주차가능여부</label>
					    </div>
					</div>
				</div>
				<div class="sector-right">
					<div id="map" style="width:600px;height:300px;"></div>
				</div>
			</div>
			<hr>
	 		<div class="mt-4 p-5 bg-secondary text-black rounded" style="background-color: #e7e7e7!important">
	 			<h3>#해시태그</h3>
	 			<c:forEach items="${list}" var="li">
		 			<label>
		 				<input type="checkbox" class="mb-3" name="hashtag" value="${li.tagNum}"> #${li.name}
		 			</label>
	 			</c:forEach>
	 		</div>
	 		<br>
			<button class="btn btn-outline-primary mb-2" onclick="search()">검색</button>
		</form>
	</div>
<script type="text/javascript" src="../resources/js/detailSearch.js"></script>
</body>
</html>