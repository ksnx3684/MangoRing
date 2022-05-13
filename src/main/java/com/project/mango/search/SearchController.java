package com.project.mango.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
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
	public String search(Model model ,RestaurantVO restaurantVO) throws Exception{
		List<RestaurantVO> list = searchService.search(restaurantVO);
		model.addAttribute("list", list);
		return "search/searchResult";
	}
	
	// detailSearch form 이동
	@GetMapping("detailSearch")
	public void detailSearch() throws Exception{
	}
	
	// detailSearch 기능
	@GetMapping("detailSearchResult")
	public String detailSearch(Model model, SearchVO searchVO, String city, String menu, String star) throws Exception{
		searchVO.setAddress(city);
		searchVO.setName(menu);
		//searchVO.setStar(Float.valueOf(star));
		List<RestaurantVO> list = searchService.detailSearch(searchVO);
		model.addAttribute("list", list);
		return "search/searchResult";
	}
	
}
