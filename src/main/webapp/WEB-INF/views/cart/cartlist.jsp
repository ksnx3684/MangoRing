<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 목록</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<!-- Cart table Area Start -->
       <div class="cart-table-area section-padding-100">
         <div class="container-fluid">
           <form id="frm" action="./cartList" method="post">
             <div class="row">
                 <div class="col-12 col-lg-8">
                     <div class="cart-title mt-50">
                       <h2>Shopping Cart</h2>
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
                           <c:forEach items="${cartList}" var="dto" varStatus="status">
                             <tr>
                               <td class="cart_product_img">
                                 <input class="check" name="cartNum" type="checkbox" data-cartNum="${dto.cartNum}" value="${dto.cartNum}">&nbsp;
                                 <c:if test="${dto.menuVOs.menuFileVO.fileName ne null}">
                                   <a href="../product/detail?menuNum=${dto.menuNum}"><img class="image" src="../resources/upload/product/${dto.menuVOs.menuFileVO.fileName}" alt="Product"></a>
                                 </c:if>
                               </td>
                               <td class="cart_product_desc">
                                 <h5>${dto.menuVOs.name}</h5>
                               </td>
                               <td class="count">
                                 <span>${dto.menuCount}</span>
                               </td>
                               <td class="price">
                                 <span>${dto.menuVOs.price}</span>
                               </td>
                             </tr>
                           </c:forEach>                                   
                         </tbody>
                       </table>
                     </div>
                 </div>
                 <div class="col-12 col-lg-4">
                   <div class="cart-summary">
                     <h5>Cart Total</h5>
                     <ul class="summary-table">
                       <li>
                         <span>total:</span>
                         <span>
                           <c:forEach items="${cartlist}">
                             <span class="totalPrice"></span>
                           </c:forEach>
                           <span class="totalPrice">원</span>
                         </span>
                       </li>
                     </ul>
                     <div class="cart-btn">
                       <a class="btn amado-btn w-100" id="selectOrder_btn2">
                         <span class="site-btn clear-btn">주문하기</span>
                       </a>
                       <form class="frm" action="./cartListDelete" method="post" style="display: inline;">
                         <a class="btn amado-btn w-100" id="selectDelete_btn" style="margin-top: 10px;">
                           <span class="site-btn clear-btn">선택 상품 삭제</span>
                         </a>
                       </form>
                     </div>
                   </div>
                 </div>
             </div>
           </form>
         </div>
       </div>
     <!-- Cart table Area End -->


	 <script>
        $("#selectDelete_btn").click(function () {
            let confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");
            if (confirm_val) {
                let checkArr = new Array();
                // let checkArr = [];
                $("input[class='check']:checked").each(function () {
                    checkArr.push($(this).attr("data-cartNum"));
                });
                $.ajax({
                    url: "cartlistDelete",
                    type: "post",
                    data: { checkbox : checkArr},
                    traditional : true,
                    success: function () {
                        location.href = "./cartlist";
                    }
                });
                const frm = document.getElementsByClassName("frm");
                frm.submit();
            } else {
              //location.reload;
            }
        });
      </script>

      <script type="text/javascript" src="../resources/js/cart/cartList.js"></script>

</body>
</html>