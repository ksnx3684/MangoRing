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

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">

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


    
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="../">MangoRing</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          
            <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
            <li class="nav-item active"><a href="about.html" class="nav-link">About</a></li>
            <li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li>
            <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
            <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
            <li class="nav-item cta"><a href="reservation.html" class="nav-link">Book a table</a></li>
        </ul>
        </div>
    </div>
    </nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">CartList</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>CartList <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

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
                                 <input class="check" id="cartNum" name="cartNum" type="checkbox" data-cartNum="${dto.cartNum}" value="${dto.cartNum}">&nbsp;
                                 <c:if test="${dto.menuVOs.menuFileVO.fileName ne null}">
                                   <a href="../product/detail?menuNum=${dto.menuNum}"><img class="image" src="../resources/upload/product/${dto.menuVOs.menuFileVO.fileName}" alt="Product"></a>
                                 </c:if>
                               </td>
                               <td class="cart_product_desc">
                                 <h5>${dto.menuVOs.name}</h5>${dto.menuVOs.restaurantVO.restaurantName}
                               </td>
                               <td class="cou">
                                <button type="button" class="minus" data-cartNum="${dto.cartNum}" value="${dto.menuCount}">-</button>
                                 <span class="count">${dto.menuCount}</span>
                                 <button type="button" class="plus" data-cartNum="${dto.cartNum}" value="${dto.menuCount}">+</button>
                               </td>
                               <td>
                                 <span class="price">${dto.menuVOs.price}</span>
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
                    url: "cartListDelete",
                    type: "post",
                    data: { checkbox : checkArr },
                    traditional : true,
                    success: function () {
                        location.href = "./cartList";
                    }
                });
                const frm = document.getElementsByClassName("frm");
                frm.submit();
            } else {
              //location.reload;
            }
        });


       
        
        $(".cou").children(".minus").on("click", function(){
          let cartNum = $(this).attr("data-cartNum");
          let count = $(this).val();
        	// console.log(cartNum);
          // alert(count);
          if(count < 2){
            alert("최소 1개 이상 주문 해야합니다")
          } else{
            $.ajax({
              url: "cartCountMinus",
              type: "post",
              data: { cartNum : cartNum },
              success: function(){
                location.href = "./cartList";
              }
        	  });
          }	
        });

        $(".cou").children(".plus").on("click", function(){
          let cartNum = $(this).attr("data-cartNum");
          let count = $(this).val();
        	// console.log(cartNum);
          // alert(count);
          if(count > 99){
            alert("최대 100개까지 가능합니다")
          } else{
            $.ajax({
              url: "cartCountPlus",
              type: "post",
              data: { cartNum : cartNum },
              success: function(){
                location.href = "./cartList";
              }
        	  });
          }	
        });
        
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
      <script src="../js/google-map.js"></script>
      <script src="../js/main.js"></script>


      <script type="text/javascript" src="../resources/js/cart/cartList.js"></script>
</body>
</html>