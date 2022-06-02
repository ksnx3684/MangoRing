package com.project.mango.review;

import java.sql.Date;
import java.util.List;

import com.project.mango.restaurant.RestaurantVO;

import lombok.Data;

@Data
public class ReviewVO {
	
	private List<ReviewFilesVO> reviewFilesVOs;
	private List<RestaurantVO> restaurantVOs;
	
	private Long reviewNum;
	private String id;
	private Long restaurantNum;
	private Long reservationNum;

	private float star;

	private Date regDate;
	private Long reportCheck;
	private String contents;
	
	private Long rssNum;  //reviewStartNum
	private Long rseNum;  //reviewEndNum
	
	public Long getRssNum() {
		if(this.rssNum==null) {
			this.rssNum=0L;
		}
		return this.rssNum;
	}
	
	public Long getRseNum() {
		if(this.rseNum==null) {
			this.rseNum=5L;
		}
		return this.rseNum;
	}

}
