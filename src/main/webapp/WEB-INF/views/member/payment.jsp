<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>
	<h1 class="text-center mb-5">My Payment</h1>

	<c:forEach items="${paymentList}" var="pl">

		<section>
			<div class="row mx-auto justify-content-center">
				<div class="col-xl-6 col-md-12 mb-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between p-md-1">
								<div class="d-flex flex-row">
									<div class="align-self-center">
										<img alt="메뉴 사진"
											src="/resources/upload/restaurant/${pl.restaurantFileVO.fileName}"
											style="width: 200px; height: 250px;">
									</div>
									<div class="ms-3">
										<p class="mb-0">${pl.restaurantVO.address}</p>
										<h4>${pl.restaurantVO.restaurantName}</h4>
									</div>
								</div>
								<div class="align-self-center">
									<h2 class="h1 mb-0">
									<fmt:formatNumber value="${pl.totalPrice}" pattern="#,###"></fmt:formatNumber>원
									</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:forEach>
	
	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="./payment?pn=${pager.pre?pager.startNum-1:1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link" href="./payment?pn=${i}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./payment?pn=${pager.next?pager.lastNum+1:pager.lastNum}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>

	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
</html>