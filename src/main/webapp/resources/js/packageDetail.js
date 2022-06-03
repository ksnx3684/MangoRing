/**
 * 
 */
 
 $("#confirmBtn").click(function() {
	
	let check = false;
	
	$(".waiting").each(function(idx, item) {
		if($(item).prop("checked")) {
			check = true;
		}
	})
	
	if(!check) {
		alert("예상시간을 선택해주세요.");
		return;
	}

	$("#updateFrm").submit();
	
});

$("#cancelBtn").click(function() {
	console.log("취소 클릭");
	
	let check = window.confirm("정말 주문을 취소하시겠습니까?");
	
	if(check) {
		$.ajax({
			type:"POST",
			url: "./visitUpdate",
			data: {
				payNum: $("#payNum").val(),
				status: 2
			},
			success: function (data) {
				if(data.trim()=='1') {
					alert("취소되었습니다.");
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