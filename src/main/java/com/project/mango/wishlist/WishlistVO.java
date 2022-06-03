package com.project.mango.wishlist;

import java.util.List;

import com.project.mango.restaurant.RestFileVO;
import com.project.mango.restaurant.RestaurantVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WishlistVO {

	private Long wishNum;
	private Long restaurantNum;
	private String id;
	private Long categoryNum;
	
	// 카테고리
	private List<RestaurantVO> restaurantVOs;
	
	// 가게 파일
	private List<RestFileVO> restFileVO;
}
