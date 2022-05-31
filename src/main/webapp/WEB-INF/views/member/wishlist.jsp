<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>
	<h1 class="text-center mb-5">Wishlist Page</h1>

	<div class="container">
		<c:forEach items="${wishList}" var="wish">
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card flex-md-row mb-4 shadow-sm h-md-250">
						<c:forEach items="${wish.restFileVO}" var="wishFile">
							<img class="card-img-right flex-auto d-none d-lg-block"
								alt="Thumbnail [200x250]"
								src="/resources/upload/restaurant/${wishFile.fileName}"
								style="width: 200px; height: 250px;">
						</c:forEach>
						<c:forEach items="${wish.restaurantVOs}" var="rest">
							<div class="card-body d-flex flex-column align-items-start">
								<div class="mb-1 text-muted small">${rest.address}</div>
								<h6 class="mb-1">
									<a class="text-dark" href="#">${rest.restaurantName}</a>
								</h6>
								<p class="card-text mb-auto">Test</p>
								<div class="align-self-end pb-3">
									<button class="btn btn-outline-danger btn-sm delete_btn"
										data-num="${wish.wishNum}" type="button">삭제</button>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="./wishlist?pn=${pager.pre?pager.startNum-1:1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link" href="./wishlist?pn=${i}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./wishlist?pn=${pager.next?pager.lastNum+1:pager.lastNum}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>


	<c:import url="../template/cdn_script.jsp"></c:import>
</body>
<script type="text/javascript">

	$('.delete_btn').click(function(){
		var confirm_val = confirm("삭제하시겠습니까?");
		var wishNum = $(this).attr("data-num");
		
		console.log("wishNum : " + wishNum);
		
		// 확인을 클릭했을 때
		if(confirm_val) {
			
			$.ajax({
				url : "/member/delWishlist",
				type : "POST",
				data : {
					wishNum : wishNum
				},
				success : function(result) {
					if(result == 1) {
						location.href = "/member/wishlist";
					} else {
						alert("삭제 실패");
					}
				},
				error : function() {
					alert("에러 발생");
				}
			});
		// 취소를 클릭했을 때
		} else {
//			location.replace("/member/wishlist");
			return;
		}
		
	});
	
</script>
</html>