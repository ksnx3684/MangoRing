<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">

.box {
	border: 2px solid #D8D8D8;
	padding: 30px;
}

</style>

<title>Insert title here</title>
</head>
<body>

	<c:import url="../../template/header.jsp"></c:import>
	 <style>
        body.modal-open {
          overflow: auto;
        }
        body.modal-open[style] {
          padding-right: 0px !important;
        }
        .container{
          margin-top: 50px;
          margin-bottom: 50px;
        }
    </style>
	
	<!-- 템플릿 -->
 	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="../../css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="../../css/animate.css">
	
	<link rel="stylesheet" href="../../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../../css/owl.theme.default.min.css">
	<link rel="stylesheet" href="../../css/magnific-popup.css">
	
	<link rel="stylesheet" href="../../css/aos.css">
	
	<link rel="stylesheet" href="../../css/ionicons.min.css">
	
	<link rel="stylesheet" href="../../css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="../../css/jquery.timepicker.css">
	
	
	<link rel="stylesheet" href="../../css/flaticon.css">
	<link rel="stylesheet" href="../../css/icomoon.css">
	<link rel="stylesheet" href="../../css/style.css">
	<section class="hero-wrap hero-wrap-2" style="background-image: url('../../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">가게 정보 수정</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="./ownerPage">가게 관리 페이지 <i class="ion-ios-arrow-forward"></i></a></span> <span>가게 정보 수정</span></p>
          </div>
        </div>
      </div>
    </section>

	<div class="container">

		
		<form action="./update" method="post" enctype="multipart/form-data" id="updateFrm">
			
			<input type="hidden" id="restaurantNum" name="restaurantNum" value="${restaurantVO.restaurantNum}">
			
			<h5>가게 대표 썸네일</h5>
			<c:if test="${not empty restaurantVO.restaurantFileVO}">
				<div id="rest_thumbnail" class="text-center my-5" style="width: 60%; margin: 0 auto;">
					<img alt="" src="../../resources/upload/restaurant/${restaurantVO.restaurantFileVO.fileName}" class="img-fluid img-thumbnail">
					<button type="button" id="restFileDel" data-num="${restaurantVO.restaurantFileVO.fileNum}" class="btn btn-outline-secondary mt-3">썸네일 삭제</button>
				</div>
			</c:if>
			<div id="rest_image" style="width: 60%; margin: 0 auto;"></div>
			<!-- 사진 업로드 나중에 추가 -->
			<div id="fileResult">
				
				<div class="input-group">
					<input type="file" class="form-control form-control-lg" id="rest_file" name="restFile" onchange="setThumbnails(event);">
					<button class="btn btn-outline-secondary del" type="button">X</button>
				</div>

			</div>
			
			<div class="my-3 row">
				<label for="restaurantName" class="col-sm-2 col-form-label">가게 이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="가게 이름을 입력해주세요." id="restaurantName" name="restaurantName" value="${restaurantVO.restaurantName}">
				</div>
			</div>
			<div class="my-3 row">
				<label for="accountNumber" class="col-sm-2 col-form-label">계좌번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="계좌번호를 입력해주세요." id="accountNumber" name="accountNumber" value="${restaurantVO.accountNumber}">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="restaurantPhone" class="col-sm-2 col-form-label">전화번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="전화번호를 입력해주세요." id="restaurantPhone" name="restaurantPhone" value="${restaurantVO.restaurantPhone}">
				</div>
			</div>
			<div class="mb-5 row">
				<label for="introduction" class="col-sm-2 col-form-label">가게 설명</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="소개문구를 입력해주세요." id="introduction" name="introduction" value="${restaurantVO.introduction}">
				</div>
			</div>

			<%-- <h5>계좌번호</h5>
			<input type="text" class="form-control" placeholder="계좌번호를 입력해주세요." id="accountNumber" name="accountNumber" value="${restaurantVO.accountNumber}">	

			<h5>전화번호</h5>
			<input type="text" class="form-control" placeholder="전화번호를 입력해주세요." id="restaurantPhone" name="restaurantPhone" value="${restaurantVO.restaurantPhone}">
			
			<h5>한 줄 식당 소개</h5>
			<input type="text" class="form-control" placeholder="소개문구를 입력해주세요." id="introduction" name="introduction" value="${restaurantVO.introduction}"> --%>
			
			<h3>가게 태그</h3>
			<div class="box mb-5">
	  			<c:forEach items="${selectedList.hashtagVOs}" var="selectedTag">
					<input type="hidden" class="restTag" value="${selectedTag.tagNum}">
				</c:forEach>
				<c:forEach items="${allTagList}" var="hashtagVO">
					<input type="checkbox" class="tagList" name="tagNum" value="${hashtagVO.tagNum}">${hashtagVO.name}
					<!-- Controller에서 받을 땐 @RequestParam List<String> tagNum -->
				</c:forEach>
			</div>
			<h3>메뉴 관리</h3>
			<c:forEach items="${menuVOs}" var="menuVO" varStatus="status">
				<div class="box mb-5">
					<div style="width: 60%; margin: 0 auto;">
						<img alt="" src="../../resources/upload/menu/${menuVO.menuFileVO.fileName}" class="img-fluid img-thumbnail">
					</div>
					<div class="my-3 row">
						<label class="col-sm-2 col-form-label">메뉴 이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control name" placeholder="메뉴 이름을 입력해주세요." name="menuVOList[${status.index}].name" value="${menuVO.name}">
						</div>
					</div>
					<div class="my-3 row">
						<label class="col-sm-2 col-form-label">메뉴 가격</label>
						<div class="col-sm-10">
							<input type="text" class="form-control price" placeholder="메뉴 가격을 입력해주세요." name="menuVOList[${status.index}].price" value="${menuVO.price}">
						</div>
					</div>
					<div class="my-3 row">
						<label class="col-sm-2 col-form-label">메뉴 설명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control detail" placeholder="메뉴 설명을 입력해주세요." name="menuVOList[${status.index}].detail" value="${menuVO.detail}">
						</div>
					</div>
					
					<input type="hidden" name="menuVOList[${status.index}].menuNum" value="${menuVO.menuNum}">
					
					<div class="text-center">
						<button type="button" class="btn btn-outline-secondary menuDel" data-fileNum="${menuVO.menuFileVO.fileNum}" data-menuNum="${menuVO.menuNum}">삭제</button>
					</div>
				</div>
			</c:forEach>

			
			<div id="menuForm" class="mt-3">
	
			</div>
			
			<div class="my-3" style="text-align: right;">
				<button type="button" id="menuBtn" class="btn btn-outline-warning">메뉴추가</button>
			</div>
		
			<div class="my-3 text-center">
				<button type="button" class="btn btn-primary btn-lg" id="addBtn">등록</button>
			</div>
		</form>

	</div>
	
	
	
<!-- 템플릿 -->
<script src="../../js/jquery.min.js"></script>
<script src="../../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../../js/popper.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.easing.1.3.js"></script>
<script src="../../js/jquery.waypoints.min.js"></script>
<script src="../../js/jquery.stellar.min.js"></script>

<script src="../../js/jquery.magnific-popup.min.js"></script>
<script src="../../js/aos.js"></script>
<script src="../../js/jquery.animateNumber.min.js"></script>
<script src="../../js/owl.carousel.min.js"></script>
<script src="../../js/scrollax.min.js"></script>

<script src="../../js/main.js"></script>	
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript" src="../../resources/js/shopUpdate.js"></script>
	
<script type="text/javascript">
	selectCheck();
	imageCheck();
	fileDeleteInit();
</script>
</body>
</html>