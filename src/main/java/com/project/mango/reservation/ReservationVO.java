package com.project.mango.reservation;

import java.sql.Timestamp;

import com.project.mango.member.MemberVO;
import com.project.mango.restaurant.RestaurantFileVO;
import com.project.mango.restaurant.RestaurantVO;

import lombok.Data;

@Data
public class ReservationVO {

	private Long reservationNum;
	private Long restaurantNum;
	private String id;
	private Integer count;
	private Timestamp time;
	private Timestamp reservationTime;
	private Integer visitStatus;
	
	private RestaurantVO restaurantVO;
	private RestaurantFileVO restaurantFileVO;
		
	private MemberVO memberVO;
}
