package com.project.mango.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.project.mango.member.MemberFileVO;
import com.project.mango.member.MemberService;


import com.project.mango.cart.CartService;
import com.project.mango.menu.MenuService;
import com.project.mango.menu.MenuVO;
import com.project.mango.review.ReviewService;
import com.project.mango.review.ReviewVO;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private CartService cartService;

	
	@GetMapping("detail")
	public ModelAndView getDetailWM(RestaurantVO restaurantVO,ReviewVO reviewVO,MenuVO menuVO,MemberFileVO memberFileVO,ModelAndView mv)throws Exception{

		
		
		
		//레스토랑 정보 , 카테고리 종류
		restaurantVO = restaurantService.getDetailWM(restaurantVO);
		
		System.out.println("restaurantVO 출력 테스트 : " + restaurantVO);
	
		
		
		//MenuVO menuVO = restaurantService.getDetail(restaurantVO.getMenuVO());
		
		
		//리뷰 디테일로 가는 리스트
		//ReviewVO reviewVO =new ReviewVO();
		reviewVO.setRestaurantNum(restaurantVO.getRestaurantNum());
		System.out.println(restaurantVO.getRestaurantNum());
		System.out.println(reviewVO.getRseNum());
		System.out.println(reviewVO.getRssNum());
		
		
		
		List<ReviewVO> ar = reviewService.getListReview(reviewVO);
		
		
		System.out.println(menuVO.getMenuNum());
		
		menuVO.setRestaurantNum(restaurantVO.getRestaurantNum());
		List<MenuVO> menuAr = restaurantService.getListWM(menuVO);
		
		
		
		//전체 리뷰 카운트
		long count = reviewService.countReview(reviewVO);
		
		//맛있어요 리뷰 카운트
		long goodCount = reviewService.goodCount(reviewVO);
		
		//보통이에요 리뷰 카운트
		long normalCount = reviewService.normalCount(reviewVO);
		
		//별로에요 리뷰 카운트
		long badCount = reviewService.badCount(reviewVO);
		
		mv.addObject("resFiles",restaurantVO.getRestaurantFileVO());
		mv.addObject("count",count);	
		mv.addObject("goodCount",goodCount);
		mv.addObject("normalCount",normalCount);
		mv.addObject("badCount",badCount);
		mv.addObject("list",ar);
		mv.addObject("vo",restaurantVO.getCategoryVO()); //카테고리 종류
		mv.addObject("vo1",restaurantVO); //레스토랑 정보
		mv.addObject("menu",menuAr);
		mv.setViewName("restaurant/detail");
		return mv;
		
	}
	
//	@GetMapping("packing")
//	public void packing(Model model, RestaurantVO restaurantVO, HttpSession session) throws Exception{
//		List<MenuVO> list = menuService.getList(restaurantVO);
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		if(memberVO != null) {
//			String id = memberVO.getId();
//			model.addAttribute("id", id);
//		}
//		model.addAttribute("restaurantNum", list.get(0).getRestaurantNum());
//		model.addAttribute("list", list);
//		
//	}
//	
//	@PostMapping("packing")
//	public String packing(String[] menuNum, String[] menuCount, String restaurantNum, HttpSession session) throws Exception{
//		
//		return "redirect: ./cart/order";
//	}
	
//	
//	@ResponseBody
//	@PostMapping("packing")
//	public int packing(Model model, String[] menuNum, String[] menuCount, String restaurantNum, HttpSession session) throws Exception{
//
//		CartVO cartVO = new CartVO();
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		cartVO.setId(memberVO.getId());
//		List<CartVO> cartcheck = cartService.cartCheck(cartVO);
//		System.out.println("--------시작점--------");
//
//		if(cartcheck.size() > 0) { // 카트가 비어있지 않다면
//			// 카트에 다른 가게의 상품이 이미 담겨있다면
//			if(cartcheck.get(0).getMenuVOs().getRestaurantNum() != Long.parseLong(restaurantNum)) {
//				int result = 1;
//				return result;
//			}
//			// 카트에 같은 상품이 담겨있다면
//			for(int i = 0; i < cartcheck.size(); i++) {
//				for(int j = 0; j < menuNum.length; j++) {
//					if(cartcheck.get(i).getMenuNum() == Long.parseLong(menuNum[j])) {
//						int result = 2;
//						return result;
//					}
//				}
//			}
//			CartVO cartVO2 = new CartVO();
//			for(int i = 0; i < menuNum.length; i++) {
//				cartVO2.setId(memberVO.getId());
//				cartVO2.setMenuNum(Long.parseLong(menuNum[i]));
//				cartVO2.setMenuCount(Long.parseLong(menuCount[i]));
//				cartService.cartAdd(cartVO2);
//			}
//			int result = 3;
//			return result;
//		}
//		// 카트가 비어있다면
//		CartVO cartVO2 = new CartVO();
//		for(int i = 0; i < menuNum.length; i++) {
//			cartVO2.setId(memberVO.getId());
//			cartVO2.setMenuNum(Long.parseLong(menuNum[i]));
//			cartVO2.setMenuCount(Long.parseLong(menuCount[i]));
//			cartService.cartAdd(cartVO2);
//		}
//		int result = 0;
//		return result;
//		
//		
//	}

}
