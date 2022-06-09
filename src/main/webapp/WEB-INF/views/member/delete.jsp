<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>

<style type="text/css">
	#id {
		outline:none;
	}
</style>

</head>
<body>
	<h1 class="text-center">DELETE PAGE</h1>

	<div class="container text-center mb-3">
		회원을 탈퇴하시겠습니까?<br> 
		모든 개인정보가 삭제되며 복구할 수 없습니다

		<form action="./delete" method="POST">
			<div class="mt-3 mb-3 row">
				<label for="id" class="col-sm-2 col-form-label">ID</label>
				<div class="col-sm-10">
					<input type="text" id="id" readonly="readonly" class="form-control-plaintext"
						id="id" value="${member.id}">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword" name="pw">
				</div>
				<div>
					<c:if test="${msg == false}">
						비밀번호가 맞지 않습니다.
					</c:if>
				</div>
			</div>

			<div class="d-grid gap-2 d-md-block mt-5">
				<button class="btn btn-primary me-5" type="button">메인으로 가기</button>
				<button class="btn btn-danger ms-5" type="submit">회원 탈퇴</button>
			</div>
		</form>

	</div>

	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
<script type="text/javascript">
	$(function () {
	    $('input').blur();
	});
</script>
</html>