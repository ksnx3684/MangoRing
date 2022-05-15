package com.project.mango.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.mango.restaurant.RestaurantVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class SearchService {

	@Autowired
	private SearchMapper searchMapper;
	
	public List<RestaurantVO> search(SearchVO searchVO) throws Exception {
		return searchMapper.search(searchVO);
	}
	
	public List<RestaurantVO> detailSearch(SearchVO searchVO) throws Exception{
		return searchMapper.detailSearch(searchVO);
	}
	
	public List<HashtagVO> hashtagList() throws Exception{
		return searchMapper.hashtagList();
	}
}
