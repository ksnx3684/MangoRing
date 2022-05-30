<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토스페이 결제</title>
<script src="https://js.tosspayments.com/v1"></script>
</head>
<body>
	<script type="text/javascript">
		var clientKey = 'test_ck_Lex6BJGQOVDyAW9g0EOrW4w2zNbg'
		var tossPayments = TossPayments(clientKey)
		tossPayments.requestPayment('카드', { // 결제 수단 파라미터
		  // 결제 정보 파라미터
		  amount: ${totalPrice},
		  orderId: 'FlhL9qMPNv151V7aT8s-m',
		  orderName: '${name}',
		  customerName: '${id}',
		  successUrl: 'http://localhost/cart/tossPayOrderComplete',
		  failUrl: 'http://localhost:8080/fail',
		})

	</script>
	

</body>
</html>