package com.project.mango.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.member.MemberVO;
import com.project.mango.restaurant.RestaurantVO;

@Mapper
public interface ReviewMapper {
	
	//report
	public int setReport(ReviewVO reviewVO)throws Exception;
	
	//fileDelete
	public int setFileDelete(ReviewFilesVO reviewFilesVO)throws Exception;
	
	//fileDetail
	public ReviewFilesVO getFileDetail(ReviewFilesVO reviewFilesVO)throws Exception;
	
	//fileAdd
	public int setFileAdd(ReviewFilesVO reviewFilesVO)throws Exception;
	
	//fileList
	public List<ReviewFilesVO> getFileList(ReviewVO reviewVO)throws Exception;
	
	//delete
	public int setDelete(ReviewVO reviewVO)throws Exception;
	
	//add
	public int setAdd(ReviewVO reviewVO)throws Exception;
	
	//update
	public int setUpdate(ReviewVO reviewVO)throws Exception;
	
	//detail
	public ReviewVO getDetailReview(ReviewVO reviewVO)throws Exception;
	
	//list
	public List<ReviewVO> getListReview(ReviewVO reviewVO)throws Exception;
	
	//count
	public long countReview(ReviewVO reviewVO)throws Exception;
	
	//리뷰 맛있어요 갯수
	public Long goodCount(ReviewVO reviewVO)throws Exception;
	
	//리뷰 보통이에요 갯수
	public Long normalCount(ReviewVO reviewVO)throws Exception;
	
	//리뷰 별로에요 갯수
	public Long badCount(ReviewVO reviewVO)throws Exception;
	
	//리뷰 리스트 조회
	public List<ReviewVO> reviewList() throws Exception;

	//조회
	public int approval(MemberVO memberVO) throws Exception;
	
	public int napproval(MemberVO memberVO) throws Exception;
	//조회
	public int rapproval(MemberVO memberVO) throws Exception;
	
	public int rnapproval(MemberVO memberVO) throws Exception;
	
	

}
