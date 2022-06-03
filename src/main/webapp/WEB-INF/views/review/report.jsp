<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>report</h1>
	<div>
	<h1>ID</h1>
		 <input readonly="readonly" type="text" value="${member.id }" >
	</div>
	
	<div>
	<select>
	<option>TAB(옵션-1.욕설)</option>
	<option>2.허위사실유포</option>
	<option>타 식당 음식 사진</option>
	<option>음식과 상관없는 리뷰</option>
	<option>지나친 비하</option>
	</select>
	</div>
	
	<div>
	<textarea name="reportContents" rows="" cols=""></textarea>
	</div>
</body>
</html>