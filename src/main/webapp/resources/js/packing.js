let check = document.querySelectorAll(".check");
let total = new Array();
let count = document.querySelectorAll(".count");
let price = document.querySelectorAll(".price");
let totalPrice = document.querySelectorAll(".totalPrice");
let cc = 0;
let dd = 0;

let checkcheck = new Array();
const selectOrder_btn2 = document.getElementById("selectOrder_btn2");
const frm = document.getElementById("frm");
	

for(let i = 0; i < count.length; i++){
    check[i].addEventListener("click", function(){
        if(check[i].checked){
            checkcheck.push("1");
            console.log(checkcheck.length);
            console.log("click");
            let a = count[i].value;
            let b = price[i].textContent;
            console.log(a);
            const aa = Number(a);
            const bb = Number(b);
            total[i] = aa * bb;
            console.log(total[i]);
            
            function sum(){
                cc = total[i] + cc;
                const newText = document.createTextNode(cc); // newText에 cc값 담기
            
                totalPrice[0].textContent = ''; // 초기화
                totalPrice[0].appendChild(newText); // newText 출력
                
            };

            sum();
            
        } else{
            function sum2(){
                checkcheck.pop();
                console.log(checkcheck.length);
                console.log("unclick");

                cc = cc - total[i];
                console.log(cc);
                const newText2 = document.createTextNode(cc);
                totalPrice[0].textContent = ''; // 초기화
                totalPrice[0].appendChild(newText2);
            }
            sum2();

        }
    })
  
};

selectOrder_btn2.addEventListener("click", function(){
	if(!checkcheck.length > 0){
        alert("상품을 선택하십시오");
    } else{
		frm.submit();
	}
})

/*selectOrder_btn2.addEventListener("click", function(){
    if(!checkcheck.length > 0){
        alert("상품을 선택하십시오");
    } else{
        
        $.ajax({
			url: "./packing",
			type: "post",
			data:{

			},
			success: function(data){
				alert(data);
				if(data==1){
					alert("이미 장바구니에 다른 가게의 상품이 담겨있습니다.")
				} else if(data==2){
					alert("장바구니에 같은 상품이 있습니다.")
					location.href="../";
				} else {
					let check = confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하여 주문하시겠습니까?");
					if(check){
						location.href = "../cart/cartList";
					} else{
					}
				}
			}
		})
    }
});*/



$(".cou").children(".minus").on("click", function(){
  let count = Number($(this.nextSibling.nextSibling).val());

  if(count < 2){
    alert("최소 1개 이상 주문 해야합니다")
  } else{
    count -= 1;
    console.log(count);
    $(this.nextSibling.nextSibling).val(count);
  }	
});


$(".cou").children(".plus").on("click", function(){
  let count = Number($(this.previousSibling.previousSibling).val());

  if(count > 99){
    alert("최대 100개까지 가능합니다")
  } else{
    count += 1;
    console.log(count);
    $(this.previousSibling.previousSibling).val(count);
  }	
});
