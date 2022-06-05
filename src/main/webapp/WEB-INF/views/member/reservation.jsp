<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>
<h1 class="text-center mb-5">My Reservation</h1>

<c:forEach items="${reserList}" var="rl">

		<div class="container-fluid">
			<section>
				<div class="row mx-auto justify-content-center">
					<div class="col-xl-6 col-md-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between p-md-1">
									<div class="d-flex flex-row">
										<div class="align-self-center">
											<c:if test="${not empty rl.restaurantFileVO.fileName}">
												<img alt="가게 사진" src="/resources/upload/restaurant/${rl.restaurantFileVO.fileName}" 
													style="width: 200px; height: 250px;"/>
											</c:if>
										</div>
										<div class="ms-3">
												<p class="mb-0">${rl.restaurantVO.address}</p>
												<h4>${rl.restaurantVO.restaurantName}</h4>
										</div>
									</div>
									<div class="align-self-center">
										<h4 class="h4 mb-0">
											<c:choose>
												<c:when test="${rl.visitStatus eq 0}">
													예약 완료
												</c:when>
												<c:when test="${rl.visitStatus eq 1}">
													방문 완료
												</c:when>
												<c:when test="${rl.visitStatus eq 2}">
													예약 취소
												</c:when>
												<c:when test="${rl.visitStatus eq 3}">
													미방문
												</c:when>
											</c:choose>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
</c:forEach>

	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="./reservation?pn=${pager.pre?pager.startNum-1:1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./reservation?pn=${i}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./reservation?pn=${pager.next?pager.lastNum+1:pager.lastNum}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>


	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
</html>