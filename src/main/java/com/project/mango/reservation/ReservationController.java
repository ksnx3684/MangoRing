package com.project.mango.reservation;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.member.MemberVO;
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
		
		System.out.println(reservationVO.getRestaurantNum());
		
		//로그인 추가 되면
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		reservationVO.setId(memberVO.getId());
		Timestamp date = Timestamp.valueOf(rsvTime);
		reservationVO.setReservationTime(date);

		
		int result = reservationService.setAdd(reservationVO);
		
		mv.setViewName("redirect:../member/reservation");
		return mv;
	}
	
	@Scheduled(cron="0 */30 10-18 * * *")
	public void setUpdateVisitStatus() throws Exception {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
//		System.out.println(sdf.format(calendar.getTime()));
		
		Timestamp curTime = Timestamp.valueOf(sdf.format(calendar.getTime()));
		
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setReservationTime(curTime);
		
		int result = reservationService.setUpdateVisitStatus(reservationVO);
		
		if(result == 1) {
			System.out.println("업데이트 성공");
		}
	}
	
}
