// 체크박스들이 변경되었을 때 실행
$("input[name=categoryNum]:checkbox").change(function() {
	
	// 1개만 선택 가능
	var cnt = 1;
	
	if(cnt == $("input[name=categoryNum]:checkbox:checked").length) {
		$(":checkbox:not(:checked)").attr("disabled", "disabled");
	} else {
		$("input[name=categoryNum]:checkbox").removeAttr("disabled");
	}
});