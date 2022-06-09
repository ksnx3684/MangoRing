<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
<link rel="stylesheet" href="../css/style.css"/>
</head>
<body>
	<h1 class="text-center">My Page</h1>
	
	<div class="container mb-3">
		<c:choose>
	      	<c:when test="${empty member || member.memberFileVO == null}">
	      		<img src="/resources/upload/member/default_profile.png" alt="photo" width="200" height="200">
	      	</c:when>
			<c:otherwise>
				<img src="/resources/upload/member/${member.memberFileVO.fileName}" alt="photo" width="200" height="200">
			</c:otherwise>
	    </c:choose>
    </div>
	
	<div class="container">
		<div class="row">
		  <div class="col-4 text-truncate">
		    ID : ${member.id}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    NAME : ${vo.name}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    EMAIL : ${vo.email}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    PHONE : ${vo.phone}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
			<c:choose>
				<c:when test="${vo.gender == 0}">
					GENDER : 남자
				</c:when>
				<c:when test="${vo.gender == 1}">
					GENDER : 여자
				</c:when>
			</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    JOINDATE : ${vo.joinDate}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:choose>
		  		<c:when test="${vo.userType == 1}">
		  			USERTYPE : 일반회원
		  		</c:when>
		  		<c:when test="${vo.userType == 2}">
		  			USERTYPE : 가게사장
		  		</c:when>
		  		<c:when test="${vo.userType == 3}">
		  			USERTYPE : 관리자
		  		</c:when>
		  	</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:if test="${vo.userType == 2}">
		    	BUSINESSNUM : ${vo.businessNum}
		    </c:if>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    POSTCODE : ${vo.postCode}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    ADDRESS : ${vo.address}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    DETAILADDRESS : ${vo.detailAddress}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		    EXTRAADDRESS : ${vo.extraAddress}
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:choose>
		  		<c:when test="${vo.blackList == 0}">
		  			BLACKLIST : 정상
		  		</c:when>
		  		<c:when test="${vo.blackList == 1}">
		  			BLACKLIST : 불량회원
		  		</c:when>
		  	</c:choose>
		  </div>
		</div>
		<div class="row">
		  <div class="col-4 text-truncate">
		  	<c:choose>
		  		<c:when test="${vo.businessOk eq 0}">
		  			businessOk : 미신청
		  		</c:when>
		  		<c:when test="${vo.businessOk eq 1}">
		  			businessOk : 승인대기
		  		</c:when>
		  		<c:when test="${vo.businessOk eq 2}">
		  			businessOk : 승인
		  		</c:when>
		  		<c:when test="${vo.businessOk eq 4}">
		  			businessOk : 승인 거절
		  		</c:when>
		  	</c:choose>
		  	
		  </div>
		</div>
	</div>
	
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button id="wishlist" class="btn btn-primary btn-lg" type="button">위시리스트</button>
	  <button id="rating" class="btn btn-primary btn-lg" type="button">내 평점</button>
	</div>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button id="payment" class="btn btn-primary btn-lg" type="button">결제내역</button>
	  <button id="reservation" class="btn btn-primary btn-lg" type="button">예약내역</button>
	</div>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button class="btn btn-primary btn-lg" type="button">나의 쿠폰</button>
	  <button id="cart" class="btn btn-primary btn-lg" type="button">장바구니</button>
	</div>
	
	<div class="container">
	  <footer class="py-3 my-4 mt-auto">
	    <ul class="nav justify-content-around border-bottom pb-3 mt-5 mb-3">
	    
	      
	      <c:choose>
	      	<c:when test="${vo.userType eq 1 and vo.businessOk eq 0}">
	      		<li class="nav-item">
		      		<a href="./business" class="nav-link px-2 text-muted">사업자 신청</a>
		      	</li>
	      	</c:when>
	      	<c:when test="${vo.userType eq 1 and vo.businessOk eq 1}">
	      		<li class="nav-item">
		      		<a class="nav-link px-2 text-muted">사업자 신청 대기</a>
		      	</li>
	      	</c:when>
	      	<c:when test="${vo.userType eq 2}">
	      		<li class="nav-item">
		      		<a href="#" class="nav-link px-2 text-muted">음식점 관리 페이지</a>
		      	</li>
	      	</c:when>
	      	<c:when test="${vo.userType eq 3}">
	      		<li class="nav-item">
		      		<a href="#" class="nav-link px-2 text-muted">관리자 페이지</a>
		      	</li>
	      	</c:when>
	      </c:choose>
	      
	      <li class="nav-item"><a href="./update" class="nav-link px-2 text-muted">회원정보수정</a></li>
	      <li class="nav-item"><a href="./delete" class="nav-link px-2 text-muted">회원탈퇴</a></li>
	    </ul>
	    <p class="text-center text-muted">&copy; 2022 MangoRing</p>
	  </footer>
	</div>
	
	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
<script type="text/javascript">

	$("#wishlist").click(function(){
		location.href="./wishlist";
	});
	
	$("#rating").click(function(){
		location.href="./rating";
	});
	
	$("#reservation").click(function(){
		location.href="./reservation";
	});
	
	$("#payment").click(function(){
		location.href="./payment";
	});
	
	$("#cart").click(function(){
		location.href="../cart/cartList";
	});
	
</script>
</html>