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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>Detail Page</h1>
	
	
	<div class="row mb-3">
	  <label for="colFormLabel" class="col-sm-2 col-form-label">Title</label>
	  <div class="col-sm-10">
	    <input type="text" class="form-control" id="colFormLabel" value="${vo.title}" readonly="readonly">
	  </div>
	</div>
	
	
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">Contents</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="readonly">${vo.contents}</textarea>
	</div>
	
	
	<hr class="my-6">
	    		<h6>첨부파일</h6>
	    	
				<ul class="list-group list-group-flush">
				   	<c:forEach items="${NoticeFilesVO}" var="f">
				   	<li class="list-group-item">
				   		<a href="./fileDown?fileNum=${f.fileNum}">${f.oriName}</a>
				   	</li>
				   	</c:forEach>
				</ul>
	
	


	<div class="container my-4">
		<div class="col-2 d-flex">
			<a href="update?num=${vo.num}" role="button" class="btn btn-primary mx-1">수정</a>
			<a href="delete?num=${vo.num}" role="button" class="btn btn-danger mx-1">삭제</a>
		</div>
	</div>
	</div>
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>