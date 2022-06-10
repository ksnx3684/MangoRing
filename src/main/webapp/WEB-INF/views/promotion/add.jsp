<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/promotionAdd.css">
<title>Insert title here</title>
</head>
<body>



	<div class="promotionText">
		<h1>프로모션 신청</h1>
	</div>

	<div id="promotionResult" class="container">
		<!-- 쿠폰 목록 리스트 들어갈 박스 -->
		<h3>내역</h3>
	</div>

	<form action="./add" method="post">
		<div class="input-group mb-3">
<input type="hidden" name="restaurantNum" value="${pVo.restaurantNum }" id="restaurantNum">
			<input type="hidden" name="promotionNum"> <span
				class="input-group-text" id="basic-addon1">프로모션 이름</span> <input
				id="promotionName" type="text" name="promotionName"
				class="form-control" placeholder="Promotion Name"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">프로모션 내용</span> <input
				id="promotionDetail" type="text" name="promotionDetail"
				class="form-control" placeholder="Promotion Contents"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">프로모션 금액 </span> <input
				id="discount" type="text" name="discount" class="form-control"
				placeholder="Discount " aria-label="Username"
				aria-describedby="basic-addon1">
		</div>
		<h1>프로모션 시작 기간</h1>
		Year : <select id="select_year" name="startYear"
			onchange="javascript:lastday();"></select> Month : <select
			id="select_month" name="startMonth" onchange="javascript:lastday();"></select>
		Day : <select id="select_day" name="startDay"></select><br />
		<h1>프로모션 종료 기간</h1>
		Year : <select id="select_yearEnd" name="endYear"
			onchange="javascript:lastdayEnd();"></select> Month : <select
			id="select_monthEnd" name="endMonth"
			onchange="javascript:lastdayEnd();"></select> Day : <select
			id="select_dayEnd" name="endDay"></select><br />
		<br />

		<button id="add" type="button">ADD</button>
	</form>




	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="../resources/js/promotionAdd.js"></script>
	<script type="text/javascript">
		getList();
		function getList() {
			console.log("start")
			$.ajax({
				type : "GET",
				url : "./ajaxList",
				traditional : true,

				success : function(data) {
					console.log(data);
						
						$("#promotionResult").html(data);
					

				}
			})
		}

		$("#add").click(function() {
			
							let promotionResult = $("#promotionResult")
							let restaurantNum = $("#restaurantNum").val();
							let promotionName = $("#promotionName").val();
							let promotionDetail = $("#promotionDetail").val();
							let discount = $("#discount").val();
							
							let startDate = $("#select_year").val()
									+ $("#select_month").val()
									+ $("#select_day").val();
							let endDate = $("#select_yearEnd").val()
									+ $("#select_monthEnd").val()
									+ $("#select_dayEnd").val();
							
							
							let startYear = $("#select_year").val();
							let	startMonth =$("#select_month").val();
							let	startDay = $("#select_day").val();
							
							let	endYear =$("#select_yearEnd").val();
							let	endMonth =$("#select_monthEnd").val();
							let	endDay = $("#select_dayEnd").val();

							console.log(promotionName);
							console.log(promotionDetail);
							console.log(discount);
							console.log(endYear)
							console.log(startDate);
							console.log(endDate);

							/* promotionResult.append(promotionName);
							 promotionResult.append("promotionDetail",promotionDetail);
							 promotionResult.append("discount",discount);
							 promotionResult.append("startDate",startDate);
							 promotionResult.apeend("endDate",endDate); */

							$.ajax({
								type : "POST",
								url : "./add",
								
								data : {
									restaurantNum : restaurantNum,
									promotionName : promotionName,
									promotionDetail : promotionDetail,
									discount : discount,
									startYear : startYear,
									startMonth :startMonth,
									startDay :startDay,
									endYear :endYear,
									endMonth :endMonth,
									endDay :endDay
									
									
								//	startDate : startDate,
								//	endDate : endDate
								},
								success : function(data) {
								
									if(data.trim()=='1') {
										alert("상품 등록 완료");
										
										getList();
										$("#restaurantNum").val("");
										$("#promotionName").val("");
										$("#promotionDetail").val("");
										$("#discount").val("");
										$("#startDate").val("");
										$("#endDate").val("");

									}
								},
								error : function() {
									alert("error발생")
								}
							})

						})
	</script>


</body>
</html>