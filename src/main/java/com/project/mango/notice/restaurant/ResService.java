package com.project.mango.notice.restaurant;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.board.BoardService;
import com.project.mango.board.BoardVO;
import com.project.mango.util.FileManager;
import com.project.mango.util.Pager;


@Service
public class ResService{
	
	@Autowired
	private ResMapper resMapper;
	
	@Autowired
	private FileManager fileManager;
	
	
	//detail
	public ResNoticeVO getDetail(ResNoticeVO resNoticeVO)throws Exception {
		return resMapper.getDetail(resNoticeVO);
	}
	
	//list
	public List<ResNoticeVO> getList(ResNoticeVO resNoticeVO) throws Exception {
	return resMapper.getList();
	}
	
	
	//update
	public int setUpdate(ResNoticeVO resNoticeVO) throws Exception {
		return resMapper.setUpdate(resNoticeVO);
	}
	
	//delete
	public int setDelete(ResNoticeVO resNoticeVO) throws Exception {
		List<ResFilesVO> ar = resMapper.getFileList(resNoticeVO);
		int result = resMapper.setDelete(resNoticeVO);
		for(ResFilesVO f : ar) {
			fileManager.fileDelete(f.getFileName(), "resources/upload/resNotice");
		}
		return result;
	}
	
	//add
	public int setAdd(ResNoticeVO resNoticeVO, MultipartFile[] files) throws Exception{
		int result = resMapper.setAdd(resNoticeVO);
		if(files != null && result > 0) {
			for(MultipartFile mf : files) {
				if (mf.isEmpty()) {
					continue;
				}
				
				//hdd
				String fileName = fileManager.fileSave(mf, "resources/upload/resNotice");
				
				//DB
				ResFilesVO resFilesVO = new ResFilesVO();
				resFilesVO.setNum(resNoticeVO.getNum());
				resFilesVO.setFileName(fileName);
				resFilesVO.setOriName(mf.getOriginalFilename());
				result = resMapper.setFileAdd(resFilesVO);
				
				if(result < 1) {
					throw new SQLException();
				}
			}
		}
		return result;
	}
	
	
	//file
	public ResFilesVO getFileDetail(ResFilesVO resFilesVO) throws Exception {
		return resMapper.getFileDetail(resFilesVO);
	}
	
	//summerNote
	public String setSummerFileUpload(MultipartFile files) throws Exception {
		String fileName = fileManager.fileSave(files, "resources/upload/resNotice");
			fileName = "/resources/upload/resNotice"+fileName;
		return fileName;
	}
	 
	
	public boolean setSummerFileDelete(String fileName) throws Exception {
		fileName = fileName.substring(fileName.lastIndexOf("/")+1);
		return fileManager.fileDelete(fileName, "/resources/upload/resNotice");
	}


}