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
			<h1 id="reviewStar">리뷰 ★★★★★</h1>
		</c:if>
		<c:if test="${revo.star eq '4' }">
			<h1 id="reviewStar">리뷰 ★★★★☆</h1>
		</c:if>
		<c:if test="${revo.star eq '3' }">
			<h1 id="reviewStar">리뷰 ★★★☆☆</h1>
		</c:if>
		<c:if test="${revo.star eq '2' }">
			<h1 id="reviewStar">리뷰 ★★☆☆☆</h1>
		</c:if>
		<c:if test="${revo.star eq '1' }">
			<h1 id="reviewStar">리뷰 ★☆☆☆☆</h1>
		</c:if>
		<c:if test="${revo.star eq '0' }">
			<h1 id="reviewStar">리뷰 ☆☆☆☆☆</h1>
		</c:if>

	</div>


	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div id="revPicBox">
				<div class="revPics">
					<c:forEach items="${revo.reviewFilesVOs }" varStatus="status"
						var="rFilesVOS">
						<div
							class="carousel-item <c:if test="${status.index eq 0 }">active </c:if>">

							<img onload="resize(this);"
								src="../resources/upload/review/${rFilesVOS.fileName}"
								class="d-block" alt="...">

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>






	<%-- 	<div id="revPicBox">
		<div class="btnBox">
			<button type="button" class="btnL btn-warning"><</button>
		</div>

		<div class="revPics">
			<c:forEach items="${revo.reviewFilesVOs }" var="rFilesVOS">
				<img class="pics" alt=""
					src="../resources/upload/review/${rFilesVOS.fileName}"
					onload="resize(this);">
			</c:forEach>
		</div>
		<div class="btnBox">
			<button type="button" class="btnR btn-warning">></button>
		</div>
	</div> --%>









	<div id="revTextBox">
		<div id="revText">
			<h3>${revo.contents }</h3>
		</div>
	</div>
	<h5>작성일 ${revo.regDate }</h5>

	<div id="btnBox">
		<div>
			<button class="sUpdate" data-num="${revo.reviewNum }" type="button">리뷰수정</button>
			<%-- <a href="update?reviewNum=${revo.reviewNum }" role="button">Update</a> --%>
			<a href="delete?reviewNum=${revo.reviewNum }" role="button"
				class="btn-danger mx-1">리뷰 삭제</a>
		</div>
	
	</div>
	<h1>마지막에 레스토랑넘,id가 일치한 사람,관리자만 보이게 </h1>

<button type="button" class="btn btn-primary btn-lg" id="openModalBtn">
신고하기
</button>

<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">해당 리뷰 신고하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">ss</button>
      </div>
      <div class="modal-body">
        <p><div>
        
        <form id="frm" action="./report" method="post">
        <input type="hidden" value="${revo.reviewNum }" name="reviewNum">
        <input type="hidden" value="1" name="reportCheck">
				<select name="reportOption">
					<option value="1">1.욕설</option>
					<option value="2">2.허위사실유포</option>
					<option value="3">3.타 식당 음식 사진</option>
					<option value="4">4.음식과 상관없는 리뷰</option>
					<option value="5">5.지나친 비하</option>
				
				</select>
		</form>
			</div></p>
      </div>
      <div class="modal-footer">
        <button id="closeModalBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="subm" type="button" class="btn btn-primary">신고하기</button>
      </div>
    </div>
  </div>
</div>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="../resources/js/reviewDetail.js" type="text/javascript"></script>
<script type="text/javascript">
$("#openModalBtn").on("click",function(){
	$(".modal").modal("show")
})

$("#closeModalBtn").on("click",function(){
	$(".modal").modal("hide");
})

$("#subm").on("click",function(){
	if(!confirm('신고하시겠습니까?')) return;
	$("#frm").submit();
})
</script>

</body>
</html>