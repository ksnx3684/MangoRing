package com.project.mango.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.restaurant.RestaurantVO;

@Mapper
public interface ReviewMapper {
	
	//fileAdd
	public int setFileAdd(ReviewFilesVO reviewFilesVO)throws Exception;
	
	//add
	public int setAdd(ReviewVO reviewVO)throws Exception;
	
	//list
	public List<ReviewVO> getListReview(ReviewVO reviewVO)throws Exception;
	
	//count
	public long countReview(ReviewVO reviewVO)throws Exception;
	
	//리뷰 맛있어요 갯수
	public Long goodCount(ReviewVO reviewVO)throws Exception;
	
	//리뷰 보통이에요 갯수
	public Long normalCount(ReviewVO reviewVO)throws Exception;
	
	//리뷰 별로에요 갯수
	public Long badCount(ReviewVO reviewVO)throws Exception;
}
