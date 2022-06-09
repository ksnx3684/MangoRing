let count = 0;


function fileDeleteInit(){

	$(".del").click(function(){
		let check = window.confirm("삭제하시겠습니까?");
		
		if(!check){
			return;
		}
		
		let fileNum= $(this).attr("data-num");
		let selector = $(this);
		console.log(this);
		console.log(fileNum);
		console.log(selector);
		$.ajax({
			type:"POST",
			url:"./fileDelete",
			data:{
				fileNum:fileNum
				
			},
			success:function(data){
				console.log(this);
				
				if(data.trim()=='1'){
					$(".image-preview").find("li").first().remove();
					$(selector).parent().remove();
					count--;
				}else{
					alert("파일삭제실패 !");
				}
			},
			error:function(){
				alert("에러발생.삭제실패")
			}
		})
	})

}

	
	
function fileAddInit(c){
count = c;
if(c==null){
	count=0;
}

$("#clcl").click(function() {
	if (count > 2) {
		alert('최대 3개의 사진만 업로드 가능합니다.')
		return;
	}

	console.log("파파파파파파")

	let result = '';
	result = '<ul class="uploadBox">'
	result = result + '<input type="file" name="files" class="real-upload" accept="image/*" required multiple>';


	result = result + ' <div class="upload">사진추가하기</div> ';
	result = result + '<button class="del" type="button">X</button> </ul>'
	$(".fileResult").append(result);
	count++;
})

$(".fileResult").on("click", ".del",function(){
	console.log("삭제??")
	$(this).parent().remove();
	$(".uploadBox").find("li").next().remove();
	
	
	
	count--;
})
}


 function getImageFiles(e) {
      const uploadFiles = [];
      const files = e.currentTarget.files;
      const imagePreview = document.querySelector('.image-preview');
      const docFrag = new DocumentFragment();

      if ([...files].length >= 3) {
        alert('이미지는 최대 3개 까지 업로드가 가능합니다.');
        return;
      }

      // 파일 타입 검사
      [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
        }

        // 파일 갯수 검사
        if ([...files].length < 3) {
          uploadFiles.push(file);
          const reader = new FileReader();
          reader.onload = (e) => {
            const preview = createElement(e, file);
            let picCount=1;
            $(".uploadBox").children().eq(picCount).append(preview);
            picCount++;
          };
          reader.readAsDataURL(file);
        }
      });
    }

    function createElement(e, file) {
      const li = document.createElement('li');
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('data-file', file.name);
      li.appendChild(img);

      return li;
    }

  //  const realUpload = document.querySelector('.real-upload');
   // const upload = document.querySelector('.upload');

	$("#reviewpicBox").on("click",".upload",function(){
		$(this).prev().click();
	})

	$("#reviewpicBox").on("change",".real-upload",function(e){
		getImageFiles(e);
	})


		
	
    //upload.addEventListener('click', () => realUpload.click());


   // realUpload.addEventListener('change', getImageFiles);
