<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <a class="navbar-brand" href="/"><img src="/resources/img/mangoplate-logo-horizontal.svg"></a>
	  <ul class="navbar-nav" style="height: 30px;">
	  	<c:import url="/WEB-INF/views/template/search.jsp"></c:import>
	  </ul>
	</nav>

</body>
</html>