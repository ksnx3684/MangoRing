package com.project.mango.restaurant;

import java.sql.Date;

import lombok.Data;

@Data
public class RestaurantVO {

	private Integer restaurantNum;
	private Integer categoryNum;
	private String id;
	private String restaurantName;
	private String restaurantPhone;
	private String postCode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private Date regDate;
	private Date editDate;
	private Integer parkingCheck;
	private Integer kidCheck;
	
}
