package com.project.mango.util;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ReservationPager extends Pager {
	
	private Long restaurantNum;
	
	private Integer visitStatus;
	
	private Date startDate;
	private Date endDate;
	
	public Integer getVisitStatus() {
		if(this.visitStatus == null) {
			this.visitStatus = 10;
		}
		return this.visitStatus;
	}
	
	public Date getStartDate() {
		if(this.startDate == null) {
			this.startDate = Date.valueOf("1900-01-01");
		}
		return this.startDate;
	}
	
	public Date getEndDate() {
		if(this.endDate == null) {
			this.endDate = Date.valueOf("2100-12-31");
		}
		return this.endDate;
	}
}
