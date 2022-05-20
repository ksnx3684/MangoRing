<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>
<body>
	<h1>예약 페이지</h1>
	<h3>${restaurantVO.restaurantName}</h3>
	<form action="./write" method="post" id="rsvFrm">
		<input type="hidden" name="restaurantNum" value="${restaurantVO.restaurantNum}">
		<input type="hidden" id="rsvTime" name="rsvTime">
		<h3>날짜 선택</h3>
		<input type="text" id="datepicker">
		<h3>시간 선택</h3>
		<input type="text" id="timepicker">
		<h3>인원수 선택</h3>
		<select id="count" name="count">
			<option value="" selected disabled hidden>==인원 선택==</option>
			
			<c:forEach begin="1" end="10" step="1" var="num">
				<option value="${num}">${num}명</option>
			</c:forEach>
		</select>
	</form>
	<button type="button" id="rsvBtn">예약하기</button>
<script type="text/javascript">

$("#rsvBtn").click(function() {
	if($("#count").val() == null) {
		alert("인원수를 선택해주세요.");
		return;
	}
	
	let rsvTime = $("#datepicker").val() + " " + $("#timepicker").val();
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
        timeFormat: 'HH:mm:ss',
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