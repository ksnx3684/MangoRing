package com.project.mango.cart;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
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
import com.project.mango.menu.MenuService;
import com.project.mango.menu.MenuVO;
import com.project.mango.order.PaymentDetailVO;
import com.project.mango.order.PaymentVO;
import com.project.mango.promotion.PromotionService;
import com.project.mango.promotion.PromotionVO;
import com.project.mango.restaurant.RestaurantVO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private PromotionService promotionService;
	
	// 무통장 입금은 결제 진행과 동시에 DB에 결제 내용이 들어가지만,
	// 카카오 및 토스페이는 결제 진행 후 결제 완료페이지로 정상적으로 넘어가야만 DB에 결제 내용이 들어갑니다.
	
	// 가게 > 포장 주문 > 장바구니 > 주문 > 주문 처리 로직에서 장바구니 기능을 삭제 후 아래와 같이 로직을 변경합니다.
	// 가게 > 포장 주문 > 주문 > 주문 처리
	// 기존의 장바구니 기능은 주문 페이지에서 jstl로 데이터를 불러올 때 필요한 jstl 전용 임시저장소 용도로 사용합니다.
	
	// 전역변수
	List<CartVO> lists = new ArrayList<CartVO>(); // 카트(임시저장소)에 담을 수 있는 전역변수 lists
	int totalsize = 0;
	PaymentVO data = new PaymentVO(); // 카카오페이 및 토스페이 전용 전역변수 (결제 테이블)
	List<PaymentDetailVO> detailDatas = new ArrayList<PaymentDetailVO>(); // 카카오페이 및 토스페이 전용 전역변수 (결제 상세 테이블)
//	List<Long> kacaNum = new ArrayList<Long>(); // 카카오페이 및 토스페이 진행 후 카트 리스트 삭제를 위한 전역변수

	
//	// 장바구니 보기 (카트 목록 불러오기)
//	@GetMapping("cartList")
//	public void cartList(Model model, HttpSession httpSession) throws Exception{
//		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
//		CartVO cartVO = new CartVO();
//		cartVO.setId(memberVO.getId());
//		List<CartVO> list = cartService.cartList(cartVO);
//		//System.out.println(list.get(2).getMenuVOs().getRestaurantVO().getRestaurantName());
//		model.addAttribute("cartList", list);
//	}
//	
	// 장바구니 수량 증가
	@PostMapping("cartCountPlus")
	@ResponseBody
	public void cartCountPlus(CartVO cartVO) throws Exception{
		int result = cartService.cartCountPlus(cartVO);
	}
	
	// 장바구니 수량 감소
	@PostMapping("cartCountMinus")
	@ResponseBody
	public void cartCountMinus(CartVO cartVO) throws Exception{
		int result = cartService.cartCountMinus(cartVO);
	}
//	
//	// 장바구니에서 선택 상품 제거
//	@PostMapping("cartListDelete")
//	@ResponseBody
//	public void cartListDelete(HttpServletRequest request) throws Exception {
//		String[] cartNum = request.getParameterValues("checkbox");
//		List<String> cart = Arrays.asList(cartNum);
//	
//		int size = 1;
//		size = cart.size();
//		
//		for(int i = 0; i < size; i++) {
//			Long caNum = Long.parseLong(cart.get(i));
//			int result = cartService.cartListDelete(caNum);
//		}
//	}
//
//	//장바구니에서 주문 폼으로 보내주기
//	@PostMapping("cartList")
//	public String cartOrder(String[] cartNum) throws Exception {
//
//		int size = 1;
//		size = cartNum.length;
//		lists.clear(); // 초기화
//		
//		for(int i = 0; i < size; i++) {
//			Long result = Long.parseLong(cartNum[i]);
//			lists.add(cartService.cartOrder(result)); // lists에 담아서 주문 폼으로 전송
//		}
//		
//		return "redirect:./order";
//	}
	
	// 카트 테이블에 data를 insert 해주기 위한 선행 작업 메서드
	@GetMapping("pre")
	public String pre (Model model, RestaurantVO restaurantVO, HttpSession session) throws Exception{
		
		// 접속할 때 cart/pre?restaurantNum=식당번호 로 들어오면 하단의 코드 실행 후 packing으로 리다이렉트
		
		List<MenuVO> list = menuService.getList(restaurantVO);
		CartVO cartVO = new CartVO();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = "";
		
		if(memberVO != null) {
			id = memberVO.getId();
		}
		
		cartService.clear(memberVO);
		for(int i = 0; i < list.size(); i++) { // 카트에 임시적으로 해당 매장의 모든 메뉴를 집어넣는다.
			cartVO.setId(id);
			cartVO.setMenuNum(list.get(i).getMenuNum());
			cartVO.setMenuCount(1L);
			cartVO.setCartPrice(list.get(i).getPrice());
			cartService.cartAdd(cartVO);
		}
		
		return "redirect:./packing?restaurantNum=" + list.get(0).getRestaurantNum();
	}
	
	// 포장 주문 페이지
	@GetMapping("packing")
	public void packing(Model model, RestaurantVO restaurantVO, HttpSession session, HttpServletRequest request) throws Exception{
		System.out.println(request.getHeader("referer"));
		List<MenuVO> list = menuService.getList(restaurantVO);
		CartVO cartVO = new CartVO();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = "";
		
		if(memberVO != null) {
			id = memberVO.getId();
			model.addAttribute("id", id);
		}

//		cartService.clear(memberVO);
		for(int i = 0; i < list.size(); i++) {
			cartVO.setId(id);
			cartVO.setMenuNum(list.get(i).getMenuNum());
			cartVO.setMenuCount(1L);
			cartVO.setCartPrice(list.get(i).getPrice());
//			cartService.cartAdd(cartVO);
		}


		List<CartVO> lists = cartService.cartList(cartVO);
		
		// 프로모션
		List<PromotionVO> prolist = promotionService.getList();
		List<PromotionVO> promotion = new ArrayList<PromotionVO>();
		
		for(PromotionVO p : prolist) {
			if(p.getRestaurantNum() == list.get(0).getRestaurantNum()) {
				promotion.add(p);
			}
		}
		
		List<RestaurantVO> menulist = promotionService.menulist();

		model.addAttribute("prolist", promotion);
		model.addAttribute("menulist", menulist);
		model.addAttribute("restaurantNum", list.get(0).getRestaurantNum());
		model.addAttribute("cartList", lists);
		
	}
	
	// 프로모션 적용
	@PostMapping("proCommit")
	public void proCommit(RestaurantVO restaurantVO) throws Exception{
		
//		restaurantVO.get
		
		int result = promotionService.proCommit(restaurantVO);
	}
	
	// 프로모션 적용 해제
	@PostMapping("proClear")
	public void proClear() throws Exception{
		
		
//		int result = promotionService.proClear();
	}
	
	// 포장 주문 페이지 > 주문 페이지로 데이터 전송을 해주기 위한 메서드
	@PostMapping("packing")
	public String packing(String[] cartNum, String restaurantNum, HttpSession session) throws Exception{
		
		CartVO cartVO = new CartVO();
		int size = 1;
		size = cartNum.length;
		lists.clear(); // 초기화
		
		for(int i = 0; i < size; i++) {
			Long result = Long.parseLong(cartNum[i]);
			lists.add(cartService.cartOrder(result)); // lists에 담아서 주문 폼으로 전송
		}
		
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		String id = memberVO.getId();
//		cartService.clear(memberVO); // 초기화
//		
//		for(int i = 0; i < size; i++) {
//			Long meNum = Long.parseLong(menuNum[i]);
//			Long meCount = Long.parseLong(menuCount[i]);
//			cartVO.setId(id);
//			cartVO.setMenuNum(meNum);
//			cartVO.setMenuCount(meCount);
//			cartService.cartAdd(cartVO);
//			
//			lists.add(cartService.packingOrder(meNum)); // lists에 담아서 주문 폼으로 전송
//
//		}
		
		return "redirect:./order";
	}
	
	// 주문 폼으로 가기
	@GetMapping("order")
	public void order(Model model, RestaurantVO restaurantVO, HttpSession httpSession) throws Exception {
		
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");

		model.addAttribute("order", lists); // lists에 담긴 data를 order model에 담아서 order.jsp에서 jstl로 사용
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
		
		// 전역변수 data에 값 집어넣기 (해당 작업은 카카오 및 토스페이로 인한 결제정보를 DB에 넣어주기 위한 선행작업임)
		data.setPayNum(code); // 주문번호
		data.setTotalPrice(paymentVO.getTotalPrice()); // 총 금액
		data.setId(paymentVO.getId()); // 아이디
		data.setRestaurantNum(paymentVO.getRestaurantNum()); // 가게 번호
		
		
		if(payRequest.equals("kakao")) { // 카카오페이 결제 페이지 이동
			
			data.setPayType("카카오페이");
			
			for(int i = 0; i < lists.size(); i++) {
				
//				kacaNum.add(i, Long.parseLong(cartNum[i])); // 주문 완료 후 카트리스트에서 제거하기 위해 전역변수 kacaNum에 담기
				Long meNum = Long.parseLong(menuNum[i]);
				Long meCount = Long.parseLong(menuCount[i]);
				
				PaymentDetailVO detail = new PaymentDetailVO(); // 결제 상세 테이블에 각 메뉴별로 담기 위한 작업
				detail.setPayNum(code);
				detail.setMenuNum(meNum);
				detail.setMenuCount(meCount);
				
				detailDatas.add(i, detail);
			
			}
			
			return "redirect:./kakaoPay";
			
		} else if(payRequest.equals("toss")) { // 토스페이 결제 페이지 이동
			
			data.setPayType("토스페이");
			
			for(int i = 0; i < lists.size(); i++) {
				
//				kacaNum.add(i, Long.parseLong(cartNum[i])); // 주문 완료 후 카트리스트에서 제거하기 위해 전역변수 kacaNum에 담기
				Long meNum = Long.parseLong(menuNum[i]);
				Long meCount = Long.parseLong(menuCount[i]);
				
				PaymentDetailVO detail = new PaymentDetailVO(); // 결제 상세 테이블에 각 메뉴별로 담기 위한 작업
				detail.setPayNum(code);
				detail.setMenuNum(meNum);
				detail.setMenuCount(meCount);
				
				detailDatas.add(i, detail);
			
			}
			
			return "redirect:./tossPay";
		
		} else { // 무통장입금 결제 진행

			cartService.order(paymentVO); // 주문정보 DB로 전송 (결제 테이블)

			for(int i = 0; i < lists.size(); i++) {
				
//				Long caNum = Long.parseLong(cartNum[i]); // 주문 완료 후 카트리스트에서 제거하기 위해 전역변수 kacaNum에 담기
				Long meNum = Long.parseLong(menuNum[i]);
				Long meCount = Long.parseLong(menuCount[i]);
				
				PaymentDetailVO paymentDetailVO = new PaymentDetailVO(); // 결제 상세 테이블에 각 메뉴별로 담기 위한 작업
				paymentDetailVO.setPayNum(code);
				paymentDetailVO.setMenuNum(meNum);
				paymentDetailVO.setMenuCount(meCount);
				
				cartService.detailOrder(paymentDetailVO); // 주문정보 DB로 전송 (결제 상세 테이블)
				
//				cartService.cartListDelete(caNum); // 주문완료된 상품을 카트에서 제거
				
			}
			
			return "redirect:./orderComplete";
			
		}
		
	}
	
	// 무통장입금 주문 완료 폼
	@GetMapping("orderComplete")
	public void orderComplete() throws Exception{
	}
	
	// 카카오페이 결제 페이지
	@GetMapping("kakaoPay")
	public void kakaoPay(Model model, HttpSession httpSession) throws Exception{
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
		
		// model에 담아서 kakaoPay.jsp에서 jstl로 불러오기 위한 작업
		model.addAttribute("payNum", data.getPayNum());
		model.addAttribute("totalPrice", data.getTotalPrice());
		model.addAttribute("id", data.getId());
		model.addAttribute("name", lists.get(0).getMenuVOs().getRestaurantVO().getRestaurantName());
	
	}
	
	// 카카오페이 결제 완료 페이지
	@GetMapping("kakaoPayOrderComplete")
	public void kakaoPayOrderComplete() throws Exception{
		
		cartService.payOrderComplete(data); // 주문정보 DB로 전송 (결제 테이블)
		
		for(int i = 0; i < lists.size(); i++) {
			
			cartService.detailOrder(detailDatas.get(i)); // 주문정보 DB로 전송 (결제 상세 테이블)
			
//			cartService.cartListDelete(kacaNum.get(i)); // 주문완료된 상품을 카트에서 제거
			
		}
		
		detailDatas.clear(); // 초기화
		
	}
	
	// 토스페이 결제 페이지
	@GetMapping("tossPay")
	public void tossPay(Model model, HttpSession httpSession) throws Exception{
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("member");
		
		// model에 담아서 tossPay.jsp에서 jstl로 불러오기 위한 작업
		model.addAttribute("payNum", data.getPayNum());
		model.addAttribute("totalPrice", data.getTotalPrice());
		model.addAttribute("id", data.getId());
		model.addAttribute("name", lists.get(0).getMenuVOs().getRestaurantVO().getRestaurantName());
		
	}
	
	// 토스페이 결제 승인 호출
	@GetMapping("tossPayOrderRequest")
	public String tossPayOrderRequest(Model model) throws Exception{
		
		// 토스페이먼츠 결제 승인 API 호출 
		HttpRequest request = HttpRequest.newBuilder()
		    .uri(URI.create("https://api.tosspayments.com/v1/payments/5zJ4xY7m0kODnyRpQWGrN2xqGlNvLrKwv1M9ENjbeoPaZdL6"))
		    .header("Authorization", "Basic dGVzdF9za183WFpZa0tMNE1yam1BeDJNcFJMVjB6SndsRVdSOg==")
		    .header("Content-Type", "application/json")
		    .method("POST", HttpRequest.BodyPublishers.ofString("{\"amount\":"+data.getTotalPrice()+",\"orderId\":\"FlhL9qMPNv151V7aT8s-m\"}"))
		    .build();
		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		System.out.println(response.body());
		
		if(!response.body().equals("{" + '"' + "code" + '"' + ':' + '"' + "NOT_FOUND_PAYMENT_SESSION" + '"' + ','
		+ '"' + "message" + '"' + ':' + '"' + "결제 시간이 만료되어 결제 진행 데이터가 존재하지 않습니다." + '"' + '}')) {
			
			model.addAttribute("message", "잘못된 접근 경로입니다");
			model.addAttribute("path", "../");
			
			String path = "common/result";
			
			return path;
			
		}
		
		cartService.payOrderComplete(data); // 주문정보 DB로 전송 (결제 테이블)
		
		for(int i = 0; i < lists.size(); i++) {
			
			cartService.detailOrder(detailDatas.get(i)); // 주문정보 DB로 전송 (결제 상세 테이블)
			
//			cartService.cartListDelete(kacaNum.get(i)); // 주문완료된 상품을 카트에서 제거
			
		}
				
		detailDatas.clear(); // 초기화
		
		return "./cart/tossPayOrderComplete";
		
//		System.out.println("{" + '"' + "code" + '"' + ':' + '"' + "NOT_FOUND_PAYMENT_SESSION" + '"' + ','
//				+ '"' + "message" + '"' + ':' + '"' + "결제 시간이 만료되어 결제 진행 데이터가 존재하지 않습니다." + '"' + '}');
		
	}
	
	// 토스페이 결제 완료 페이지
	@GetMapping("tossPayOrderComplete")
	public void tossPayOrderComplete() throws Exception{
		
	}
}
