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

	
	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper">

		<c:import url="../template/header.jsp"></c:import>
		
		<!-- Order table Area Start -->
		<div class="cart-table-area section-padding-100">
	        <div class="container-fluid">
	            <form id="frm" action="./order" method="post" enctype="multipart/form-data">
	                <div class="row">
	                    <div class="col-12 col-lg-8">
	                        <div class="cart-title mt-50">
	                            <h2>Order</h2>
	                        </div>
	                        <div class="cart-table clearfix">
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
	                                            <input type="hidden" name="cartNum" value="${dto.cartNum}">
	                                            <input type="hidden" name="menuNum" value="${dto.menuNum}">
	                                            <td class="cart_product_img"><input type="hidden" name="name" value="${dto.menuVOs.name}">
	                                                <c:if test="${dto.menuVOs.menuFileVO.fileName ne null}">
	                                                    <a href="../product/detail?menuNum=${dto.menuNum}"><img class="image" src="../resources/upload/product/${dto.menuVOs.menuFileVO.fileName}" alt="Product"></a>
	                                                </c:if>
	                                            </td>
	                                            <td class="cart_product_desc">
	                                                <h5>${dto.menuVOs.name}</h5>
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
	                    <div class="col-12 col-lg-4">
	                        <div class="cart-summary">
	                            <h5>Order Total</h5>
	                            <ul class="summary-table">
	                                <li><span>delivery:</span> <span class="deliver"></span></li>
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
	                                <a href="./cartList" class="btn amado-btn w-100" id="cart">
	                                    <span class="site-btn clear-btn">카트로 돌아가기</span>
	                                </a>
	                            </div>
	                        </div>
	                        
	                        <div class="cart-summary" style="margin-top: 30px;">
	                            <h5>결제수단</h5>
	                            <ul class="summary-table">
	                                <label><input type="radio" name="payment" id="kakaobtn" onclick="payDisplayView('0')" value="kakao" checked>&nbsp;<img src="../resources/img/payment_icon_yellow_medium.png" style="width:60px; height:25px">&nbsp;카카오페이</label><br><br>
	                                <label><input type="radio" name="payment" id="naverbtn" onclick="payDisplayView('1')" value="naver">&nbsp;<img src="../resources/img/naverpay.png" style="width:74px; height:18px">&nbsp;네이버페이</label><br><br>
	                                <label><input type="radio" name="payment" id="cashbtn" onclick="payDisplayView('2')" value="cash">&nbsp;무통장입금</label>
	                                
	                                <div id="kakaopay">
	                                    <input type="hidden" name="cardName" id="kakao" value="카카오페이">
	                                    <input type="hidden" name="cardNum" id="cardNum1" value="0">
	                                    <input type="hidden" name="cardExp" id="cardExp1" value="2022/01/01">
	                                </div>
	                                <div id="naverpay" style="display:none">
	                                    <input type="hidden" name="cardName" id="kakao" value="네이버페이" disabled>
	                                    <input type="hidden" name="cardNum" id="cardNum2" value="1" disabled>
	                                    <input type="hidden" name="cardExp" id="cardExp2" value="2022/01/01" disabled>
	                                </div>
	                                <div id="cashpay" style="display:none">
	                                    <input type="hidden" name="cardName" id="cash" value="무통장입금" disabled>
	                                    <input type="hidden" name="cardNum" id="cardNum3" value="2" disabled>
	                                    <input type="hidden" name="cardExp" id="cardExp3" value="2022/01/01" disabled>
	                                    <div>입금계좌 : 신한은행 이병훈 111-111111-11-111</div>
	                                </div>
	                                <br>
	                                <div>전자상거래법 제 8조 제2항에 동의하고 결제합니다.</div>
	                                <br>
	                                <div id="kakaoPayConfirm">
	                                    <input type="hidden" name="payRequest" id="payRequest1" value="kakao">
	                                    <!-- <button id="kakaoPay" class="btn btn-primary">결제하기</button> -->
	                                    <div class="cart-btn">
	                                        <a id="kakaoPay" class="btn amado-btn w-100">
	                                            <span class="site-btn clear-btn">주문하기</span>
	                                        </a>
	                                    </div>
	                                </div>
	                                <div id="naverPayConfirm" style="display:none">
	                                    <input type="hidden" name="payRequest" id="payRequest2" value="naver" disabled>
	                                    <!-- <button id="naverPay" class="btn btn-primary">결제하기</button> -->
	                                    <div class="cart-btn">
	                                        <a id="naverPay" class="btn amado-btn w-100">
	                                            <span class="site-btn clear-btn">주문하기</span>
	                                        </a>
	                                    </div>
	                                </div>
	                        
	                                <div id="cashPayConfirm" style="display:none">
	                                    <input type="hidden" name="payRequest" id="payRequest3" value="cash" disabled>
	                                    <!-- <button id="cashPay" class="btn btn-primary">결제하기</button> -->
	                                    <div class="cart-btn">
	                                        <a id="cashPay" class="btn amado-btn w-100">
	                                            <span class="site-btn clear-btn">주문하기</span>
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
            let naverpay = document.getElementById("naverpay"); // 네이버페이
            let naverPayConfirm = document.getElementById("naverPayConfirm"); // 네이버페이 버튼
            let cashpay = document.getElementById("cashpay"); // 무통장입금
            let cahsPayConfirm = document.getElementById("cashPayConfirm"); // 무통장입금 버튼
            if(select == 0){ // 카카오페이
                kakaopay.style.display = 'block';
                kakaoPayConfirm.style.display = 'block';
                naverpay.style.display = 'none';
                naverPayConfirm.style.display = 'none';
                cashpay.style.display = 'none';
                cashPayConfirm.style.display = 'none';
                $('#kakao').attr('disabled', false); // 카카오페이 cardName 활성화
                $('#cardNum1').attr('disabled', false); // 카카오페이 cardNum1 활성화
                $('#cardExp1').attr('disabled', false); // 카카오페이 cardExp1 활성화
                $('#payRequest1').attr('disabled', false); // 카카오페이 요청 활성화
                $('#naver').attr('disabled', true); // 네이버페이 cardName 비활성
                $('#cardNum2').attr('disabled', true); // 네이버페이 cardNum2 비활성
                $('#cardExp2').attr('disabled', true); // 네이버페이 cardExp2 비활성
                $('#payRequest2').attr('disabled', true); // 네이버페이 요청 비활성
                $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                $('#cardNum3').attr('disabled', true); // 무통장입금 cardNum3 비활성
                $('#cardExp3').attr('disabled', true); // 무통장입금 cardExp3 비활성
                $('#payRequest3').attr('disabled', true); // 무통장입금 요청 비활성
            } else if(select == 1) { // 네이버페이
                kakaopay.style.display = 'none';
                kakaoPayConfirm.style.display = 'none';
                naverpay.style.display = 'block';
                naverPayConfirm.style.display = 'block';
                cashpay.style.display = 'none';
                cashPayConfirm.style.display = 'none';
                $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                $('#naver').attr('disabled', false); // 네이버페이 cardName 활성화
                $('#cardNum2').attr('disabled', false); // 네이버페이 cardNum2 활성화
                $('#cardExp2').attr('disabled', false); // 네이버페이 cardExp2 활성화
                $('#payRequest2').attr('disabled', false); // 네이버페이 요청 활성화
                $('#cash').attr('disabled', true); // 무통장입금 cardName 비활성
                $('#cardNum3').attr('disabled', true); // 무통장입금 cardNum3 비활성
                $('#cardExp3').attr('disabled', true); // 무통장입금 cardExp3 비활성
                $('#payRequest3').attr('disabled', true); // 무통장입금 요청 비활성
            } else { // 무통장입금
                kakaopay.style.display = 'none';
                kakaoPayConfirm.style.display = 'none';
                naverpay.style.display = 'none';
                naverPayConfirm.style.display = 'none';
                cashpay.style.display = 'block';
                cashPayConfirm.style.display = 'block';
                $('#kakao').attr('disabled', true); // 카카오페이 cardName 비활성
                $('#cardNum1').attr('disabled', true); // 카카오페이 cardNum1 비활성
                $('#cardExp1').attr('disabled', true); // 카카오페이 cardExp1 비활성
                $('#payRequest1').attr('disabled', true); // 카카오페이 요청 비활성
                $('#naver').attr('disabled', true); // 네이버페이 cardName 비활성
                $('#cardNum2').attr('disabled', true); // 네이버페이 cardNum2 비활성
                $('#cardExp2').attr('disabled', true); // 네이버페이 cardExp2 비활성
                $('#payRequest2').attr('disabled', true); // 네이버페이 요청 비활성
                $('#cash').attr('disabled', false); // 무통장입금 cardName 활성화
                $('#cardNum3').attr('disabled', false); // 무통장입금 cardNum3 활성화
                $('#cardExp3').attr('disabled', false); // 무통장입금 cardExp3 활성화
                $('#payRequest3').attr('disabled', false); // 무통장입금 요청 활성화               
            }
        }
    </script>

	<script type="text/javascript" src="../resources/js/cart/order.js"></script>
</body>
</html>