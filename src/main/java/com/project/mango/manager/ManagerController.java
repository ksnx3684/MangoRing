package com.project.mango.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.board.BoardVO;
import com.project.mango.member.MemberService;
import com.project.mango.member.MemberVO;
import com.project.mango.notice.NoticeService;
import com.project.mango.notice.NoticeVO;
import com.project.mango.restaurant.RestaurantService;
import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.review.ReviewService;
import com.project.mango.review.ReviewVO;
import com.project.mango.util.Pager;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private NoticeService noticeService;

	@GetMapping("list")
	public ModelAndView getList(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.getList(memberVO);
		mv.addObject("list", ar);
		mv.setViewName("manager/list");
		return mv;
	}

	
	@GetMapping("memberChange")
	public ModelAndView getMemberChange(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.getMemberChange(memberVO);
		mv.addObject("memberChange", ar);
		mv.setViewName("manager/memberChange");
		return mv;
	}
	
	@GetMapping("memberChangeDetail")
	public ModelAndView getMemberChangeDetail(MemberVO memberVO, RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
//		memberVO = memberService.getMemberChangeDetail(memberVO);
		restaurantVO = restaurantService.getMemberChangeDetail(memberVO);
		mv.addObject("mv", memberVO);
		mv.addObject("re", restaurantVO);
		mv.setViewName("manager/memberChangeDetail");
		return mv;
	}
	
//	@GetMapping("memberChangeDetail")
//	public ModelAndView getMemberChangeDetail(RestaurantVO restaurantVO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		restaurantVO = restaurantService.getMemberChangeDetail(restaurantVO);
//		mv.addObject("re", restaurantVO);
//		mv.setViewName("manager/memberChangeDetail");
//		return mv;
//	}

	//가게 리스트출력
	@GetMapping("resList")
	public ModelAndView getResList (RestaurantVO restaurantVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<RestaurantVO> ar = restaurantService.getResList(restaurantVO);
		mv.addObject("resList", ar);
		mv.setViewName("manager/resList");
		return mv;
	}

	
	//리뷰 신고건 보기
	@GetMapping("reviewList")
	public ModelAndView getReview(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReviewVO> ar = reviewService.getListReview(reviewVO);
		mv.addObject("review", ar);
		mv.setViewName("manager/reviewList");
		return mv;
	}
	
	//블랙리스트 조회
	@GetMapping("blackList")
	public ModelAndView getBlackList(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.getBlackList(memberVO);
		mv.addObject("blackList", ar);
		mv.setViewName("manager/blackList");
		return mv;
	}
	
	//공지사항 조회
	@GetMapping("noticeList")
	public ModelAndView getNoticeList(NoticeVO noticeVO, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardVO> ar = noticeService.getList(pager);
		mv.addObject("noticeList", ar);
		mv.setViewName("manager/noticeList");
		return mv;
	}
	
	
	
}