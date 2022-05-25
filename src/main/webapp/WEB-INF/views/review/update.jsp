<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/reviewAdd.css">
<link rel="stylesheet" href="../resources/css/point.css">
<title>Insert title here</title>
</head>
<body>
	<div class="reviewpicTitle">
		<h1>리뷰 수정</h1>
	</div>


	<div>

		<form action="./update" class="mb-3" name="myform" id="myform"
			method="post" enctype="multipart/form-data">
			<div id="reviewpicBox">

				<!-- 사진 등록 할 박스 -->

			<%-- 	<div class="picsBox">
				<img alt="" src="../resources/review/${voFile.fileName }">
					<input class="pics" value="${vo.reviewNum }" type="file" name="files">
				</div>
				<div class="picsBox">
					<input class="pics" type="file" name="files">
				</div>
				<div class="picsBox">
					<input class="pics" type="file" name="files">
				</div> --%>
				
				
				<button id="clcl" type="button">사진 추가</button>
				<div class="fileResult">
							
						
											<!-- <div class="picsBox">
												<input class="pics" type="file" name="files">
											</div> -->
				</div>
				
				<ul class="image-preview">
				<c:forEach items="${vo.reviewFilesVOs }" var="fileVO">
					<h4>${fileVO.oriName } <button class="del" type="button" data-num="${fileVO.fileNum }">DEL</button></h4>
					<li> <img class="imgg" src="../resources/upload/review/${fileVO.fileName }"></li>
				</c:forEach>
				
				</ul>	
				
				
				
			</div>
			<hr>
			<input type="hidden" name="reviewNum" value="${vo.reviewNum }">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span> 
				<input placeholder="${vo.star }" type="radio" name="star" value="5" id="rate1">
					<label for="rate1">★</label>
				<input placeholder="${vo.star }" type="radio" name="star" value="4" id="rate2">
					<label for="rate2">★</label> 
				<input placeholder="${vo.star }" type="radio" name="star" value="3" id="rate3">
					<label for="rate3">★</label> 
				<input placeholder="${vo.star }" type="radio" name="star" value="2" id="rate4">
					<label for="rate4">★</label>
				<input placeholder="${vo.star }" type="radio" name="star" value="1" id="rate5">
					<label for="rate5">★</label>
			</fieldset>
			<div>
				<textarea name="contents" class="col-auto form-control" value="${vo.contents }" type="text"
					id="reviewContents" placeholder="${vo.contents}"></textarea>
			</div>

			<button type="submit" id="btnReview">리뷰 등록</button>
		</form>

	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/reviewAdd.js"></script>

<script type="text/javascript">
fileAddInit(${vo.reviewFilesVOs.size()});
fileDeleteInit();
</script>
</body>
</html>