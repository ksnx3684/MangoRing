// 체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });
   
    $("#check_all").prop("checked", is_checked);
    
});

// 버튼클릭시 모든 약관에 동의 되어야 함 
$("#join").click(function() {
    if($("#check_1").is(":checked") == false) {
		alert('서비스 이용약관에 동의해주세요');
		return;
	} else if($("#check_2").is(":checked") == false) {
		alert('개인정보 수집 및 이용에 동의해주세요');
		return;	
	} else if($("#check_3").is(":checked") == false) {
		alert('위치정보 이용약관 동의에 동의해주세요');
		return;
	}
	else {

	}
});