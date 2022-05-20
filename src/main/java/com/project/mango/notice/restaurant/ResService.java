package com.project.mango.notice.restaurant;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.board.BoardService;
import com.project.mango.board.BoardVO;
import com.project.mango.util.FileManger;
import com.project.mango.util.Pager;


@Service
@Transactional(rollbackFor = Exception.class)
public class ResService implements BoardService{
	
	@Autowired
	private ResMapper resMapper;
	
	@Autowired
	private FileManger fileManger;
	
	
	//detail
	public BoardVO getDetail(ResNoticeVO resNoticeVO)throws Exception {
		return resMapper.getDetail(resNoticeVO);
	}
	
	//list
	public List<BoardVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(resMapper.getTotalCount(pager));
	return resMapper.getList(pager);
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
			fileManger.fileDelete(f.getFileName(), "resources/upload/resNotice");
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
				String fileName = fileManger.fileSave(mf, "resources/upload/resNotice");
				
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
		String fileName = fileManger.fileSave(files, "resources/upload/resNotice");
			fileName = "/resources/upload/resNotice"+fileName;
		return fileName;
	}
	 
	
	public boolean setSummerFileDelete(String fileName) throws Exception {
		fileName = fileName.substring(fileName.lastIndexOf("/")+1);
		return fileManger.fileDelete(fileName, "/resources/upload/resNotice");
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setAdd(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



}
