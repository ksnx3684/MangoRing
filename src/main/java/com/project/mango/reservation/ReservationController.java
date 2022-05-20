package com.project.mango.reservation;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.restaurant.RestaurantService;
import com.project.mango.restaurant.RestaurantVO;

@Controller
@RequestMapping(value="/reservation/*")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("write")
	public ModelAndView write(RestaurantVO restaurantVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.getDetail(restaurantVO);
		
		mv.addObject("restaurantVO", restaurantVO);
		mv.setViewName("reservation/write");
		return mv;
	}
	
	@PostMapping("write")
	public ModelAndView write(ReservationVO reservationVO, String rsvTime, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//로그인 추가 되면
		//MemberVO memberVO = (MemberVO)session.getAttribute("member")
		//restaurantVO.setID(memberVO.getID());
		Timestamp date = Timestamp.valueOf(rsvTime);
		reservationVO.setReservationTime(date);
		reservationVO.setId("owner1");
		
		int result = reservationService.setAdd(reservationVO);
		
		mv.setViewName("redirect:../");
		return mv;
	}

}
