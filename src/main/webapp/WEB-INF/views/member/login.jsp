<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">

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
  <form action="./login" method="POST">
    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating mb-1">
      <input type="text" class="form-control" id="floatingInput" name="id">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="pw">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <div class="d-grid gap-2 d-md-block">
	  <button class="btn btn-primary" type="submit">로그인</button>
	  <button id="joinCheck" class="btn btn-success" type="button">회원가입</button>
	</div>
    <p class="mt-3 mb-3 text-muted">&copy; Mango</p>
  </form>
</main>

	
<c:import url="../template/cdn_script.jsp"></c:import>
<script type="text/javascript" src="../resources/js/login.js"></script>
</body>
</html>