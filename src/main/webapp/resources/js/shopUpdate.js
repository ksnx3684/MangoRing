/**
 * 
 */
 
 $(".menuDel").click(function() {
	console.log("click");
	let check = window.confirm("영구히 삭제됩니다. 삭제하시겠습니까?")
		
		if(!check) {
			return;
		}
		
		let fileNum=$(this).attr("data-fileNum");
		let menuNum=$(this).attr("data-menuNum")
		console.log(this);
		let selector = $(this);
		$.ajax({
			type:"POST",
			url: "./menuDelete",
			data: {
				fileNum: fileNum,
				menuNum: menuNum
			},
			success: function (data) {
				if(data.trim()=='1') {
					$(selector).parent().remove();
				}else {
					alert("삭제 실패!");
				}
			},
			error: function() {
				alert("에러");
			}
		});
});

let num = 0

$("#menuBtn").click(function() {
	console.log("메뉴추가");
			
	let result = '<div class="input-group mb-3">';
	result = result + '<input type="file" class="form-control menuFiles2" name="menuFiles2">';
	result = result + '</div>'
	result = result + '<h5>메뉴 이름</h5>';
	result = result + '<input type="text" class="form-control name" placeholder="메뉴 이름을 입력해주세요." name="menuVOList2['+num+'].name">';
	result = result + '<h5>메뉴 가격</h5>';
	result = result + '<input type="text" class="form-control price" placeholder="메뉴 가격을 입력해주세요." name="menuVOList2['+num+'].price">';			
	result = result + '<h5>메뉴 설명</h5>';			
	result = result + '<input type="text" class="form-control detail" placeholder="메뉴 설명을 입력해주세요." name="menuVOList2['+num+'].detail">';			
	result = result + '<hr>'		
	
	$("#menuForm").append(result);
	
	num++;		
});

function selectCheck () {
	let arr = [];
	$(".restTag").each(function(idx, item) {
		arr.push($(item).val());
	});
	console.log(arr);
	$(".tagList").each(function(idx, item) {
		let tagNum = $(item).val();
		if($.inArray(tagNum, arr)!=-1) {
			console.log("일치 : ", tagNum);
			$(item).prop("checked", true);
		}
	});
}