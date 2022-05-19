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
<link rel="stylesheet" href="../resources/css/reviewDetail.css">
<title>Insert title here</title>
</head>
<body>
	<div class="reviewpicTitle">
		<h1>ID :</h1>

		<c:if test="${revo.star eq '5' }">
			<h1 id="reviewStar">리뷰 별모양★★★★★</h1>
		</c:if>
		<c:if test="${revo.star eq '4' }">
			<h1 id="reviewStar">리뷰 별모양★★★★☆</h1>
		</c:if>
		<c:if test="${revo.star eq '3' }">
			<h1 id="reviewStar">리뷰 별모양★★★☆☆</h1>
		</c:if>
		<c:if test="${revo.star eq '2' }">
			<h1 id="reviewStar">리뷰 별모양★★☆☆☆</h1>
		</c:if>
		<c:if test="${revo.star eq '1' }">
			<h1 id="reviewStar">리뷰 별모양★☆☆☆☆</h1>
		</c:if>
		<c:if test="${revo.star eq '0' }">
			<h1 id="reviewStar">리뷰 별모양☆☆☆☆☆</h1>
		</c:if>

	</div>

	<%-- 	 	<div id="revPicBox">
		<div class="revPics">
		<c:forEach items="${revo.reviewFilesVOs }" var="rFilesVOS">
		<img alt="" src="../resources/upload/review/${rFilesVOS.fileName}">
		</c:forEach>
		</div>
	</div>  --%>

	<div style="overflow: hidden">
		<div class="con">
			<c:forEach items="${revo.reviewFilesVOs }" var="rFilesVOS">
				<div class="inn">
					<img class="pic" alt="" src="../resources/upload/review/${rFilesVOS.fileName}">
				</div>
			</c:forEach>
		</div>
	</div>
	<button class="bbtn1">1</button>
	<button class="bbtn2">2</button>
	<button class="bbtn3">3</button>


	<div id="revTextBox">
		<div id="revText">
			<h3>${revo.contents }</h3>
		</div>
	</div>
	<h5>작성일</h5>

	<div id="btnBox">
		<div>
			<button type="button">리뷰수정</button>
			<button type="button">리뷰 삭제</button>
		</div>
	</div>



	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
	const pic= document.querySelectorAll(".pic")
		document.querySelector('.bbtn2').addEventListener('click',function(){
			wid=pic.innerWidth;
			console.log(wid);
			document.querySelector('.con').style.transform = 'translate(-100vw)';
		})		
	</script>

</body>
</html>