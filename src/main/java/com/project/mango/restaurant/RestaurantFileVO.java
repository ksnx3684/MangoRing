package com.project.mango.restaurant;

import com.project.mango.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RestaurantFileVO extends FileVO{

	private Long restaurantNum;
	
}
