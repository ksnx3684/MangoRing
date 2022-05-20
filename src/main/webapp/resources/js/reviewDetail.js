// 파일 너비,높이 통합 시키는 함수
function resize(img){
   // 원본 이미지 사이즈 저장
   var width = img.width;
   var height = img.height;

   // 가로, 세로 최대 사이즈 설정
   var maxWidth = 400;   // 원하는대로 설정. 픽셀로 하려면 maxWidth = 100  이런 식으로 입력
   var maxHeight = 400;   // 원래 사이즈 * 0.5 = 50%

   // 가로나 세로의 길이가 최대 사이즈보다 크면 실행  
   if(width > maxWidth || height > maxHeight){

      // 가로가 세로보다 크면 가로는 최대사이즈로, 세로는 비율 맞춰 리사이즈
      if(width > height){
         resizeWidth = maxWidth;
         resizeHeight = maxHeight;

      // 세로가 가로보다 크면 세로는 최대사이즈로, 가로는 비율 맞춰 리사이즈
      }else{
         resizeHeight = maxHeight;
         resizeWidth = maxWidth;
      }

   // 최대사이즈보다 작으면 원본 그대로
   }else{
      resizeWidth = maxWidth;
      resizeHeight = maxHeight;
   }
   
   // 리사이즈한 크기로 이미지 크기 다시 지정
   img.width = resizeWidth;
   img.height = resizeHeight;
}
//---------------

$(".sUpdate").click(function(){
	let num = $(this).attr("data-num");
	location.href="./update?reviewNum="+num
})


/*document.querySelector('.btnR').addEventListener('click',function(){
	document.querySelector('.revPics').style.transform = 'translate(-400px)';
	
});

document.querySelector('.btnL').addEventListener('click',function(){
	document.querySelector('.pics').style.transform = 'translate(+400px)';
	
});*/
