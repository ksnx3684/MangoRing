<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
	<h1>manager list</h1>
	
		<div class="col-5">
			<form class="d-flex" action="./list" method="get">
				<div class="col-4 me-2">
					<select name="kind" class="form-select " aria-label="Default select example">
					  <option value="col1">ID</option>
					  <option value="col2">이름</option>
					</select>	
				</div>
			<div class="col-6 me-2">
	        	<input name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
	        </div>
	        <div class="col-2">
	        	<button class="btn btn-outline-success" type="submit">Search</button>
	        </div>
	      </form>
		</div>
	
	
	 <table class="member-list">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>회원구분</td>
			<td>가입일자</td>
		</tr>
		<c:forEach items="${list}" var="m">
			<tr>
				<td>${m.id}</td>
				<td>${m.name}</td>
				<td>${m.userType }</td>
				<td>${m.joinDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>