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
		<form role="form" action="/member/wishlist" method="POST">
			<input type="hidden" id="restNum" name="restaurantNum" value="${vo1.restaurantNum}">
			<input type="hidden" id="cateNum" name="categoryNum" value="${vo.categoryNum}">	
		</form>
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
				메뉴 :
				<c:forEach items="${menu}" var="menus">
				 ${menus.name} ${menus.price}원<br>
				</c:forEach>
			</h1>
			
			<button type="button" class="btn btn-dark addWishlist_btn">위시리스트</button>
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
		<div id="totalBox">
			<h5>리뷰 |</h5>
			<a href="./detail?rssNum=0&rseNum=5"><h5>전체(${count})</h5></a>
		</div>
		<div id="etcBox">
			<a href="./detail?rssNum=4&rseNum=5">
				<h5 class="tasteText">맛있어요(${goodCount }) |</h5>
			</a> <a href="./detail?rssNum=2&rseNum=3">
				<h5 class="tasteText">보통이에요(${normalCount }) |</h5>
			</a> <a href="./detail?rssNum=0&rseNum=1">
				<h5 class="tasteText">별로에요(${badCount})</h5>
			</a>
		</div>
	</div>
	<c:forEach items="${list}" var="revList">
		<a href="/review/detail?reviewNum=${revList.reviewNum }"> <div class="listBox">
			<h1 class="listText">[회원 사진/ ID추가] 별점:${revList.star}
				내용:${revList.contents}</h1>

		</div></a>

	</c:forEach>
	
	

<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
<script type="text/javascript">
	$(".addWishlist_btn").click(function(){
		var restNum = $("#restNum").val();
		var cateNum = $("#cateNum").val();
		
		var data = {
			restaurantNum : restNum,
			categoryNum : cateNum
		};
		
		console.log("restaurantNum : " + restNum);
		console.log("categoryNum : " + cateNum);
		
		$.ajax({
			url : "/member/wishlist",
			type : "POST",
			data : data,
			success : function(result) {
								
				if(result == 1) {
					alert("위시리스트 등록 완료");
				} else if (result == 2) {
					alert("이미 위시리스트에 있습니다.");
				}
				else {
					alert("로그인을 하셔야 합니다");
				}
			},
			error : function() {
				alert("등록 실패");
			}
			
		});
	});
</script>
</html>