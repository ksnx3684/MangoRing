package com.project.mango.util;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PackagePager extends Pager {
	
	private Long restaurantNum;
	
	private Date startDate;
	private Date endDate;
	
}
