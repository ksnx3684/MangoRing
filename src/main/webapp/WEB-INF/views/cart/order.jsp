<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<style>
		body.modal-open {
			overflow: auto;
		}
		body.modal-open[style] {
			padding-right: 0px !important;
		}
		.container{
			margin-top: 50px;
			margin-bottom: 50px;
		}
	</style>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="../resources/css/order.css">

	<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('../resources/img/alexander-schimmeck-H_KabGs8FMw-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Order</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Order <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper">
		
		<!-- Order table Area Start -->
		<div class="order-table-area section-padding-100">
	        <div class="container-fluid">
	            <form id="frm" action="./order" method="post" enctype="multipart/form-data">
	                <div class="row">
	                    <div class="col-12 col-lg-5">
	                        <div class="cart-title mt-50">
	                            <h2>Order</h2>
	                        </div>
	                        <div class="order-table clearfix">
	                            <table class="table table-responsive">
	                                <thead>
	                                    <tr>
	                                        <th></th>
	                                        <th>상품명</th>
	                                        <th>갯수</th>
	                                        <th>가격</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:forEach items="${order}" var="dto" varStatus="status">
	                                        <tr class="contents">
	                                            <%-- <input type="hidden" name="cartNum" value="${dto.cartNum}"> --%>
	                                            <input type="hidden" name="menuNum" value="${dto.menuNum}">
	                                            <td class="cart_product_img"><input type="hidden" name="name" value="${dto.menuVOs.name}">
	                                                <c:if test="${dto.menuVOs.menuFileVO.fileName ne null}">
	                                                    <a href="../product/detail?menuNum=${dto.menuNum}"><img class="image" src="../resources/upload/product/${dto.menuVOs.menuFileVO.fileName}" alt="Product"></a>
	                                                </c:if>
	                                            </td>
	                                            <td class="cart_product_desc">
	                                            	<input type="hidden" name="restaurantNum" value="${dto.menuVOs.restaurantNum}">
	                                                <h5>${dto.menuVOs.name}</h5>${dto.menuVOs.restaurantVO.restaurantName}
	                                            </td>
	                                            <td class="count">
	                                                <input type="hidden" name="menuCount" value="${dto.menuCount}">
	                                                <span>${dto.menuCount}</span>
	                                            </td>
	                                            <td class="price">
	                                                <input type="hidden" name="price" value="${dto.menuVOs.price}">
	                                                <span>${dto.menuVOs.price}</span>
	                                            </td>
	                                        </tr>
	                                    </c:forEach>                                   
	                                </tbody>
	                            </table>
	                            <input type="hidden" name="id" id="id" value="${myinfo.id}" readonly>
	                            <input type="hidden" name="orderCheck" id="orderCheck" value="0" readonly>
	                            <input type="hidden" name="payCheck" id="payCheck" value="0" readonly>
	                        </div>
	                    </div>
	                    
	                    <div class="col-12 col-lg-3">
	                        <div class="cart-summary">
	                            <h2>Order Total</h2>
	                            <ul class="summary-table">
	                                <!-- <li><span>delivery:</span> <span class="deliver"></span></li> -->
	                                <li>
	                                    <span>total:</span>
	                                    <span>
	                                        <c:forEach items="${cartList}">
	                                            <span class="totalPrice"></span>
	                                        </c:forEach>
	                                        <span class="totalPrice"></span>&nbsp;원
	                                    </span>
	                                </li>
	                            </ul>
	                            <div class="cart-btn">
	                                <a href="./packing?restaurantNum=${order[0].menuVOs.restaurantNum}" class="btn amado-btn w-100" id="cart" style="color: white">
	                                    <span class="site-btn clear-btn">이전 단계</span>
	                                </a>
	                            </div>
	                        </div>
	                   	</div>
	                   	
	                    <div class="col-12 col-lg-4">
	                        <div class="cart-summary">
	                            <h2>Payment</h2>
	                            <ul class="summary-table">
	                                <label><input type="radio" name="payment" id="kakaobtn" onclick="payDisplayView('0')" value="kakao" checked>&nbsp;<img src="../resources/img/카카오페이_CI_logotype.png" style="width:20%; height:20%">&nbsp;카카오페이</label><br><br>
	                                <label><input type="radio" name="payment" id="tossbtn" onclick="payDisplayView('1')" value="toss">&nbsp;<img src="../resources/img/logo-toss-blue.png" style="width:20%; height:20%">&nbsp;토스페이</label><br><br>
	                                <label><input type="radio" name="payment" id="cashbtn" onclick="payDisplayView('2')" value="cash">&nbsp;무통장입금</label>
	                                
	                                <div id="kakaopay">
	                                    <input type="hidden" name="cardName" id="kakao" value="카카오페이">
	                                    <input type="hidden" name="cardNum" id="cardNum1" value="0">
	                                    <input type="hidden" name="cardExp" id="cardExp1" value="2022/01/01">
	                                </div>
	                                <div id="tosspay" style="display:none">
	                                    <input type="hidden" name="cardName" id="kakao" value="토스페이" disabled>
	                                    <input type="hidden" name="cardNum" id="cardNum2" value="1" disabled>
	                                    <input type="hidden" name="cardExp" id="cardExp2" value="2022/01/01" disabled>
	                                </div>
	                                <div id="cashpay" style="display:none">
	                                    <input type="hidden" name="cardName" id="cash" value="무통장입금" disabled>
	                                    <input type="hidden" name="cardNum" id="cardNum3" value="2" disabled>
	                                    <input type="hidden" name="cardExp" id="cardExp3" value="2022/01/01" disabled>
	                                    <div>입금계좌 : XX은행 홍길동 ${accountnumber}</div>
	                                </div>
	                                <br>
	                                <div>전자상거래법 제 8조 제2항에 동의하고 결제합니다.</div>
	                                <br>
	                                <div id="kakaoPayConfirm">
	                                    <input type="hidden" name="payRequest" id="payRequest1" value="kakao">
	                                    <!-- <button id="kakaoPay" class="btn btn-primary">결제하기</button> -->
	                                    <div class="cart-btn">
	                                        <a id="kakaoPay" class="btn amado-btn w-100">
	                                            <span class="site-btn clear-btn">결제하기</span>
	                                        </a>
	                                    </div>
	                                </div>
	                                <div id="tossPayConfirm" style="display:none">
	                                    <input type="hidden" name="payRequest" id="payRequest2" value="toss" disabled>
	                                    <!-- <button id="tossPay" class="btn btn-primary">결제하기</button> -->
	                                    <div class="cart-btn">
	                                        <a id="tossPay" class="btn amado-btn w-100">
	                                            <span class="site-btn clear-btn">결제하기</span>
	                                        </a>
	                                    </div>
	                                </div>
	                        
	                                <div id="cashPayConfirm" style="display:none">
	                                    <input type="hidden" name="payRequest" id="payRequest3" value="cash" disabled>
	                                    <!-- <button id="cashPay" class="btn btn-primary">결제하기</button> -->
	                                    <div class="cart-btn">
	                                        <a id="cashPay" class="btn amado-btn w-100">
	                                            <span class="site-btn clear-btn">결제하기</span>
	                                        </a>
	                                    </div>
	                                </div>
	                            </ul>
	                            <!-- <div class="cart-btn">
	                                <a class="btn amado-btn w-100" id="selectOrder_btn2" style="color: white;">
	                                    <span class="site-btn clear-btn">주문하기</span>
	                                </a>
	                            </div> -->
	                        </div>
	                    </div>
	                    
	                </div>
	            </form>
	        </div>
	    </div>
		<!-- Order table Area End -->
	
	</div>
	<!-- ##### Main Content Wrapper End ##### -->
	
	<script>
        function displayView(select){
            let defaultAddress = document.getElementById("defaultAddress"); // 기본배송지
            let newAddress = document.getElementById("newAddress"); // 새로입력
            if(select == 0){ // 기본배송지
                defaultAddress.style.display = 'block';
                newAddress.style.display = 'none';
                $('#postCode1').attr('disabled', false); // 기본배송지의 우편번호 활성화
                $('#address1').attr('disabled', false); // 기본배송지의 주소 활성화
                $('#detailAddress1').attr('disabled', false); // 기본배송지의 상세주소 활성화
                $('#extraAddress1').attr('disabled', false); // 기본배송지의 참고항목 활성화
                $('#postCode2').attr('disabled', true); // 새로입력의 우편번호 비활성
                $('#address2').attr('disabled', true); // 새로입력의 주소 비활성
                $('#detailAddress2').attr('disabled', true); // 새로입력의 상세주소 비활성
                $('#extraAddress2').attr('disabled', true); // 새로입력의 참고항목 비활성
                
            } else { // 새로입력
                defaultAddress.style.display = 'none';
                newAddress.style.display = 'block';
                $('#postCode1').attr('disabled', true); // 기본배송지의 우편번호 비활성
                $('#address1').attr('disabled', true); // 새로입력의 주소 비활성
                $('#detailAddress1').attr('disabled', true); // 새로입력의 상세주소 비활성
                $('#extraAddress1').attr('disabled', true); // 새로입력의 참고항목 비활성
                $('#postCode2').attr('disabled', false); // 새로입력의 우편번호 활성화
                $('#address2').attr('disabled', false); // 새로입력의 주소 활성화
                $('#detailAddress2').attr('disabled', false); // 새로입력의 상세주소 활성화
                $('#extraAddress2').attr('disabled', false); // 새로입력의 참고항목 활성화
            }
        }
    </script>

    <script>
        function payDisplayView(select){
            let kakaopay = document.getElementById("kakaopay"); // 카카오페이
            let kakaoPayConfirm = document.getElementById("kakaoPayConfirm") // 카카오페이 버튼
            let tosspay = document.getElementById("tosspay"); // 토스페이
            let tossPayConfirm = document.getElementById("tossPayConfirm"); // 토스페이 버튼
            let cashpay = document.getElementById("cashpay"); // 무통장입금
            let cahsPayConfirm = document.getElementById("cashPayConfirm"); // 무통장입금 버튼
            if(select == 0){ // 카카오페이
                kakaopay.style.display = 'block';
                kakaoPayConfirm.style.display = 'block';
                tosspay.style.display = 'none';
                tossPayConfirm.style.display = 'none';
                cashpay.style.display = 'none';
                cashPayConfirm.style.display = 'none';
                $('#kakao').attr('disabled', false); // 카카오페이 cardName 활성화
                $('#cardNum1').attr('disabled', false); // 카카오페이 cardNum1 활성화
                $('#cardExp1').attr('disabled', false); // 카카오페이 cardExp1 활성화
                $('#payRequest1').attr('disabled', false); // 카카오페이 요청 활성화
                $('#toss').attr('disabled', true); // 토스페이 cardName 비활성
                $('#cardNum2').attr('disabled', true); // 토스페이 cardNum2 비활성
                $('#cardExp2').attr('disabled', true); // 토스페이 cardExp2 비활성
                $('#payRequest2').attr('disabled', true); // 토스페이 요청 비활성
                $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                $('#cardNum3').attr('disabled', true); // 무통장입금 cardNum3 비활성
                $('#cardExp3').attr('disabled', true); // 무통장입금 cardExp3 비활성
                $('#payRequest3').attr('disabled', true); // 무통장입금 요청 비활성
            } else if(select == 1) { // 토스페이
                kakaopay.style.display = 'none';
                kakaoPayConfirm.style.display = 'none';
                tosspay.style.display = 'block';
                tossPayConfirm.style.display = 'block';
                cashpay.style.display = 'none';
                cashPayConfirm.style.display = 'none';
                $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                $('#toss').attr('disabled', false); // 토스페이 cardName 활성화
                $('#cardNum2').attr('disabled', false); // 토스페이 cardNum2 활성화
                $('#cardExp2').attr('disabled', false); // 토스페이 cardExp2 활성화
                $('#payRequest2').attr('disabled', false); // 토스페이 요청 활성화
                $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                $('#cardNum3').attr('disabled', true); // 무통장입금 cardNum3 비활성
                $('#cardExp3').attr('disabled', true); // 무통장입금 cardExp3 비활성
                $('#payRequest3').attr('disabled', true); // 무통장입금 요청 비활성
            } else { // 무통장입금
                kakaopay.style.display = 'none';
                kakaoPayConfirm.style.display = 'none';
                tosspay.style.display = 'none';
                tossPayConfirm.style.display = 'none';
                cashpay.style.display = 'block';
                cashPayConfirm.style.display = 'block';
                $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                $('#toss').attr('disabled', true); // 토스페이 cardName 비활성
                $('#cardNum2').attr('disabled', true); // 토스페이 cardNum2 비활성
                $('#cardExp2').attr('disabled', true); // 토스페이 cardExp2 비활성
                $('#payRequest2').attr('disabled', true); // 토스페이 요청 비활성
                $('#cash').attr('disabled', false); // 무통장입금 cardName 활성화
                $('#cardNum3').attr('disabled', false); // 무통장입금 cardNum3 활성화
                $('#cardExp3').attr('disabled', false); // 무통장입금 cardExp3 활성화
                $('#payRequest3').attr('disabled', false); // 무통장입금 요청 활성화               
            }
        }
    </script>

		<footer class="ftco-footer ftco-bg-dark ftco-section">
			<div class="container-fluid px-md-5 px-3">
			<div class="row mb-5">
			<div class="col-md-6 col-lg-3">
				<div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Appetizer</h2>
				<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
				<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
				<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
				<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
				<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
				</ul>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Open Hours</h2>
				<ul class="list-unstyled open-hours">
				<li class="d-flex"><span>Monday</span><span>9:00 - 24:00</span></li>
				<li class="d-flex"><span>Tuesday</span><span>9:00 - 24:00</span></li>
				<li class="d-flex"><span>Wednesday</span><span>9:00 - 24:00</span></li>
				<li class="d-flex"><span>Thursday</span><span>9:00 - 24:00</span></li>
				<li class="d-flex"><span>Friday</span><span>9:00 - 02:00</span></li>
				<li class="d-flex"><span>Saturday</span><span>9:00 - 02:00</span></li>
				<li class="d-flex"><span>Sunday</span><span> 9:00 - 02:00</span></li>
				</ul>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Newsletter</h2>
				<p>Far far away, behind the word mountains, far from the countries.</p>
				<form action="#" class="subscribe-form">
				<div class="form-group">
				<input type="text" class="form-control mb-2 text-center" placeholder="Enter email address">
				<input type="submit" value="Subscribe" class="form-control submit px-3">
				</div>
				</form>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">Instagram</h2>
				<div class="thumb d-sm-flex">
					<a href="#" class="thumb-menu img" style="background-image: url(images/insta-1.jpg);">
					</a>
					<a href="#" class="thumb-menu img" style="background-image: url(images/insta-2.jpg);">
					</a>
					<a href="#" class="thumb-menu img" style="background-image: url(images/insta-3.jpg);">
					</a>
				</div>
				<div class="thumb d-flex">
					<a href="#" class="thumb-menu img" style="background-image: url(images/insta-4.jpg);">
					</a>
					<a href="#" class="thumb-menu img" style="background-image: url(images/insta-5.jpg);">
					</a>
					<a href="#" class="thumb-menu img" style="background-image: url(images/insta-6.jpg);">
					</a>
				</div>
				</div>
			</div>
			</div>
			<div class="row">
			<div class="col-md-12 text-center">

				<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
		<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
			</div>
			</div>
			</footer>


		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


		<script src="../js/jquery.min.js"></script>
		<script src="../js/jquery-migrate-3.0.1.min.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/jquery.easing.1.3.js"></script>
		<script src="../js/jquery.waypoints.min.js"></script>
		<script src="../js/jquery.stellar.min.js"></script>
		<script src="../js/owl.carousel.min.js"></script>
		<script src="../js/jquery.magnific-popup.min.js"></script>
		<script src="../js/aos.js"></script>
		<script src="../js/jquery.animateNumber.min.js"></script>
		<script src="../js/bootstrap-datepicker.js"></script>
		<script src="../js/jquery.timepicker.min.js"></script>
		<script src="../js/scrollax.min.js"></script>
		<!-- <script src="../js/google-map.js"></script> -->
		<script src="../js/main.js"></script>


		<script type="text/javascript" src="../resources/js/cart/order.js"></script>
</body>
</html>