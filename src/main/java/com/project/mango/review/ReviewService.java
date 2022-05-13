package com.project.mango.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	
	public int setAdd(ReviewVO reviewVO)throws Exception{
		int result= reviewMapper.setAdd(reviewVO);
		return result;
		
	}

}
