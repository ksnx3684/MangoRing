//package com.project.mango.search;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//import java.util.List;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.project.mango.category.CategoryVO;
//import com.project.mango.restaurant.RestaurantVO;
//
//@SpringBootTest
//class SearchMapperTest {
//
//	@Autowired
//	private SearchMapper searchMapper;
//
//	@Test
//	void search() throws Exception{
//		SearchVO searchVO = new SearchVO();
//		searchVO.setAddress("서울 마포구");
//		searchVO.setName("파스타");
//		List<RestaurantVO> list = searchMapper.search(searchVO);
//		
//		assertNotNull(list);
//	}
//	
//	@Test
//	void mainSearch() throws Exception{
//		SearchVO searchVO = new SearchVO();
//		searchVO.setName("인천");
//		List<RestaurantVO> list = searchMapper.mainSearch(searchVO);
//		
//		assertNotNull(list);
//	}
//	
//	@Test
//	void detailSearch() throws Exception{
//		SearchVO searchVO = new SearchVO();
//		searchVO.setAddress("서울시");
//		searchVO.setDetailAddress("강남구");
//		searchVO.setName("파스타");
//		List<RestaurantVO> list = searchMapper.detailSearch(searchVO);
//		
//		assertNotNull(list);
//	}
//	
//	@Test
//	void categoryList() throws Exception{
//		List<CategoryVO> list = searchMapper.categoryList();
//		
//		assertNotNull(list);
//	}
//	
//	@Test
//	void hashtagList() throws Exception{
//		List<HashtagVO> list = searchMapper.hashtagList();
//		
//		assertNotNull(list);
//	}
//	
//}
