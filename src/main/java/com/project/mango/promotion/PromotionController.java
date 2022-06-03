package com.project.mango.promotion;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.member.MemberVO;
import com.project.mango.util.Pager;

@Controller
@RequestMapping("/promotion/*")
public class PromotionController {
	
	@Autowired
	private PromotionService promotionService;
	
	@GetMapping("list")
	public ModelAndView getList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PromotionVO> ar = promotionService.getList();
		mv.addObject("list",ar);
		
		mv.setViewName("promotion/list");
		return mv;
	}
	
	@GetMapping("ajaxList")
	public ModelAndView getAjaxList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("AjaxList");
	//	MemberVO memberVO =(MemberVO)session.getAttribute("member");
		
		List<PromotionVO> ar = promotionService.getList();
		mv.addObject("list",ar);
		
		mv.setViewName("common/promotionList");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setPromotionAdd(PromotionVO promotionVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("promotion/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setPromotionAdd(String startYear, String startMonth,String startDay,String endYear,
			String endMonth,String endDay,PromotionVO promotionVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		if(startMonth.length()==1) {
			startMonth="0"+startMonth;
		}
		if(startDay.length()==1) {
			startDay="0"+startDay;
		}
		String startD=startYear+"-"+startMonth+"-"+startDay;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd",Locale.KOREA);
		LocalDate startDate = LocalDate.parse(startD,formatter);
		promotionVO.setStartDate(startDate);   //LocalDate.parse(startD,formatter)
		
		// ------------
		
		if(endMonth.length()==1) {
			endMonth="0"+endMonth;
		}
		if(endDay.length()==1) {
			endDay="0"+endDay;
		}
		String endD=endYear+"-"+endMonth+"-"+endDay;
		DateTimeFormatter formatterEnd = DateTimeFormatter.ofPattern("yyyy-MM-dd",Locale.KOREA);
		LocalDate endDate = LocalDate.parse(endD,formatterEnd);
		promotionVO.setEndDate(endDate);   //LocalDate.parse(endD,formatterEnd)
		
		
		int result = promotionService.setPromotionAdd(promotionVO);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
		
	}
	

}
