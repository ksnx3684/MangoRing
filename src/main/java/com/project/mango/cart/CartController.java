package com.project.mango.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.mango.member.MemberService;
import com.project.mango.member.MemberVO;
import com.project.mango.menu.MenuVO;
import com.project.mango.order.PaymentDetailVO;
import com.project.mango.order.PaymentVO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	List<CartVO> lists = new ArrayList<CartVO>(); // 카트에 담을 수 있는 전역변수 lists
	int totalsize = 0;

	// 장바구니 보기 (카트 목록 불러오기)
	@GetMapping("cartList")
	public void cartList(Model model, HttpSession httpSession) throws Exception{
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
		CartVO cartVO = new CartVO();
		cartVO.setId(memberVO.getId());
		List<CartVO> list = cartService.cartList(cartVO);
		
		model.addAttribute("cartList", list);
	}
	
	// 장바구니에서 선택 상품 제거
	@PostMapping("cartListDelete")
	@ResponseBody
	public void cartListDelete(HttpServletRequest request) throws Exception {
		String[] cartNum = request.getParameterValues("checkbox");
		List<String> cart = Arrays.asList(cartNum);
	
		int size = 1;
		size = cart.size();
		
		for(int i = 0; i < size; i++) {
			Long caNum = Long.parseLong(cart.get(i));
			int result = cartService.cartListDelete(caNum);
		}
	}

	//장바구니에서 주문 폼으로 보내주기
	@PostMapping("cartList")
	public String cartOrder(String[] cartNum) throws Exception {

		int size = 1;
		size = cartNum.length;
		lists.clear(); // 초기화
		
		for(int i = 0; i < size; i++) {
			Long result = Long.parseLong(cartNum[i]);
			lists.add(cartService.cartOrder(result)); // lists에 담아서 주문 폼으로 전송
		}
		
		return "redirect:./order";
	}
	
	// 주문 폼으로 가기
	@GetMapping("order")
	public void order(Model model, HttpSession httpSession) throws Exception {
		
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
		
		model.addAttribute("order", lists);
		model.addAttribute("myinfo", memberVO);
		
	}
	
	// 주문 처리
	@PostMapping("order")
	public String order(PaymentVO paymentVO, MenuVO menuVO,
			String payRequest, String[] cartNum, String[] menuNum, String[] menuCount) throws Exception {
		
		if(payRequest.equals("kakao")) { // 카카오페이 결제 페이지 이동
			
			return "forward:../order/kakaoPay";
			
		} else if(payRequest.equals("naver")) { // 네이버페이 결제 페이지 이동
			
			return "redirect:../order/naverPay";
		
		} else { // 무통장입금 결제 진행

			cartService.order(paymentVO); // 주문정보 DB로 전송

			for(int i = 0; i < lists.size(); i++) {
				
				Long caNum = Long.parseLong(cartNum[i]);
				Long meNum = Long.parseLong(menuNum[i]);
				Long meCount = Long.parseLong(menuCount[i]);
				
				PaymentDetailVO paymentDetailVO = new PaymentDetailVO();
				paymentDetailVO.setMenuNum(meNum);
				paymentDetailVO.setMenuCount(meCount);
				
				cartService.detailOrder(paymentDetailVO); // 주문정보 DB로 전송
				
				// cartService.cartListDelete(caNum); // 주문완료된 상품을 카트에서 제거
				
			}
			
			return "redirect:../order/orderComplete";
			
		}
		
	}
}
