/**
 * 
 */
 
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
	
	$("#searchFrm").submit();
	
});

$(".visitBtn").click(function() {
	console.log($(this).attr("data-num"));
	let check = window.confirm("방문 완료 처리 하시겠습니까?");
	
	if(check) {
		$.ajax({
			type:"POST",
			url: "./visitUpdate",
			data: {
				payNum: $(this).attr("data-num"),
				status: 3
			},
			success: function (data) {
				if(data.trim()=='1') {
					alert("방문 완료 처리 되었습니다.");
					window.location.href="./packageManage";
				}else {
					alert("실패");
				}
			},
			error: function() {
				alert("에러");
			}
		});		
	}
});