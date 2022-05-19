package com.project.mango.restaurant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.hashtag.HashtagVO;
import com.project.mango.util.FileManager;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;
	@Autowired
	private FileManager fileManager;
	
	public RestaurantVO getList(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.getList(restaurantVO);
	}
	
	public RestaurantVO getDetail(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.getDetail(restaurantVO);
	}
	
	public int setRegistration(MultipartFile [] files, RestaurantVO restaurantVO) throws Exception {
		int result = restaurantMapper.setRegistration(restaurantVO);
		
		if(files != null) {
			for(MultipartFile mf : files) {
				if(mf.isEmpty()) {
					continue;
				}
				
				String fileName = fileManager.fileSave(mf, "/resources/upload/restaurant/");
				
				RestaurantFileVO restaurantFileVO = new RestaurantFileVO();
				restaurantFileVO.setRestaurantNum(restaurantVO.getRestaurantNum());
				restaurantFileVO.setFileName(fileName);
				restaurantFileVO.setOriName(mf.getOriginalFilename());
				
				restaurantMapper.setFileAdd(restaurantFileVO);
			}
		}
		
		return result;
	}
	
	public int setUpdate(MultipartFile [] files, RestaurantVO restaurantVO) throws Exception {
		int result = restaurantMapper.setUpdate(restaurantVO);
		
		if(files != null) {
			for(MultipartFile mf : files) {
				if(mf.isEmpty()) {
					continue;
				}
				
				String fileName = fileManager.fileSave(mf, "/resources/upload/restaurant/");
				
				RestaurantFileVO restaurantFileVO = new RestaurantFileVO();
				restaurantFileVO.setRestaurantNum(restaurantVO.getRestaurantNum());
				restaurantFileVO.setFileName(fileName);
				restaurantFileVO.setOriName(mf.getOriginalFilename());
				
				restaurantMapper.setFileAdd(restaurantFileVO);
			}
		}
		
		return result;
	}
	
	public int setDelete(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.setDelete(restaurantVO);
	}
	
	public int setFileDelete(RestaurantFileVO restaurantFileVO) throws Exception {
		
		restaurantFileVO = restaurantMapper.getFileDetail(restaurantFileVO);
		
		//DB
		int result = restaurantMapper.setFileDelete(restaurantFileVO);
		
		//HDD
		if(result > 0) {
			boolean check = fileManager.fileDelete(restaurantFileVO.getFileName(), "/resources/upload/restaurant/");
		}
		
		return result;
	}
	
	public int setRestuarantTag (RestaurantVO restaurantVO, HashtagVO hashtagVO) throws Exception {
		Map<String, Long> map = new HashMap<>();
		map.put("restaurantNum", restaurantVO.getRestaurantNum());
		map.put("tagNum", hashtagVO.getTagNum());
		
		int result = restaurantMapper.setRestaurantTag(map);
		
		return result;
	}
	
	public RestaurantVO getSelectedList(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.getSelectedList(restaurantVO);
	}
	
	public int setAllTagDelete(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.setAllTagDelete(restaurantVO);
	}
	
}
