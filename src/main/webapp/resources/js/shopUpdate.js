/**
 * 
 */
 
 function fileDeleteInit() {
	$("#restFileDel").click(function () {

		let check = window.confirm("파일이 영구히 삭제됩니다. 삭제하시겠습니까?")
		
		if(!check) {
			return;
		}
		
		let fileNum=$(this).attr("data-num");
		console.log(this);
		let selector = $(this);
		$.ajax({
			type:"POST",
			url: "./fileDelete",
			data: {
				fileNum: fileNum
			},
			success: function (data) {
				if(data.trim()=='1') {
					$(selector).parent().remove();
					imageCheck();
					/*let result = '<div class="input-group">';
					result = result + '<input type="file" class="form-control" id="rest_file" name="restFile" onchange="setThumbnails(event);">';
					result = result + '<button class="btn btn-outline-secondary del" type="button">X</button>';
					result = result + '</div>'
					
					$("#fileResult").append(result);*/
				}else {
					alert("삭제 실패!");
				}
			},
			error: function() {
				alert("에러");
			}
		});
	});
}
 
 
$("#fileResult").on("click", ".del", function() {
	$("#rest_image").empty();
	$("#rest_file").val("");
});


function imageCheck() {
	let check = $("#rest_thumbnail").length;
	$("#rest_file").prop("disabled", check);
}

function setThumbnails(event) {
	var reader = new FileReader();

        reader.onload = function(event) {
			$("#rest_image").empty();
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "img-fluid img-thumbnail");
            document.querySelector("div#rest_image").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
}

function setMenuThumbnails(event) {
	
	/*console.log($(event.target).parent().siblings(".menu_image"));*/
	
	let menu_image = $(event.target).parent().siblings(".menu_image");
	
	$(event.target).parent().siblings(".menu_image").empty();
	
	var reader = new FileReader();

        reader.onload = function(event) {
			
			console.log(menu_image);	
			
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "img-fluid img-thumbnail");
			menu_image[0].appendChild(img);
          
        };

        reader.readAsDataURL(event.target.files[0]);
}

$("#menuForm").on("click", ".del", function() {
	$(this).parent().siblings(".menu_image").empty();
	$(this).siblings(".menuFiles2").val("");
});
 
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
	
	if($("#restaurantName").val() == "") {
		alert("가게 이름을 입력해주세요.");
		return;
	}
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
	
	
	$("#updateFrm").submit();
	
});

let num = 0

$("#menuBtn").click(function() {
	console.log("메뉴추가");
	
	let result = '<div class="box mb-5">';
	result = result + '<div class="menu_image" style="width: 60%; margin: 0 auto;"></div>';
	result = result + '<div class="input-group mb-3">';
	result = result + '<input type="file" class="form-control form-control-lg menuFiles2" name="menuFiles2" onchange="setMenuThumbnails(event);">';
	result = result + '<button class="btn btn-outline-secondary del" type="button">X</button>';
	result = result + '</div>'
	
	result = result + '<div class="my-3 row">';
	result = result + '<label class="col-sm-2 col-form-label">메뉴 이름</label>';
	result = result + '<div class="col-sm-10">';
	result = result + '<input type="text" class="form-control name" placeholder="메뉴 이름을 입력해주세요." name="menuVOList2['+num+'].name">';
	result = result + '</div>';
	result = result + '</div>';
	
	result = result + '<div class="my-3 row">';
	result = result + '<label class="col-sm-2 col-form-label">메뉴 가격</label>';
	result = result + '<div class="col-sm-10">';
	result = result + '<input type="text" class="form-control price" placeholder="메뉴 가격을 입력해주세요." name="menuVOList2['+num+'].price">';			
	result = result + '</div>';
	result = result + '</div>';
	
	result = result + '<div class="my-3 row">';
	result = result + '<label class="col-sm-2 col-form-label">메뉴 설명</label>';	
	result = result + '<div class="col-sm-10">';		
	result = result + '<input type="text" class="form-control detail" placeholder="메뉴 설명을 입력해주세요." name="menuVOList2['+num+'].detail">';			
	result = result + '</div>';
	result = result + '</div>';

	result = result + '<div class="text-center">'
	result = result + '<button type="button" class="btn btn-outline-secondary menuFrmDel">삭제</button>';
	result = result + '</div>';
	result = result + '</div>'
			
	
	$("#menuForm").append(result);
	
	num++;		
});

$("#menuForm").on("click", ".menuFrmDel", function() {
	console.log("메뉴 폼 삭제");
	$(this).parent().parent().remove();
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