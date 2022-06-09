<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>

	<div class="row">


		<div class="col-md-4">
			<c:import url="../template/managerSide.jsp"></c:import>
		</div>
		
	<div class="col-md-8">
	
	<h1>MemberChange Detail</h1>

	<div class="member-info">
		<h5>회원 정보</h5>
		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.id}" readonly="readonly">
			</div>
		</div>

		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.name}" readonly="readonly">
			</div>
		</div>

		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.phone}" readonly="readonly">
			</div>
		</div>

		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${mv.email}" readonly="readonly">
			</div>
		</div>
	</div>

	<div class="change-info">
		<h5>추가 정보</h5>
		<div class="row mb-3">
			<label for="colFormLabel" class="col-sm-2 col-form-label">사업자
				번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="colFormLabel"
					value="${re.businessNum}" readonly="readonly">
			</div>

			<div class="row mb-3">
				<label for="colFormLabel" class="col-sm-2 col-form-label">가게 주소
					</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="colFormLabel"
						value="${re.address}" readonly="readonly">
				</div>

				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">카테고리
						</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="colFormLabel"
							value="${re.categoryNum}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">주차가능 여부
						</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="colFormLabel"
							value="${re.parkingCheck}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">키즈존 여부
						</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="colFormLabel"
							value="${re.kidCheck}" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>