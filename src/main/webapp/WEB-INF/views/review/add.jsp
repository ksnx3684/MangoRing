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
		<h1>사진등록</h1>
	</div>


	<div>

		<form action="./add" class="mb-3" name="myform" id="myform"
			method="post" enctype="multipart/form-data">
			<div id="reviewpicBox">
			
				<!-- 사진 등록 할 박스 -->

				<div class="picsBox">
					<input class="pics" type="file" name="files">
				</div>
				<div class="picsBox">
					<input class="pics" type="file" name="files">
				</div>
				<div class="picsBox">
					<input class="pics" type="file" name="files">
				</div>
			</div>
			<hr>
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
					name="star" value="5" id="rate1"><label for="rate1">★</label>
				<input type="radio" name="star" value="4" id="rate2"><label
					for="rate2">★</label> <input type="radio" name="star" value="3"
					id="rate3"><label for="rate3">★</label> <input type="radio"
					name="star" value="2" id="rate4"><label for="rate4">★</label>
				<input type="radio" name="star" value="1" id="rate5"><label
					for="rate5">★</label>
			</fieldset>
			<div>
				<textarea name="contents" class="col-auto form-control" type="text"
					id="reviewContents" placeholder="리뷰 내용을 작성해주세요."></textarea>
			</div>

			<button type="submit" id="btnReview">리뷰 등록</button>
		</form>

	</div>


</body>
</html>