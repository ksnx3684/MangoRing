package com.project.mango.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mango.cart.CartService;
import com.project.mango.member.MemberVO;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;

//	// 카카오페이 결제 진행 화면
//	@GetMapping("kakaoPay")
//	public void kakaoPay(Model model, HttpSession httpSession) throws Exception{
//		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
//		
//		orderService.preKakao();
//		Long payNum = orderService.payNumInquery(memberVO);
//		
//		
//		model.addAttribute("payNum", payNum);
//	}
//	
//	// 네이버페이 결제 진행 화면
//	@GetMapping("naverPay")
//	public void naverPay() throws Exception{
//	}
	
	// 주문 완료 폼
	@GetMapping("orderComplete")
	public void orderComplete() throws Exception{
	}
	
}
