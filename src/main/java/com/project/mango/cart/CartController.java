package com.project.mango.cart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
	PaymentVO data = new PaymentVO();
	List<PaymentDetailVO> detailDatas = new ArrayList<PaymentDetailVO>();
	List<Long> kacaNum = new ArrayList<Long>();

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
	public String order(Model model, PaymentVO paymentVO, MenuVO menuVO,
			String payRequest, String[] cartNum, String[] menuNum, String[] menuCount) throws Exception {
		
		// 주문번호 생성
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd-HHmmssS");
		String code = simpleDateFormat.format(date);
		paymentVO.setPayNum(code);
		
		// 전역변수 data에 값 집어넣기 (해당 작업은 카카오 및 네이버페이로 인한 결제정보를 DB에 넣어주기 위한 선행작업임)
		data.setPayNum(code); // 주문번호
		data.setTotalPrice(paymentVO.getTotalPrice()); // 총 금액
		data.setId(paymentVO.getId()); // 아이디
		
		if(payRequest.equals("kakao")) { // 카카오페이 결제 페이지 이동
			
			for(int i = 0; i < lists.size(); i++) {
				
				kacaNum.add(i, Long.parseLong(cartNum[i]));
				Long meNum = Long.parseLong(menuNum[i]);
				Long meCount = Long.parseLong(menuCount[i]);
				
				PaymentDetailVO detail = new PaymentDetailVO();
				detail.setPayNum(code);
				detail.setMenuNum(meNum);
				detail.setMenuCount(meCount);
				
				detailDatas.add(i, detail);
			
			}
			
			return "redirect:./kakaoPay";
			
		} else if(payRequest.equals("naver")) { // 네이버페이 결제 페이지 이동
			
			return "redirect:./naverPay";
		
		} else { // 무통장입금 결제 진행

			cartService.order(paymentVO); // 주문정보 DB로 전송

			for(int i = 0; i < lists.size(); i++) {
				
				Long caNum = Long.parseLong(cartNum[i]);
				Long meNum = Long.parseLong(menuNum[i]);
				Long meCount = Long.parseLong(menuCount[i]);
				
				PaymentDetailVO paymentDetailVO = new PaymentDetailVO();
				paymentDetailVO.setPayNum(code);
				paymentDetailVO.setMenuNum(meNum);
				paymentDetailVO.setMenuCount(meCount);
				
				cartService.detailOrder(paymentDetailVO); // 주문정보 DB로 전송
				
				cartService.cartListDelete(caNum); // 주문완료된 상품을 카트에서 제거
				
			}
			
			return "redirect:./orderComplete";
			
		}
		
	}
	
	// 주문 완료 폼
	@GetMapping("orderComplete")
	public void orderComplete() throws Exception{
	}
	
	// 카카오페이 결제 페이지
	@GetMapping("kakaoPay")
	public void kakaoPay(Model model, HttpSession httpSession) throws Exception{
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
		
		model.addAttribute("payNum", data.getPayNum());
		model.addAttribute("totalPrice", data.getTotalPrice());
		model.addAttribute("id", data.getId());
	
	}
	
	// 카카오페이 결제 완료 페이지
	@GetMapping("kakaoPayOrderComplete")
	public void kakaoPayOrderComplete() throws Exception{
		
		cartService.kakaoPayOrderComplete(data);
		
		for(int i = 0; i < lists.size(); i++) {
			
			cartService.detailOrder(detailDatas.get(i)); // 주문정보 DB로 전송
			
			cartService.cartListDelete(kacaNum.get(i)); // 주문완료된 상품을 카트에서 제거
			
		}
		
		detailDatas.clear();
		
	}
	
	// 네이버페이 결제 페이지
	@GetMapping("naverPay")
	public void naverPay() throws Exception{
	}
	
	// 네이버페이 결제 완료 페이지
	@GetMapping("naverPayOrderComplete")
	public void naverPayOrderComplete() throws Exception{
		
	}
}
