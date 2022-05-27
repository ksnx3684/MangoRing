<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 결제</title>
</head>
<body>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	
	<script>
	    var IMP = window.IMP; // 생략 가능
	    IMP.init("imp73530197"); // 가맹점 식별 코드
	    IMP.request_pay({ // param
	      pg: "kakaopay.TC0ONETIME",
	      pay_method: "card",
	      merchant_uid: "${payNum}",
	      name: "TEST",
	      amount: ${totalPrice},
	      buyer_name: "${id}"
	  }, function (rsp) { // callback
	      if (rsp.success) {
	          var msg = "결제가 완료되었습니다";
	          location.href="./kakaoPayOrderComplete";
	      } else {
	          var msg = "결제에 실패하였습니다"
	          rsp.error_msg;
	      }
	  });
	</script>

</body>
</html>