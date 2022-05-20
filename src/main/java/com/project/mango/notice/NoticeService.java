package com.project.mango.notice;

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
public class NoticeService implements BoardService{

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private FileManger fileManger;

	// list
	public List<BoardVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(noticeMapper.getTotalCount(pager));
	return noticeMapper.getList(pager);

	}

	// detail
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception {
		return noticeMapper.getDetail(noticeVO);
	}

	// update
	public int setUpdate(NoticeVO noticeVO) throws Exception {
		return noticeMapper.setUpdate(noticeVO);
	}

	//delete
	public int setDelete(NoticeVO noticeVO) throws Exception {
		
		List<NoticeFilesVO> ar = noticeMapper.getFileList(noticeVO);
		int result = noticeMapper.setDelete(noticeVO);
		
		for(NoticeFilesVO f : ar) {
			fileManger.fileDelete(f.getFileName(), "resources/upload/notice");
		}
		return result;
	}
	
	// add
	public int setAdd(NoticeVO noticeVO, MultipartFile[] files) throws Exception {
		int result = noticeMapper.setAdd(noticeVO);
		
		if(files != null && result > 0) {
			for(MultipartFile mf : files) {
				if(mf.isEmpty()) {
					continue;
				}
				
				//1.HDD에 저장
				String fileName = fileManger.fileSave(mf, "resources/upload/notice/");
				
				//2. DB에저장
				NoticeFilesVO noticeFilesVO = new NoticeFilesVO();
				noticeFilesVO.setNum(noticeVO.getNum());
				noticeFilesVO.setFileName(fileName);
				noticeFilesVO.setOriName(mf.getOriginalFilename());
				result = noticeMapper.setFileAdd(noticeFilesVO);
				
				if(result < 1) {
					
					throw new SQLException();
				}
				
				
				
			}
		}
		return result;
	}
	
	
	
	//file
	public NoticeFilesVO getFileDetail(NoticeFilesVO noticeFilesVO) throws Exception {
		return noticeMapper.getFileDetail(noticeFilesVO);
	}
	
	//summerNote
	public String setSummerFileUpload(MultipartFile files) throws Exception {
		String fileName = fileManger.fileSave(files, "resources/upload/notice");
		fileName = "/resources/upload/notice/"+fileName;
		return fileName;
	}
	
	public boolean setSummerFileDelete(String fileName) throws Exception{
		fileName = fileName.substring(fileName.lastIndexOf("/")+1);
		return fileManger.fileDelete(fileName, "/resources/upload/notice");
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
