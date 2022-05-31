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
	<h1 class="text-center">Wishlist Page</h1>
	
	<div class="container">
		<c:forEach items="${wishList}" var="wish">
			<span>위시리스트 번호 : ${wish.wishNum}</span><br>
			<c:forEach items="${wish.restFileVO}" var="wishFile">
				<span><img alt="가게사진" src="/resources/upload/restaurant/${wishFile.fileName}" width="200" height="200">
				</span><br>
			</c:forEach>
			<c:forEach items="${wish.restaurantVOs}" var="rest">
				<span>가게 번호 : ${rest.restaurantNum}</span><br>
				<span>가게 주소 : ${rest.address}</span><br>
				<span>가게 이름 : ${rest.restaurantName}</span><br>
			</c:forEach>
		<button type="button" data-num="${wish.wishNum}"
				class="mt-3 btn btn-danger delete_btn">삭제</button>
		<hr><br>
		</c:forEach>
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
			location.replace("/member/wishlist");
		}
		
	});
	
</script>
</html>