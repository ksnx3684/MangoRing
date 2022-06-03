/**
 * 
 */
 
 //가게 번호 변수에 저장
let rstNum = $("#restaurantNum").val();
 
 //예약취소 버튼
$("#list").on("click", ".cancelBtn", function() {
	let check = window.confirm("정말로 예약을 취소하시겠습니까?");

	if(!check) {
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "./changeReservation",
		data: {
			reservationNum: $(this).attr("data-num"),
			visitStatus: 2
		},
		success: function(result) {
			if(result.trim() == '1') {
				alert("예약이 취소되었습니다.");
				getList(rstNum);
			}else {
				alert("취소 실패");
			}
		},
		error: function() {
			alert("에러");
		}
	});
});
//미방문 신고 버튼
$("#list").on("click", ".reportBtn", function() {
		let check = window.confirm("미방문 회원을 신고하시겠습니까?");

	if(!check) {
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "./changeReservation",
		data: {
			reservationNum: $(this).attr("data-num"),
			visitStatus: 3
		},
		success: function(result) {
			if(result.trim() == '1') {
				alert("신고되었습니다.");
				getList(rstNum);
				getReportList(rstNum);
			}else {
				alert("신고 실패");
			}
		},
		error: function() {
			alert("에러");
		}
	});
});


//예약 내역 테이블 관련
//날짜 검색
$("#searchBtn").click(function() {
	let startDate = $("#startDate").val();
	let endDate = $("#endDate").val();
	
	if(startDate == "") {
		alert("검색을 원하시는 기간의 시작 날짜를 선택해주세요.");
		return;
	}
	if(endDate == "") {
		alert("검색을 원하시는 기간의 종료 날짜를 선택해주세요");
		return;
	}
	
	getSearchList(rstNum, 0, startDate, endDate);
	
	$("#visitStatus").val("10");
});
//방문상태 별로 보기
$("#visitStatus").change(function() {
	let startDate = $("#startDate").val();
	let endDate = $("#endDate").val();
	let visitStatus = $("#visitStatus option:selected").val();
	
	if(startDate == "" && endDate == "") {
		getList(rstNum, 0, visitStatus);
	}else if(startDate != "" && endDate != ""){
		getSearchList(rstNum, 0, startDate, endDate, visitStatus);
	}
	
});
//예약 내역 테이블 페이지 버튼
$("#list").on("click", ".pager", function() {
	let startDate = $("#startDate").val();
	let endDate = $("#endDate").val();
	let visitStatus = $("#visitStatus option:selected").val();
	
	if(startDate == "" && endDate == "") {
		getList(rstNum, $(this).attr("data-pn"), visitStatus);
	}else if(startDate != "" && endDate != "") {
		getSearchList(rstNum, $(this).attr("data-pn"), startDate, endDate, visitStatus);
	}

});
//예약 전체 리스트
function getList(restaurantNum, pn, visitStatus) {
	$.ajax({
		type: "POST",
		url: "./reservationList",
		data: {
			perPage:5,
			pn: pn,
			restaurantNum: restaurantNum,
			visitStatus: visitStatus
		},
		success: function(result) {
			$("#list").html(result.trim());
		}
	});
};

//날짜 조건 추가된 리스트
function getSearchList(restaurantNum, pn, startDate, endDate, visitStatus) {
		$.ajax({
		type: "POST",
		url: "./reservationList",
		data: {
			perPage:5,
			pn: pn,
			restaurantNum: restaurantNum,
			startDate: startDate,
			endDate: endDate,
			visitStatus: visitStatus
		},
		success: function(result) {
			$("#list").html(result.trim());
		}
	});
};


//미방문 신고 내역 관련
function getReportList(restaurantNum, pn, startDate, endDate) {
	$.ajax({
		type: "POST",
		url: "./reportList",
		data: {
			perPage:5,
			pn: pn,
			restaurantNum: restaurantNum,
			startDate: startDate,
			endDate: endDate
		},
		success: function(result) {
			$("#list2").html(result.trim());
		}
	});
};

$("#searchBtn2").click(function() {
	let startDate = $("#startDate2").val();
	let endDate = $("#endDate2").val();
	
	if(startDate == "") {
		alert("검색을 원하시는 기간의 시작 날짜를 선택해주세요.");
		return
	}
	if(endDate == "") {
		alert("검색을 원하시는 기간의 종료 날짜를 선택해주세요");
		return
	}
	
	getReportList(rstNum, 0, startDate, endDate);
	
});

$("#list2").on("click", ".pager", function() {
	let startDate = $("#startDate2").val();
	let endDate = $("#endDate2").val();
	
	if(startDate == "" && endDate == "") {
		getReportList(rstNum, $(this).attr("data-pn"));
	}else if(startDate != "" && endDate != "") {
		getReportList(rstNum, $(this).attr("data-pn"), startDate, endDate);
	}

});