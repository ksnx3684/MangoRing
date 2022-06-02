package com.project.mango.search;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
import org.json.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.json.JsonParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.mango.category.CategoryVO;
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
	
	// mainSearch 기능
	@GetMapping("result")
	public String mainSearch(Model model, SearchVO searchVO) throws Exception{
		List<RestaurantVO> list = searchService.mainSearch(searchVO);
		model.addAttribute("list", list);
		return "search/searchResult";
	}
	
	// detailSearch form 이동
	@GetMapping("detailSearch")
	public void detailSearch(Model model) throws Exception{
		List<CategoryVO> categoryList = searchService.categoryList();
		List<HashtagVO> list = searchService.hashtagList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("list", list);
	}
	
	// detailSearch 기능
	@GetMapping("detailSearchResult")
	public String detailSearch(Model model, SearchVO searchVO, String city, String menu,
			@RequestParam(value="category", required = false) Long[] category,
			@RequestParam(value="hashtag", required = false) Long[] hashtag) throws Exception{
		String cities = city;
		searchVO.setAddress(cities);
		searchVO.setDetailAddress(cities);
		searchVO.setName(menu);

		searchVO.setCategoryNum(category);
		searchVO.setTagNum(hashtag);
		
		
		List<RestaurantVO> list = searchService.detailSearch(searchVO);
		model.addAttribute("list", list);
		return "search/searchResult";
	}
	
	
//	// weatherSearch
//	@GetMapping("weatherSearch")
//	public void weatherSearch() throws Exception{
//		
//		// 인증키 (개인이 받아와야함)
//    	String key = "ddb1d4df43843433217f1032972bd01f";
//
//    	// 파싱한 데이터를 저장할 변수
//    	String result = "";
//
//    	try {
//
//    		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key="
//    				+ key + "&movieCd=20124039");
//
//    		BufferedReader bf;
//
//    		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
//
//    		result = bf.readLine();
//    		org.json.simple.parser.JSONParser jsonParser = new org.json.simple.parser.JSONParser();
//
////        	JSONParser jsonParser = new JSONParser();
//        	JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
//        	JSONObject movieInfoResult = (JSONObject)jsonObject.get("movieInfoResult");
//        	JSONObject movieInfo = (JSONObject)movieInfoResult.get("movieInfo");
//
//        	JSONArray nations = (JSONArray)movieInfo.get("nations");
//        	JSONObject nations_nationNm = (JSONObject)nations.get(0);
//
//        	JSONArray directors = (JSONArray)movieInfo.get("directors");
//        	JSONObject directors_peopleNm = (JSONObject)directors.get(0);
//
//        	JSONArray genres = (JSONArray)movieInfo.get("genres");
//
//        	JSONArray actors = (JSONArray)movieInfo.get("actors");
//
//        	System.out.println("영화코드 : " + movieInfo.get("movieCd"));
//        	System.out.println("영화명(한글) : " + movieInfo.get("movieNm"));
//        	System.out.println("영화명(영문) : " + movieInfo.get("movieNmEn"));
//        	System.out.println("재생시간 : " + movieInfo.get("showTm"));
//        	System.out.println("개봉일 : " + movieInfo.get("openDt"));
//        	System.out.println("영화유형 : " + movieInfo.get("typeNm"));
//        	System.out.println("제작국가명 : " + nations_nationNm.get("nationNm"));
//       	
//        	String genreNm = "";
//       	
//        	for(int i = 0; i < genres.length(); i++) {
//            	JSONObject genres_genreNm = (JSONObject)genres.get(i);
//            	genreNm += genres_genreNm.get("genreNm") + " ";
//        	}
//
//        	System.out.println("장르 : " + genreNm);
//       	
//        	System.out.println("감독명 : " + directors_peopleNm.get("peopleNm"));
//       	
//        	String peopleNm = "";
//       	
//        	for(int i = 0; i < actors.length(); i++) {
//        		JSONObject actors_peopleNm = (JSONObject)actors.get(i);
//        		peopleNm += actors_peopleNm.get("peopleNm") + " ";
//        		peopleNm = peopleNm + actors_peopleNm.get("peopleNm") + " ";
//        	}
//       	
//        	System.out.println("출연배우 : " + peopleNm);
//
//    	}catch(Exception e) {
//    		e.printStackTrace();
//    	}
//		
//	}
	
	
//	// weatherSearch
//	@GetMapping("weatherSearch")
//	@ResponseBody
//	public String restApiGetWeather(Model model) throws Exception{
//		
//		String key = searchService.dataKR();
//		
//		Date date = new Date();
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
//		String base_date = simpleDateFormat.format(date);
//		String base_time = "0800";
//		String nx = "55";
//		String ny = "124";
//
//		
//		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
//				+ "?serviceKey=oT4ZJQ97EhLHZ0KEEiCtqdd1sRFMwqZbEz7c3Vn0u2odDJhyjCtD7IDQ4NvZpnDuccVBTWA15u7lbEiX1j8QDg%3D%3D"
//				+ "&dataType=JSON"
//				+ "&numOfRows=10"
//				+ "&pageNo=1"
//				+ "&base_date=" + base_date
//				+ "&base_time=" + base_time
//				+ "&nx=" + nx
//				+ "&ny=" + ny;
//		
//		HashMap<String, Object> resultMap = getDataFromJson(url, "UTF-8", "get", "");
//		
//		System.out.println("# Result : " + resultMap);
//		
//		JSONObject jsonObj = new JSONObject();
//		
//		jsonObj.put("result", resultMap);
//		
//		model.addAttribute("result", jsonObj.get("result"));
//		
//		return jsonObj.toString();
//		
//	}
//	
//	public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception{
//		boolean isPost = false;
//		
//		if("post".equals(type)) {
//			isPost = true;
//		} else {
//			url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
//		}
//		
//		return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
//	}
//	
//	public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception{
//		URL apiURL = new URL(url);
//		
//		HttpURLConnection conn = null;
//		BufferedReader br = null;
//		BufferedWriter bw = null;
//		
//		HashMap<String, Object> resultMap = new HashMap<>();
//		
//		try {
//			conn = (HttpURLConnection)apiURL.openConnection();
//			conn.setConnectTimeout(5000);
//			conn.setReadTimeout(5000);
//			conn.setDoOutput(true);
//			
//			if(isPost) {
//				conn.setRequestMethod("POST");
//				conn.setRequestProperty("Content-Type", contentType);
//				conn.setRequestProperty("Accept", "*/*");
//			} else {
//				conn.setRequestMethod("GET");
//			}
//			
//			conn.connect();
//			
//			if(isPost) {
//				bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
//				bw.write(parameter);
//				bw.flush();
//				bw = null;
//			}
//			
//			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));
//			
//			String line = null;
//			
//			StringBuffer result = new StringBuffer();
//			
//			while ((line=br.readLine()) != null) result.append(line);
//			
//			ObjectMapper mapper = new ObjectMapper();
//			
//			resultMap = mapper.readValue(result.toString(), HashMap.class);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new Exception(url + "interface failed" + e.toString());
//		} finally {
//			if(conn != null) conn.disconnect();
//			if(br != null) br.close();
//			if(bw != null) bw.close();
//		}
//		
//		return resultMap;
//		
//	}
	
}
