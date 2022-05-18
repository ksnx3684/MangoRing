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
<link rel="stylesheet" href="../resources/css/resDetail.css">

<title>Insert title here</title>
</head>
<body>
	<div class="restaurantTitle">
		<h1>식 당 Detail</h1>
	</div>

	<div id="respicBox">

		<!-- 사진 등록 할 박스 -->

		<div class="foodPicsBox">
			<h1>가게 및 음식 사진</h1>
		</div>
		<div class="foodPicsBox">
			<h1>가게 및 음식 사진</h1>
		</div>
		<div class="foodPicsBox">
			<h1>가게 및 음식 사진</h1>
		</div>
	</div>

	<div class="BoxMap">
		<div>
			<h1 class="infoRes">${vo1.restaurantName }</h1>


			<h1 class="infoRes">
				★${review.star }<br>
			</h1>
			<hr>
			<h1 class="infoRes">
				주소 : ${vo1.address }<br>
			</h1>
			<h1 class="infoRes">
				음식종류 : ${vo.categoryName }<br>
			</h1>
			<!-- 1이면 주차 가능 0 이면 주차 불가능 -->
			<c:if test="${vo1.parkingCheck eq 1 }">
				<h1 class="infoRes">
					주차 : 주차 가능<br>
				</h1>
			</c:if>
			<c:if test="${vo1.parkingCheck eq 0 }">
				<h1 class="infoRes">
					주차 : 주차 불가능<br>
				</h1>
			</c:if>

			<h1 class="infoRes">
				메뉴 조인 필요<br>
			</h1>
		</div>




		<div id="map" style="width: 500px; height: 400px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25a21d9d0fb4d0a44acbb535edeba07e"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(37.556899, 126.919581),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);

			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(37.556899, 126.919581), // 마커의 좌표
				map : map
			// 마커를 표시할 지도 객체
			});
			marker.setMap(map);
		</script>

	</div>


	<h3>한줄 식당 소개 : ${vo1.introduction }</h3>
	<h3 id="edit">업데이트 : ${vo1.editDate }</h3>
	<hr>
	<div id="reviewTextBox">
		<div id="totalBox"> <h5>리뷰(${count})</h5> </div> <div id="etcBox"> <h5 class="tasteText"> 맛있어요(${goodCount }) |</h5> <h5 class="tasteText"> 보통이에요(${normalCount }) |</h5><h5 class="tasteText"> 별로에요(${badCount})</h5></div>
	</div>
	<c:forEach items="${list}" var="revList">
		<div class="listBox">
			<h1 class="listText">[회원 사진/ ID추가] 별점:${revList.star}
				내용:${revList.contents}</h1>
				
		</div>

	</c:forEach>



</body>
</html>