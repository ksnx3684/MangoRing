package com.project.mango.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.category.CategoryVO;
import com.project.mango.restaurant.RestaurantVO;

@Mapper
public interface SearchMapper {

	// search
	public List<RestaurantVO> search(SearchVO searchVO) throws Exception;
	
	// mainSearch
	public List<RestaurantVO> mainSearch(SearchVO searchVO) throws Exception;
	
	// detailSearch
	public List<RestaurantVO> detailSearch(SearchVO searchVO) throws Exception;
	
	// categoryList
	public List<CategoryVO> categoryList() throws Exception;
	
	// hashtagList
	public List<HashtagVO> hashtagList() throws Exception;
	
//	// dataKR
//	public String dataKR() throws Exception;
}
