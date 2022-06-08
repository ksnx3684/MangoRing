<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>

<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<link rel="stylesheet" href="../css/style.css">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>

<body class="text-center">
    
<main class="form-signin">
  <!-- <form action="./login" method="POST"> -->
  	<form:form modelAttribute="memberVO" method="POST">
    <img class="mb-4" src="https://cdn-icons.flaticon.com/png/512/2578/premium/2578942.png?token=exp=1654622603~hmac=6bfd44a33c0788aa6c6cec6e1498b5df" 
    	alt="망고" width="100" height="85">
    <h1 class="h3 mb-3 fw-normal">Login</h1>

    <div class="form-floating mb-1">
      <input type="text" class="form-control" id="floatingInput" name="id">
      <!-- <form:input path="id" id="floatingInput" cssClass="form-control"/> -->
      <label for="floatingInput">ID</label>

      	<div>
      		<form:errors path="id"></form:errors>
      	</div>

    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="pw">
	  <!-- <form:password path="pw" cssClass="form-control" id="floatingPassword"/> -->
      <label for="floatingPassword">Password</label>
      	<div>
      		<form:errors path="pw"></form:errors>
      	</div>
    </div>
    <div class="mb-2">
		<c:if test="${msg == false}">
			아이디나 비밀번호를 확인해주세요
		</c:if>
	</div>
	
    
<!--
    <div class="checkbox mt-2 mb-3">
  
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
-->
    <div class="d-grid gap-2 d-md-block">
	  <button class="btn btn-primary" type="submit">로그인</button>
	  <button id="joinCheck" class="btn btn-info" type="button">회원가입</button>
	</div>
    <p class="mt-3 mb-3 text-muted">&copy; MangoRing</p>
  <!-- </form> -->
  	</form:form>
</main>

	
<c:import url="../template/cdn_script.jsp"></c:import>
<script type="text/javascript" src="../resources/js/login.js"></script>
</body>
</html>