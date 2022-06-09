package com.project.mango.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.FileManager;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private FileManager filemanager;
	
	public int setReport(ReviewVO reviewVO)throws Exception{
		return reviewMapper.setReport(reviewVO);
	}
	
	
	public int setFileDelete(ReviewFilesVO reviewFilesVO)throws Exception{
		
		reviewFilesVO = reviewMapper.getFileDetail(reviewFilesVO);
		
		int check = reviewMapper.setFileDelete(reviewFilesVO);
		if(check>0) {
			boolean result = filemanager.fileDelete(reviewFilesVO.getFileName(), "/resources/upload/review/");
		}
		return check;
	}
	

	public int setDelete(ReviewVO reviewVO)throws Exception{
		
		List<ReviewFilesVO> ar = reviewMapper.getFileList(reviewVO);
		int result = reviewMapper.setDelete(reviewVO);
		
		System.out.println("fileSize:"+ar.size());
		for(ReviewFilesVO r : ar) {
			filemanager.fileDelete(r.getFileName(), "resources/upload/review");
		}
		return result;
	}
	
	
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
	
	public int setUpdate(ReviewVO reviewVO,MultipartFile[] multipartFiles)throws Exception{
		int result =reviewMapper.setUpdate(reviewVO);
		
		if(multipartFiles != null)
			
			for(MultipartFile multipartFile: multipartFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				ReviewFilesVO reviewFilesVO = new ReviewFilesVO();
				
				String fileName = filemanager.fileSave(multipartFile, "/resources/upload/review/");
				reviewFilesVO.setFileName(fileName);
				reviewFilesVO.setOriName(multipartFile.getOriginalFilename());
				reviewFilesVO.setReviewNum(reviewVO.getReviewNum()); //??
				result = reviewMapper.setFileAdd(reviewFilesVO);
			}
		return result;
	}
	
	public ReviewVO getDetailReview(ReviewVO reviewVO)throws Exception{
		return reviewMapper.getDetailReview(reviewVO);
	}
	
	public List<ReviewVO> getListReview(ReviewVO reviewVO)throws Exception{
		return reviewMapper.getListReview(reviewVO);
		
	}
	
	public long countReview(ReviewVO reviewVO)throws Exception{
		return reviewMapper.countReview(reviewVO);
	}
	//리뷰 좋아요 갯수
	public long goodCount(ReviewVO reviewVO)throws Exception{
		return reviewMapper.goodCount(reviewVO);
	}
	
	//리뷰 보통이에요 갯수
	public Long normalCount(ReviewVO reviewVO)throws Exception{
		return reviewMapper.normalCount(reviewVO);
	}
	
	//리뷰 별로에요 갯수
	public Long badCount(ReviewVO reviewVO)throws Exception{
		return reviewMapper.badCount(reviewVO);
	}
	

}
