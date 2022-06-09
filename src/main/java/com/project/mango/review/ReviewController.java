package com.project.mango.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.mango.member.MemberVO;
import com.project.mango.restaurant.RestaurantVO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("report")
	public ModelAndView setReport(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		reviewService.setReport(reviewVO);
		System.out.println("신고번호"+reviewVO.getReportCheck());
		System.out.println("리뷰번호"+reviewVO.getReviewNum());
		System.out.println("신고옵션"+reviewVO.getReportOption());
		mv.setViewName("redirect:../restaurant/detail?restaurantNum="+reviewVO.getRestaurantNum());
		return mv;
	}
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(ReviewFilesVO reviewFilesVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.setFileDelete(reviewFilesVO);
				
				mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}
	
	@GetMapping
	public ModelAndView setDelete(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.setDelete(reviewVO);
		
		long num= reviewVO.getRestaurantNum();
		mv.setViewName("redirect:../restaurant/detail?restaurantNum="+num);
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setAdd(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", reviewVO);
		mv.setViewName("review/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ReviewVO reviewVO,MultipartFile[] files,ModelAndView mv)throws Exception{
		
		System.out.println("레스토랑넘 진짜"+reviewVO.getRestaurantNum());
		long num= reviewVO.getRestaurantNum();
		
		int result = reviewService.setAdd(reviewVO,files);
		// ----------------
		
//		Map<String, String> map = new HashMap<String,String>();
//		map.put("reviewVO", params.get("reviewVO"));
//		redirect.addFlashAttribute("map",map);
		// ---------------------
	
		mv.addObject("result",result);
		mv.setViewName("redirect:../restaurant/detail?restaurantNum="+num);
		return mv;
		
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(ReviewVO reviewVO)throws Exception{
		ModelAndView mv =new ModelAndView();
	
		reviewVO = reviewService.getDetailReview(reviewVO);
		mv.addObject("voFile",reviewVO.getReviewFilesVOs());
		mv.addObject("vo",reviewVO);
		mv.setViewName("/review/update");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ReviewVO reviewVO,MultipartFile[] files)throws Exception{
		ModelAndView mv =new ModelAndView();
		
		int result = reviewService.setUpdate(reviewVO, files);
		
		if(result>0) {
		
		mv.setViewName("redirect:./detail?reviewNum="+reviewVO.getReviewNum());
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg","Update Fail");
			mv.addObject("path","./detail?reviewNum="+reviewVO.getReviewNum());
		}
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getdetailReview(ReviewVO reviewVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		reviewVO = reviewService.getDetailReview(reviewVO);
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		mv.addObject("reFilesVo",reviewVO.getReviewFilesVOs());
		mv.addObject("revo",reviewVO);
		mv.addObject("member",memberVO);
		mv.setViewName("/review/detail");
		return mv;
	}

}
