package com.project.mango.restaurant;

import java.sql.Date;

import com.project.mango.menu.MenuVO;
import com.project.mango.reservation.ReservationVO;

import java.util.List;
import com.project.mango.hashtag.HashtagVO;
import com.project.mango.review.ReviewVO;


import lombok.Data;

@Data
public class RestaurantVO {	

	private CategoryVO categoryVO;
	private List<MenuVO> menuVOs;
	
	private Long restaurantNum;
	private Long categoryNum;
	private String id;
	private String restaurantName;
	private String restaurantPhone;
	private String postCode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private Date regDate;
	private Date editDate;
	private Long parkingCheck;
	private Long kidCheck;
	private String introduction;
	private String accountNumber;
	private Long businessOk;

	private List<RestaurantFileVO> restaurantFileVOs;
	private List<HashtagVO> hashtagVOs;
	
	private String businessNum;
	
	private RestaurantFileVO restaurantFileVO;
	private List<ReviewVO> reviewVOs;
	

}
