package com.project.mango.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
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
		mv.setViewName("redirect:../restaurant/detail");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setAdd(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("review/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ReviewVO reviewVO,MultipartFile[] files,ModelAndView mv)throws Exception{
		
		int result = reviewService.setAdd(reviewVO,files);
		
		
		mv.addObject("result",result);
		mv.setViewName("redirect:../restaurant/detail");
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
		
		mv.setViewName("redirect:../restaurant/detail");
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg","Update Fail");
			mv.addObject("path","./detail?reviewNum="+reviewVO.getReviewNum());
		}
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getdetailReview(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		reviewVO = reviewService.getDetailReview(reviewVO);
		
		mv.addObject("reFilesVo",reviewVO.getReviewFilesVOs());
		mv.addObject("revo",reviewVO);
		mv.setViewName("/review/detail");
		return mv;
	}

}
