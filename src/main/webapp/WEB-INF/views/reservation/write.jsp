<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

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

<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- 카카오 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=167a068f3a58e8874e1819a07ccfdfde&libraries=services"></script>

<style type="text/css">
.row {
	display: flex;
	justify-content: center;
}

</style>

</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
	 <style>
        body.modal-open {
          overflow: auto;
        }
        body.modal-open[style] {
          padding-right: 0px !important;
        }
        .container{
          margin-top: 50px;
          margin-bottom: 50px;
        }
    </style>
	
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
	<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">온라인 예약</h1>
            <!-- <p class="breadcrumbs"><span class="mr-2"><a href="./shop/ownerPage"> 페이지 <i class="ion-ios-arrow-forward"></i></a></span> <span>예약 관리 페이지</span></p> -->
          </div>
        </div>
      </div>
    </section>

	<div class="container">
		
		<div class="row">
			<div class="col-8 mb-3">
				<%-- <h1>${restaurantVO.restaurantName}</h1> --%>
				<div class="row">
					<div class="col-5">
						<img class="img-fluid img-thumbnail" src="../resources/upload/restaurant/${restaurantVO.restaurantFileVO.fileName}">
					</div>
					<div class="col-7">
						<span class="title">
							<h2>${restaurantVO.restaurantName}</h2>
						</span>
						<h5 class="address">${restaurantVO.address} ${restaurantVO.detailAddress} ${restaurantVO.extraAddress}</h5>
						<p>${restaurantVO.introduction}</p>
					</div>
					<div id="map" class="mt-5" style="width: 95%; height: 300px;">지도 들어갈 자리</div>
				</div>
				
			</div>
			
			<div class="col-4">
				<div class="row mb-5 text-center">
					<form action="./write" method="post" id="rsvFrm">
						<input type="hidden" name="restaurantNum" value="${restaurantVO.restaurantNum}">
						<input type="hidden" id="rsvTime" name="rsvTime">
						<h5>날짜 선택</h5>
						<input type="text" class="mt-3 mb-5" id="datepicker" placeholder="날짜를 선택해주세요.">
						<h5>시간 선택</h5>
						<input type="text" class="mt-3 mb-5" id="timepicker">
						<h5>인원수 선택</h5>
						<select id="count" name="count">
							<option value="" selected disabled hidden>인원수를 선택해주세요.</option>
							
							<c:forEach begin="1" end="10" step="1" var="num">
								<option value="${num}">${num}명</option>
							</c:forEach>
						</select>
					</form>
				</div>
				<div class="row mb-5">
					<button type="button" class="btn btn-primary p-3 px-xl-4 py-xl-3" id="rsvBtn">예약하기</button>
				</div>
			</div>
		</div>
	</div>
	


<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption= {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${restaurantVO.address}${restaurantVO.detailAddress}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:14px">${restaurantVO.restaurantName}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
</script>

<!-- 템플릿 -->
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/aos.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>

<script src="../js/scrollax.min.js"></script>

<script src="../js/main.js"></script>


<script type="text/javascript">

$("#rsvBtn").click(function() {
	if($("#datepicker").val() == "") {
		alert("날짜를 선택해주세요.");
		return;
	}
	if($("#count").val() == null) {
		alert("인원수를 선택해주세요.");
		return;
	}
	
	let rsvTime = $("#datepicker").val() + " " + $("#timepicker").val() + ":00";
	$("#rsvTime").val(rsvTime);
	
	$("#rsvFrm").submit();
	
});

/* 한국어 설정 */
$.datepicker.setDefaults({
  dateFormat: 'yy-mm-dd',
  prevText: '이전 달',
  nextText: '다음 달',
  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  showMonthAfterYear: true,
  yearSuffix: '년',
  /* beforeShowDay: disableSomeDay */
});

/* 달력띄우기 */
$(function () {
  $('#datepicker').datepicker({
	  minDate: 0
  });
});

/* 날짜 선택 막기 */
/* let disabledDays = ["2022-5-25", "2022-6-1"];

function disableSomeDay(date) {
	let m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    for (i = 0; i < disabledDays.length; i++) {
        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
            return [false];
        }
    }

	let noWeekend = jQuery.datepicker.noWeekends(date);
	return noWeekend[0] ? [true] : noWeekend;
} */


/* 시간선택 */
$(function() {
    $("#timepicker").timepicker({
        timeFormat: 'HH:mm',
        interval: 30,
        minTime: '10',
        maxTime: '6:00pm',
        defaultTime: '11',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
});


</script>
</body>
</html>