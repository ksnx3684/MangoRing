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

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
//	@Autowired
//	private MemberService memberService;
	
	List<CartVO> lists = new ArrayList<CartVO>(); // 카트에 담을 수 있는 전역변수 lists
	int totalsize = 0;

	// 장바구니 보기 (카트 목록 불러오기)
	@GetMapping("cartlist")
	public void cartlist(Model model, HttpSession httpSession) throws Exception{
//		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("member");
//		CartVO cartVO = memberDTO.getId();
//		List<CartVO> list = cartService.cartlist(cartVO);
//		
//		model.addAttribute("cartlist", list);
	}
	
	// 장바구니에서 선택 상품 제거
	@PostMapping("cartlistDelete")
	@ResponseBody
	public void cartlistDelete(HttpServletRequest request) throws Exception {
//		String[] cartNum = request.getParameterValues("checkbox");
//		List<String> cart = Arrays.asList(cartNum);
//	
//		int size = 1;
//		size = cart.size();
//		
//		for(int i = 0; i < size; i++) {
//			Long caNum = Long.parseLong(cart.get(i));
//			int result = cartService.cartlistDelete(caNum);
//		}
	}

	//장바구니에서 주문 폼으로 보내주기
	@PostMapping("cartlist")
	public String cartOrder(String[] cartNum, String[] optionContents) throws Exception {

//		int size = 1;
//		size = cartNum.length;
//		lists.clear(); // 초기화
//		
//		for(int i = 0; i < size; i++) {
//			Long result = Long.parseLong(cartNum[i]);
//			lists.add(cartService.cartOrder(result)); // lists에 담아서 주문 폼으로 전송
//		}
		
		return "redirect:./order";
	}
	
	// 주문 폼으로 가기
//	@GetMapping("order")
//	public void order(Model model, HttpSession httpSession) throws Exception {
//		
//		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("member");
//		
//		memberDTO = memberService.mypage(memberDTO);
//		
//		model.addAttribute("order", lists);
//		model.addAttribute("myinfo", memberDTO);
//		
//	}
	
	// 주문 처리
//	@PostMapping("order")
//	public String order(UsersOrderDTO usersOrderDTO, OrderDetailDTO orderDetailDTO, ProductDTO productDTO,
//			String payRequest, String[] cartNum, String[] productNum, String[] count, String[] optionContents) throws Exception {
//		
//		if(payRequest.equals("kakao")) { // 카카오페이
//			
//			return "redirect:../order/kakaoPay";
//			
//		} else if(payRequest.equals("naver")) { // 네이버페이
//			
//			return "redirect:../order/naverPay";
//		
//		} else { // 무통장입금
//			
//			cartService.order(usersOrderDTO); // 주문정보 DB로 전송
//
//			for(int i = 0; i < lists.size(); i++) {
//				orderDetailDTO.setProductNum(lists.get(i).getProductNum());
//				orderDetailDTO.setName(lists.get(i).getProductDTO().getName());
//				orderDetailDTO.setCount(lists.get(i).getProductCount());
//				orderDetailDTO.setPrice(lists.get(i).getProductDTO().getPrice());
//				if(optionlists.isEmpty()) {
//					orderDetailDTO.setOptionContents("0");
//				} //else if(optionlists.get(i)) {
//				else {
//					orderDetailDTO.setOptionContents(optionlists.get(i));
//				}
//				cartService.orderDetail(orderDetailDTO); // 주문정보 DB로 전송
//				
//				Long num = Long.parseLong(cartNum[i]);
//				cartService.cartlistDelete(num); // 주문완료된 상품을 카트에서 제거
//				
//				Integer ProductNum = Integer.parseInt(productNum[i]);
//				Integer currentStock = cartService.stock(ProductNum); // 상품의 현 재고 조회
//				Integer currentOptionStock = 0;
//				
//				if(optionContents != null) {
//					if(!optionContents[i].isEmpty()) {
//						optionDTO.setProductNum(ProductNum);
//						optionDTO.setOptionContents(optionContents[i]);
//						currentOptionStock = cartService.optionstock(optionDTO); // 옵션의 현 재고 조회
//					}
//				}
//				
//				Integer Count = Integer.parseInt(count[i]);
//				Integer productCount = currentStock - Count; // 주문한 상품수량만큼 재고에서 차감
//				productDTO.setStock(productCount);
//				productDTO.setProductNum(ProductNum);
//				cartService.stockUpdate(productDTO); // 상품의 재고 업데이트
//				
//				if(optionContents != null) {
//					if(!optionContents[i].isEmpty()) {
//						Integer optionCount = currentOptionStock - Count; // 주문한 상품수량만큼 옵션 재고에서 차감
//						optionDTO.setOptionStock(optionCount);
//						cartService.optionstock(optionDTO); // 옵션의 재고 업데이트
//					}
//				}
//			}
//			
//			return "redirect:../order/orderComplete";
//			
//		}
//		
//	}
}
