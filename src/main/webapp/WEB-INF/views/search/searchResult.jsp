<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="../resources/css/searchResult.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f927ec8d2f1aa0fb9dcced47b0904408&libraries=services"></script>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<c:if test="${empty list}">
		<h1>검색 결과가 없습니다</h1>
	</c:if>
	<c:forEach items="${list}" var="v">
		<div class="sector">
			<div class="sector-left">
				<img class="sector-left-img" src="../resources/upload/restaurant/${v.restFileVO.fileName}">
			</div>
			<div class="sector-right">
				<span class="title">
					<a href="../restaurant/detail?">
						<h2>${v.restaurantName}</h2>
					</a>
				</span>
				<strong class="star"><h2>${v.reviewVOs[0].star}</h2></strong>
				<h4 class="address">${v.address} ${v.detailAddress} ${v.extraAddress}</h4>
			</div>
			<div id="map${v.restaurantNum}" style="width:600px;height:400px;"></div>
			<script>
				var mapContainer${v.restaurantNum} = document.getElementById('map${v.restaurantNum}'), // 지도를 표시할 div 
				    mapOption${v.restaurantNum}= {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map${v.restaurantNum} = new kakao.maps.Map(mapContainer${v.restaurantNum}, mapOption${v.restaurantNum}); 
				
				// 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new kakao.maps.ZoomControl();
	
				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map${v.restaurantNum}.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder${v.restaurantNum} = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder${v.restaurantNum}.addressSearch('${v.address}${v.detailAddress}', function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords${v.restaurantNum} = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker${v.restaurantNum} = new kakao.maps.Marker({
				            map: map${v.restaurantNum},
				            position: coords${v.restaurantNum}
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow${v.restaurantNum} = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${v.restaurantName}</div>'
				        });
				        infowindow${v.restaurantNum}.open(map${v.restaurantNum}, marker${v.restaurantNum});
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map${v.restaurantNum}.setCenter(coords${v.restaurantNum});
				    } 
				}); 
			</script>
			<hr>
		</div>
	</c:forEach>
</body>
</html>