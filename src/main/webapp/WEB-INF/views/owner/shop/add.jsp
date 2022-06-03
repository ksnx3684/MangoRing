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

<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	
	<div class="container">

		<h1>가게 추가 페이지</h1>
		<h3>${restaurantVO.restaurantName}</h3>
		
		<form action="./add" method="post" enctype="multipart/form-data" id="addFrm">
			
			<input type="hidden" id="restaurantNum" name="restaurantNum" value="${restaurantVO.restaurantNum}">
			
			<h5>사진 추가</h5>
			<!-- 사진 업로드 나중에 추가 -->
			
			<div id="rest_image"></div>
			
			<div id="fileResult">
			
			</div>
			<button type="button" id="fileAdd">사진 추가</button>
			
			<h5>계좌번호</h5>
			<input type="text" class="form-control" placeholder="계좌번호를 입력해주세요." id="accountNumber" name="accountNumber">
			
			<h5>전화번호</h5>
			<input type="text" class="form-control" placeholder="전화번호를 입력해주세요." id="restaurantPhone" name="restaurantPhone">
			
			<h5>한 줄 식당 소개</h5>
			<input type="text" class="form-control" placeholder="소개문구를 입력해주세요." id="introduction" name="introduction">
			
			<h3>가게 태그</h3>
			<div>
				<c:forEach items="${hashtagVOs}" var="hashtagVO">
					<input type="checkbox" name="tagNum" value="${hashtagVO.tagNum}">${hashtagVO.name}
					<!-- Controller에서 받을 땐 @RequestParam List<String> tagNum -->
				</c:forEach>
			</div>
			<hr>
	
			<h3>메뉴 등록</h3>
			
			<!-- 사진 업로드 나중에 추가 -->
			<div class="menu_image"></div>
			<div class="input-group mb-3">
				<input type="file" class="form-control menuFiles" name="menuFiles">
			</div>
			
			<h5>메뉴 이름</h5>
			<input type="text" class="form-control name" placeholder="메뉴 이름을 입력해주세요." id="name" name="menuVOList[0].name">
			
			<h5>메뉴 가격</h5>
			<input type="text" class="form-control price" placeholder="메뉴 가격을 입력해주세요." id="price"  name="menuVOList[0].price">
			
			<h5>메뉴 설명</h5>
			<input type="text" class="form-control detail" placeholder="메뉴 설명을 입력해주세요." id="detail"  name="menuVOList[0].detail">
			
			<hr>
			
			<div id="menuForm" class="mt-3">
	
			</div>
	
			<button type="button" id="menuBtn" class="btn btn-outline-warning">메뉴추가</button>
			
			<br>
			
			<button type="button" class="btn btn-warning" id="addBtn">등록</button>
		
		</form>

	</div>
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript" src="../../resources/js/shopAdd.js"></script>


<script type="text/javascript">
	fileAddInit(0);
	fileDeleteInit();
</script>

</body>
</html>