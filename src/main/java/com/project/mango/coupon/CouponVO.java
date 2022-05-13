package com.project.mango.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {
	
	private Long couponNum;
	private Long restaurantNum;
	private String name;
	private String detail;
	private Date issuanceDate;
	private Date expirationDate;
	private Long percent;
	private String id;

}
