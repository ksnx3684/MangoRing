<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 주문</title>
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
    
    <link rel="stylesheet" href="../resources/css/packing.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">
	
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

    <section class="hero-wrap hero-wrap-2" style="background-image: url('../resources/img/caroline-attwood-kC9KUtSiflw-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Packing Order</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Packing Order <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    
    <!-- Menu table Area Start -->
    <div class="menu-table-area section-padding-100">
      <div class="container-fluid">
        <form id="frm" action="./packing" method="post">
          <div class="row orderarea">
              <div class="menu col-12 col-lg-5">
                  <div class="menu-title mt-50">
                    <h2>Menu</h2>
                    <input type="hidden" name="restaurantNum" value="${restaurantNum}">
                  </div>
                  <div class="menu-table clearfix">
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
                            <td class="menu_product_img">
                              <input class="check" id="cartNum" name="cartNum" type="checkbox" data-menuNum="${dto.cartNum}" value="${dto.cartNum}">&nbsp;
                              <div class="imagebox">
	                              <c:if test="${dto.menuVOs.menuFileVO.fileName ne null}">
		                              <a href="../resources/upload/menu/${dto.menuVOs.menuFileVO.fileName}" data-fancybox>
		                                <img class="image" src="../resources/upload/menu/${dto.menuVOs.menuFileVO.fileName}" alt="Product"></a>
		                              </a>
	                              </c:if>
                              </div>
                            </td>
                            <td class="menu_product_desc">
                              <h5 class="name">${dto.menuVOs.name}</h5>
                            </td>
                            <td class="cou">
                             <button type="button" class="minus btn btn-warning" data-cartNum="${dto.cartNum}" value="${dto.menuCount}">-</button>
                              <input type="text" name="menuCount" class="count" value="${dto.menuCount}" readonly style="width:30px">
                              <button type="button" class="plus btn btn-warning" data-cartNum="${dto.cartNum}" value="${dto.menuCount}">+</button>
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
	              <div class="promotion">
		              <h2>Promotion</h2>
		              	<c:if test="${prolist ne null}">
		              		<button class="btn btn-warning commit" type="button" onclick="commit()">선택 적용</button>
		              		<button class="btn btn-warning deselect" type="button" onclick="deselect()">선택 해제</button>
		              		<hr>
		              	</c:if>
			              <c:forEach items="${prolist}" var="list" varStatus="status">
		              		<div>
		              			<label>
				              	<input class="promotionCheck" id="promotionNum" name="discount" type="radio" value="${list.discount}">&nbsp;
				              		${list.promotionName}
				              	</label><br>
				              	- ${list.promotionDetail}<br>
				              	<기간 : ${list.startDate} ~ ${list.endDate}><br>
				              	${list.discount}
				          	</div>
			              </c:forEach>
	              </div>
	         </div>
              
              
              <div class="totalprice col-12 col-lg-3">
                <div class="packing-summary">
                  <h2>Total</h2>
                  <ul class="summary-table">
                    <li>
                      <span>total:</span>
                      <span>
                        <span class="totalPrice">0</span>
                        원
                      </span>
                    </li>
                  </ul>
                  <div class="packing-btn">
                    <a class="btn amado-btn w-100" id="selectOrder_btn2" >
                      <span class="site-btn clear-btn">주문하기</span>
                    </a>
                  </div>
                </div>
              </div>
          </div>
        </form>
      </div>
    </div>
    <!-- Cart table Area End -->
    
    <script>
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
		        location.href = "./packing?restaurantNum=${restaurantNum}";
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
		      data: { cartNum: cartNum },
		      success: function(){
		        location.href = "./packing?restaurantNum=${restaurantNum}";
		      }
			  });
		  }	
		});
		
		function commit(){
			let discount = ${"promotionCheck"}.val();
		 $.ajax({
		      url: "procommit",
		      type: "post",
		      data: { discount : discount,
		    	  		cartNum : 
					},
		      success: function(){
		        location.href = "./packing?restaurantNum=${restaurantNum}";
		      }
			  });
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
     <script src="../js/google-map.js"></script>
     <script src="../js/main.js"></script>
     

	<script type="text/javascript" src="../resources/js/packing.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
</body>
</html>