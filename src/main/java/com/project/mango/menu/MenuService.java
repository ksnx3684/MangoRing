package com.project.mango.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.FileManager;

@Service
public class MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private FileManager fileManager;
	
	public List<MenuVO> getList(RestaurantVO restaurantVO) throws Exception {
		return menuMapper.getList(restaurantVO);
	}
	
	public int setAdd(MultipartFile mf, MenuVO menuVO) throws Exception {
		int result = menuMapper.setAdd(menuVO);
		
		if(!mf.isEmpty()) {
			String fileName = fileManager.fileSave(mf, "/resources/upload/menu/");
			
			MenuFileVO menuFileVO = new MenuFileVO();
			menuFileVO.setMenuNum(menuVO.getMenuNum());
			menuFileVO.setFileName(fileName);
			menuFileVO.setOriName(mf.getOriginalFilename());
			
			menuMapper.setFileAdd(menuFileVO);
		}
		
		
		return result;
	}
	
	public int setUpdate(MenuVO menuVO) throws Exception {
		return menuMapper.setUpdate(menuVO);
	}
	
	public int setDelete(MenuFileVO menuFileVO, MenuVO menuVO) throws Exception {
		//사진 지우고 메뉴 DB에서 삭제
		//사진 지우기
		menuFileVO = menuMapper.getFileDetail(menuFileVO);
		int result = menuMapper.setFileDelete(menuFileVO);
		if(result > 0) {
			boolean check = fileManager.fileDelete(menuFileVO.getFileName(), "/resources/upload/menu/");
		}
		
		//메뉴정보 삭제
		result = menuMapper.setDelete(menuVO);
			
		return result;
	}

}
