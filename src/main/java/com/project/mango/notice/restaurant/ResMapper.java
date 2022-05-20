package com.project.mango.notice.restaurant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.board.BoardMapper;
import com.project.mango.util.Pager;


@Mapper
public interface ResMapper extends BoardMapper{
		
		
		//file
		//insert - setFileAdd
		public int setFileAdd(ResFilesVO resFilesVO) throws Exception;
		
		//delete - setFileDelete
		public int setFileDelete(ResFilesVO resFilesVO) throws Exception;
		
		//detail - getFiledetail
		public ResFilesVO getFileDetail(ResFilesVO resFilesVO) throws Exception;
		
		//list - getFileList
		public List<ResFilesVO> getFileList(ResNoticeVO resNoticeVO) throws Exception;
}
