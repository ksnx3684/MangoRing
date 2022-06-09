package com.project.mango.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.mango.order.PaymentVO;
import com.project.mango.reservation.ReservationVO;
import com.project.mango.restaurant.RestFileVO;
import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.review.ReviewVO;
import com.project.mango.util.Pager;
import com.project.mango.wishlist.WishlistVO;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 GET 방식
	@GetMapping("login")
	public String getLogin(@ModelAttribute MemberVO memberVO) throws Exception {
		
		return "member/login";
	}
	
	// 로그인 POST 방식
	@PostMapping("login")
	public String getLogin(HttpSession session, @Valid MemberVO memberVO, 
			BindingResult bindingResult, RedirectAttributes rttr) throws Exception {
		
		memberVO = memberService.getLogin(memberVO);
		String viewPath = "member/login";
		
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			viewPath = "redirect:/";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:./login";
		}
		
		return viewPath;
	}
	
	// 약관동의 GET 방식
	@GetMapping("joinCheck")
	public String setJoinCheck() throws Exception {
		
		return "member/joinCheck";
	}
	
	// 회원가입 GET 방식
	@GetMapping("join")
	public String setJoin(@ModelAttribute MemberVO memberVO) throws Exception {
		
		return "member/join";
	}
	
	// 회원가입 POST 방식
	@PostMapping("join")
	public String setJoin(Model model, MultipartFile[] file, 
			@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
		
		if(memberService.memberError(memberVO, bindingResult)) {
			return "member/join";
		}
		
		int result = memberService.setAddMember(memberVO, file);
		model.addAttribute("vo", memberVO);
		
		return "redirect:./login";
	}
	
	
	// 마이페이지
	@GetMapping("myPage")
	public String getMyPage(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.getMyPage(memberVO);
		model.addAttribute("vo", memberVO);
		
		return "member/myPage";
	}
	
	// 회원정보 수정 GET 방식
	@GetMapping("update")
	public ModelAndView setUpdate(HttpSession session, MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.getMyPage(memberVO);
		mv.addObject("vo", memberVO);
		mv.setViewName("member/update");
	
		return mv;
	}
	
	// 회원정보 수정 POST 방식
	@PostMapping("update")
	public String setUpdate(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		MemberVO sessionVO = (MemberVO)session.getAttribute("member");
		// 매개변수로 받은 memberVO에는 id 정보가 없어서 session에서 받아와야 함
		memberVO.setId(sessionVO.getId());
		int result = memberService.setUpdate(memberVO);
		model.addAttribute("vo", memberVO);
		return "redirect:./myPage";
	}
	
	// 사업자 신청 GET 방식
	@GetMapping("business")
	public String setBusiness(Model model, RestaurantVO restaurantVO) throws Exception {
		model.addAttribute("vo", restaurantVO);
		return "member/business";
	}
	
	// 사업자 신청 POST 방식
	@PostMapping("business")
	public String setBusiness(HttpSession session, MultipartFile[] file, MultipartFile[] photo,
			MemberVO memberVO, RestaurantVO restaurantVO, RestFileVO restFileVO) 
					throws Exception {
		
		memberVO = (MemberVO)session.getAttribute("member");
		restaurantVO.setId(memberVO.getId());
		
		// 사업자 정보 등록
		int result = memberService.setBusinessApplication(restaurantVO, memberVO, file);
		
		restFileVO.setRestaurantNum(restaurantVO.getRestaurantNum());
		System.out.println("RestaurantNum 출력 : " + restFileVO.getRestaurantNum());
		
		// 가게 사진 등록
		result = memberService.setRestaurantPhoto(restaurantVO, photo, restFileVO);
		
		// 사업자 등록 후 승인 대기로 변경
		result = memberService.setBusinessUserType(memberVO);
			
		return "redirect:../";
	}
	
	// 위시리스트 GET 방식
	@GetMapping("wishlist")
	public String setWishlist(HttpSession session, Model model, 
			Pager pager, MultipartFile[] file) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = (memberVO.getId());
		
		List<WishlistVO> wishList = memberService.getWishlist(id, pager);
		
		model.addAttribute("wishList", wishList);
		model.addAttribute("pager", pager);
		
		return "member/wishlist";
	}
	
	// 위시리스트 POST 방식
	@PostMapping("wishlist")
	@ResponseBody
	public int setWishlist(HttpSession session, WishlistVO wishlistVO) throws Exception {
		
		// 로그인 체크
		int result = 0;
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		if(memberVO != null) {
			wishlistVO.setId(memberVO.getId());
			result = 1;
			int insertOK = memberService.setWishlist(wishlistVO);
			
			// 중복값일 떄 처리
			if (insertOK == 0) {
				result = 2;
			}
		}
		
		return result;
	}
	
	// 위시리스트 POST 삭제
	@PostMapping("delWishlist")
	@ResponseBody
	public int setDeleteWishlist(HttpSession session, WishlistVO wishlistVO) 
			throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		int result = 0;
		
		if(memberVO != null) {
			wishlistVO.setId(id);
			memberService.setDeleteWishlist(wishlistVO);
			result = 1;
		}
		
		return result;
	}
	
	// 내 평점 GET 방식
	@GetMapping("rating")
	public String getMyRating(HttpSession session, Model model, Pager pager) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		List<ReviewVO> reviewList = memberService.getRatingList(id, pager);
		
//		reviewList.get(0).getReviewFilesVOs().get(0).getFileName();
//		
//		reviewList.get(0).getStar();
	
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pager", pager);
		
		return "member/rating";
	}
	
	// 예약내역 GET 방식
	@GetMapping("reservation")
	public String getMyReservationList(HttpSession session, Model model, 
			Pager pager) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		List<ReservationVO> reserList = memberService.getMyReservationList(id, pager);
		
		model.addAttribute("reserList", reserList);
		model.addAttribute("pager", pager);
		
		
		return "member/reservation";
	}
	
	// 결제내역 GET 방식
	@GetMapping("payment")
	public String getMyPayment(HttpSession session, Model model, Pager pager) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		List<PaymentVO> paymentList = memberService.getPaymentList(id, pager);
		
		model.addAttribute("paymentList", paymentList);
		
		return "member/payment";
	}
		
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴 GET 방식
	@GetMapping("delete")
	public String setDelete() throws Exception {
		
		return "member/delete";
	}
	
	// 회원 탈퇴 POST 방식
	@PostMapping("delete")
	public String setDelete(HttpSession session, MemberVO vo, 
			RedirectAttributes rttr) throws Exception {
		
		// 세션에 있는 member를 가져와 memberVO 변수에 넣어줌
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		// 세션에 있는 비밀번호
		String sessionPass = memberVO.getPw();
		// vo로 들어오는 비밀번호
		String voPass = vo.getPw();
		
		// 비밀번호가 다를시
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:./delete";
		}
		
		int result = memberService.setDelete(memberVO);
		session.invalidate();
		return "redirect:/";
	}
}
