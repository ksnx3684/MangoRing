package com.project.mango.promotion;

import java.sql.Date;
import java.time.LocalDate;

import lombok.Data;

@Data
public class PromotionVO {
	
	private Long promotionNum;
	private Long restaurantNum;
	private String id;
	private String promotionName;
	private String promotionDetail;
	private LocalDate startDate;
	private LocalDate endDate;
	private Long discount;
	

}
