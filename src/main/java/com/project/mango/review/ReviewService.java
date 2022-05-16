package com.project.mango.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.util.FileManager;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private FileManager filemanager;
	
	
	public int setAdd(ReviewVO reviewVO,MultipartFile[] files)throws Exception{
		int result= reviewMapper.setAdd(reviewVO);
		
		if(files !=null && result>0) {
			for(MultipartFile mf : files) {
				if(mf.isEmpty()) {
					continue;
				}
				
				String fileName = filemanager.fileSave(mf, "resources/upload/review/");
				System.out.println(fileName);
				
				ReviewFilesVO reviewFilesVO = new ReviewFilesVO();
				reviewFilesVO.setReviewNum(reviewVO.getReviewNum());
				System.out.println(reviewVO.getReviewNum());
				reviewFilesVO.setFileName(fileName);
				reviewFilesVO.setOriName(mf.getOriginalFilename());
				result = reviewMapper.setFileAdd(reviewFilesVO);
				
			}
		}
		return result;
		
	}

}
