package com.project.mango.search;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.mango.restaurant.RestaurantVO;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	@Autowired
	private SearchService searchService;

	// search form 이동
	@GetMapping("search")
	public void search() throws Exception{
	}
	
	// search 기능
	@GetMapping("searchResult")
	public String search(Model model, SearchVO searchVO) throws Exception{
		List<RestaurantVO> list = searchService.search(searchVO);
		model.addAttribute("list", list);
		return "search/searchResult";
	}
	
	// detailSearch form 이동
	@GetMapping("detailSearch")
	public void detailSearch(Model model) throws Exception{
		List<HashtagVO> list = searchService.hashtagList();
		model.addAttribute("list", list);
	}
	
	// detailSearch 기능
	@GetMapping("detailSearchResult")
	public String detailSearch(Model model, SearchVO searchVO, String city, String menu,
			@RequestParam(value="hashtag", required = false) Long[] hashtag) throws Exception{
		String cities = city;
		searchVO.setAddress(cities);
		searchVO.setDetailAddress(cities);
		searchVO.setName(menu);

		searchVO.setTagNum(hashtag);
		
		
		List<RestaurantVO> list = searchService.detailSearch(searchVO);
		model.addAttribute("list", list);
		return "search/searchResult";
	}
	
}
