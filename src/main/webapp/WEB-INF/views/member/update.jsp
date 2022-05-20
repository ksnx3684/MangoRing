<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>
	<h1 class="text-center">Update page</h1>
	
	<div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <div class="card mt-3" style="border-radius: 15px;">
          <div class="card-body">
<!-- <form:form modelAttribute="memberVO" method="POST"> -->
			<form action="./update" method="POST">			
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">이름</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <input type="text" name="name" class="form-control form-control-lg" value="${vo.name}"/>
<!--  	          	<form:input path="name" cssClass="form-control form-control-lg" value="${vo.name}"/>
	              </div>
	              	<div class="col-md-3 ps-5">
	              		<form:errors path="name"></form:errors>
-->	
	              	</div>
	            </div>
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">전화번호</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <input type="text" name="phone" class="form-control form-control-lg" value="${vo.phone}"/>
<!--  	            <form:input path="phone" cssClass="form-control form-control-lg"/>
	              </div>
	              <div class="col-md-3 ps-5">
	              	<form:errors path="phone"></form:errors>
-->
	              </div>
	            </div>
	
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">이메일</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <input type="email" name="email" class="form-control form-control-lg" value="${vo.email}"/>
<!--  	          	<form:input path="email" cssClass="form-control form-control-lg"/> -->
	              </div>
<!--  	              <div class="col-md-3 ps-5">
	              	<form:errors path="email"></form:errors>
	              </div>
-->
	            </div>
			
            <hr class="mx-n3">
            
            	<div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">주소</h6>
	              </div>
	              <div class="col-md-8 pe-3">
	                <div class="input-group mb-3">
		                <input type="text" id="address" name="address" class="form-control form-control-lg" value="${vo.address}"
		                	readonly="readonly"/>
		                <button type="button" id="search" class="btn btn-outline-secondary">주소 검색</button>
	                </div>
	                
	                <div class="col-md-10 pe-2 mb-3">
	                	<input type="text" id="postCode" name="postCode" class="form-control form-control-lg" value="${vo.postCode}"
	                		readonly="readonly"/>
	                </div>
	                <div class="col-md-10 pe-2 mb-3">
	                	<div class="input-group">
		                	<input type="text" id="detailAddress" name="detailAddress" class="form-control form-control-lg me-4" value="${vo.detailAddress}"
		                		placeholder="상세주소"/>
		                	<input type="text" id="extraAddress" name="extraAddress" class="form-control form-control-lg" value="${vo.extraAddress}"
		                		readonly="readonly"/>
	                	</div>
	                </div>
	                <div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
	              </div>
	            </div>
			
            <hr class="mx-n3">

	            <div class="px-5 py-4 text-center">
	              <button type="submit" class="btn btn-primary btn-lg">수정하기</button>
	            </div>
            <!-- </form:form> -->
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
	
<c:import url="../template/cdn_script.jsp"></c:import>
<!-- KaKaoMap -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0302b66d0992062d842011c6439a7b9&libraries=services"></script>
</body>
<script type="text/javascript" src="../resources/js/map_search.js"></script>
</html>