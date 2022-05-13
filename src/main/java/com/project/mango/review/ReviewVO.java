package com.project.mango.review;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long reviewNum;
	private String id;
	private Long restaurantNum;
	private Long reservationNum;
	private float star;
	private Date regDate;
	private Long reportCheck;
	private String contents;

}
