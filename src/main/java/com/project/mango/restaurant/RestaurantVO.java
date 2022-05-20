package com.project.mango.restaurant;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RestaurantVO {
	
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
	private String businessNum;
}
