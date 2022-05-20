package com.project.mango.reservation;

import java.sql.Timestamp;

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
	
}
