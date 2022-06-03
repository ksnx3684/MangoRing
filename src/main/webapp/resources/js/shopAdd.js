/**
 * 사장 회원이 가게 정보 등록할 때 사용
 */
 let num = 1
 $("#menuBtn").click(function() {
	console.log("메뉴추가");
			
	let result = '<div class="input-group mb-3">';
	result = result + '<input type="file" class="form-control menuFiles" name="menuFiles">';
	result = result + '</div>'
	result = result + '<h5>메뉴 이름</h5>';
	result = result + '<input type="text" class="form-control name" placeholder="메뉴 이름을 입력해주세요." name="menuVOList['+num+'].name">';
	result = result + '<h5>메뉴 가격</h5>';
	result = result + '<input type="text" class="form-control price" placeholder="메뉴 가격을 입력해주세요." name="menuVOList['+num+'].price">';			
	result = result + '<h5>메뉴 설명</h5>';			
	result = result + '<input type="text" class="form-control detail" placeholder="메뉴 설명을 입력해주세요." name="menuVOList['+num+'].detail">';			
	result = result + '<hr>'		
	
	$("#menuForm").append(result);
	
	num++;		
});

$("#addBtn").click(function() {
	
	//메뉴 등록 빈칸 체크
	let nameCheck = true;
	let priceCheck = true;
	let detailCheck = true;
	
	$(".name").each(function(idx, item) {
		if($(item).val() == "") {
			nameCheck = false;
		}
	})
	
	$(".price").each(function(idx, item) {
		if($(item).val() == "") {
			priceCheck = false;
		}
	})
	
	$(".detail").each(function(idx, item) {
		if($(item).val() == "") {
			detailCheck = false;
		}
	})
	
	
	if($("#accountNumber").val() == "") {
		alert("계좌 번호를 입력해주세요.");
		return;
	}
	if($("#restaurantPhone").val() == "") {
		alert("전화번호를 입력해주세요.");
		return;
	}
	if($("#introduction").val() == "") {
		alert("가게 소개를 입력해주세요.");
		return;
	}
	if(!nameCheck) {
		alert("메뉴 이름을 입력해주세요.");
		return;
	}
	if(!priceCheck) {
		alert("메뉴 가격을 입력해주세요.");
		return;
	}
	if(!detailCheck) {
		alert("메뉴 설명을 입력해주세요.");
		return;
	}
	
	
	$("#addFrm").submit();
	
});










/*function restaurantAdd(){
	let formData = new FormData();
	
	//가게 정보
	formData.append("restaurantNum", $("#restaurantNum").val());
	formData.append("restaurantPhone", $("#restaurantPhone").val());
	formData.append("introduction", $("#introduction").val());
	
	//가게 파일
	$(".files").each(function(idx, item) {
		if(item.files.length>0){
			formData.append("files", item.files[0]);
		}
	});
	
	//메뉴 파일 (메뉴 당 하나)
	$(".menuFiles").each(function(idx, item) {
		if(item.files.length>0){
			formData.append("menuFiles", item.files[0]);
		}
	});
	
	//메뉴 정보
	$(".name").each(function(idx, item) {
		formData.append("names", $(item).val())
	});
	
	$(".price").each(function(idx, item) {
		formData.append("prices", $(item).val())
	});
	
	$(".detail").each(function(idx, item) {
		formData.append("details", $(item).val())
	});

		
	$.ajax({
		type: "POST",
		url: "../shop/add",
		enctype: "multipart/form-data",
		processData: false,
		contentType: false,
		data: formData,
		success: function() {
			console.log("가게 컨트롤러 연결됨")
		}
	});
}*/

