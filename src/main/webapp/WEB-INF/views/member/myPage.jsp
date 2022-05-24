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
</head>
<body>
	<h1 class="text-center">My Page</h1>
	
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
	</div>
	
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button class="btn btn-primary btn-lg" type="button">위시리스트</button>
	  <button class="btn btn-primary btn-lg" type="button">내 평점</button>
	</div>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button class="btn btn-primary btn-lg" type="button">결제내역</button>
	  <button class="btn btn-primary btn-lg" type="button">예약내역</button>
	</div>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-evenly mt-5">
	  <button class="btn btn-primary btn-lg" type="button">나의 쿠폰</button>
	  <button class="btn btn-primary btn-lg" type="button">장바구니</button>
	</div>
	
	<div class="container">
	  <footer class="py-3 my-4 mt-auto">
	    <ul class="nav justify-content-around border-bottom pb-3 mt-5 mb-3">
	      <li class="nav-item"><a href="./business" class="nav-link px-2 text-muted">사업자 신청</a></li>
	      <li class="nav-item"><a href="./update" class="nav-link px-2 text-muted">회원정보수정</a></li>
	      <li class="nav-item"><a href="./delete" class="nav-link px-2 text-muted">회원탈퇴</a></li>
	    </ul>
	    <p class="text-center text-muted">&copy; 2022 Mango</p>
	  </footer>
	</div>
	
	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
</html>