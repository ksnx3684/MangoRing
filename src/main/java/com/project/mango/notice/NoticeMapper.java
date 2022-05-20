package com.project.mango.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.board.BoardMapper;
import com.project.mango.board.BoardVO;
import com.project.mango.util.Pager;

@Mapper
public interface NoticeMapper extends BoardMapper{

	
	//file
	//insert - setFileAdd
	public int setFileAdd(NoticeFilesVO noticeFilesVO) throws Exception;
	
	//delete - setFileDelete
	public int setFileDelete(NoticeFilesVO noticeFilesVO) throws Exception;
	
	//detail - getFiledetail
	public NoticeFilesVO getFileDetail(NoticeFilesVO noticeFilesVO) throws Exception;
	
	//list - getFileList
	public List<NoticeFilesVO> getFileList(NoticeVO noticeVO) throws Exception;
	
	
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception;
	
}
