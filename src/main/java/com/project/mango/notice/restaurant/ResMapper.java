package com.project.mango.notice.restaurant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface ResMapper{
		
		//list
		public List<ResNoticeVO> getList() throws Exception;
		
		//detail
		public ResNoticeVO getDetail(ResNoticeVO resNoticeVO) throws Exception;
		
		//add
		public int setAdd(ResNoticeVO resNoticeVO) throws Exception;
		
		//update
		public int setUpdate(ResNoticeVO resNoticeVO)throws Exception;
		
		//delete
		public int setDelete (ResNoticeVO resNoticeVO) throws Exception;
		
//		//totalCount
//		public Long getTotalCount(Pager pager) throws Exception;
		
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
