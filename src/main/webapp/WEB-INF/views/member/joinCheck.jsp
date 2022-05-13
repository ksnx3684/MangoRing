<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
</head>
<body>
	<div class="container col-4 checkbox_group">
	<h1 class="mt-5">joinCheck Page</h1>
	
		<div class="form-check mt-5">
		  <input class="form-check-input" type="checkbox" value="" id="check_all">
		  <label class="form-check-label" for="check_all">
		    전체 동의
		  </label>
		</div>
		
		<div class="form-check mt-5">
		  <input class="form-check-input normal" type="checkbox" value="" id="check_1">
		  <label class="form-check-label" for="check_1">
		    서비스 이용약관 동의 (필수)
		  </label>
		</div>
		<div class="mt-3 mb-3">
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows=3" readonly="readonly">

		  </textarea>
		</div>
		
		<div class="form-check mt-5">
		  <input class="form-check-input normal" type="checkbox" value="" id="check_2">
		  <label class="form-check-label" for="check_2">
		    개인정보 수집 및 이용 동의 (필수)
		  </label>
		</div>
		<div class="mt-3 mb-3">
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="readonly">

		  </textarea>
		</div>
		
		<div class="form-check mt-5">
		  <input class="form-check-input normal" type="checkbox" value="" id="check_3">
		  <label class="form-check-label" for="flexCheckDefault">
		    서비스 이용약관 동의 (필수)
		  </label>
		</div>
		<div class="mt-3 mb-3">
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="readonly">

		  </textarea>
		</div>
		
		<div class="d-grid gap-2 col-6 mx-auto mt-3 mb-3">
		  <button id="join" class="btn btn-primary" type="button">회원가입</button>
		</div>
	</div>
	
<c:import url="../template/cdn_script.jsp"></c:import>
<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>