<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
</head>
<body>
<h1 class="text-center mt-3">SignUp Page</h1>

<div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <div class="card mt-3" style="border-radius: 15px;">
          <div class="card-body">
			<form:form modelAttribute="memberVO" method="POST" enctype="multipart/form-data">
	            <div class="row align-items-center pt-4 pb-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">아이디</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <!--  <input type="text" name="id" class="form-control form-control-lg" /> -->
	                <form:input path="id" cssClass="form-control form-control-lg" />
	              </div>
	              <div class="col-md-3 ps-5">
	              	<form:errors path="id"></form:errors>
	              </div>
	            </div>
	
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">비밀번호</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <!-- <input type="password" name="pw" class="form-control form-control-lg"/> -->
	                <form:password path="pw" cssClass="form-control form-control-lg"/>
	              </div>
	              <div class="col-md-3 ps-5">
	              	<form:errors path="pw"></form:errors>
	              </div>
	            </div>
	
	            <hr class="mx-n3">
	
	              <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">비밀번호 확인</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <!-- <input type="password" class="form-control form-control-lg"/> -->
	                <form:password path="checkPw" cssClass="form-control form-control-lg"/>
	              </div>
	              	<div class="col-md-3 ps-5">
	              		<form:errors path="checkPw"></form:errors>
	              	</div>
	            </div>
	
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">이름</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <!-- <input type="text" name="name" class="form-control form-control-lg" /> -->
	                <form:input path="name" cssClass="form-control form-control-lg"/>
	              </div>
	              	<div class="col-md-3 ps-5">
	              		<form:errors path="name"></form:errors>
	              	</div>
	            </div>
	
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">전화번호</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <!-- <input type="text" name="phone" class="form-control form-control-lg" /> -->
	              	<form:input path="phone" cssClass="form-control form-control-lg"/>
	              </div>
	              <div class="col-md-3 ps-5">
	              	<form:errors path="phone"></form:errors>
	              </div>
	            </div>
	
	            <hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">이메일</h6>
	              </div>
	              <div class="col-md-9 pe-5">
	                <!-- <input type="email" name="email" class="form-control form-control-lg"/> -->
	                <form:input path="email" cssClass="form-control form-control-lg"/>
	              </div>
	              <div class="col-md-3 ps-5">
	              	<form:errors path="email"></form:errors>
	              </div>
	            </div>

				<hr class="mx-n3">
	            
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">성별</h6>
	              </div>
	              <div class="col-md-9 pe-5">
					<!-- <input class="form-check-input" type="checkbox" id="Checkbox1" name="gender" value="0"> -->
	  				<form:radiobutton path="gender" cssClass="form-check-input" value="0"/>
	  				<label class="form-check-label me-5" for="Radios0">남</label>
	  				<!-- <input class="form-check-input" type="checkbox" id="Checkbox2" name="gender" value="1"> -->
	  				<form:radiobutton path="gender" cssClass="form-check-input" value="1"/>
	  				<label class="form-check-label" for="Radios1">여</label>
	              </div>
	               <div class="col-md-3 ps-5">
	               	<form:errors path="gender"></form:errors>
	               </div>
	            </div>
	            
	            <hr class="mx-n3">
	            <div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">프로필 사진</h6>
	              </div>
	              
	              <div class="col-md-9 pe-5">
	                <input class="form-control form-control-lg" id="formFileLg" name="file" type="file" />
	                <div class="small text-muted mt-2">10MB 이하 파일을 업로드해주세요</div>
	              </div>
	            </div>
			
            <hr class="mx-n3">

	            <div class="px-5 py-4 text-center">
	              <button type="submit" class="btn btn-primary btn-lg">가입하기</button>
	            </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>

<c:import url="../template/cdn_script.jsp"></c:import>
</body>
</html>