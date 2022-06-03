package com.project.mango.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.board.BoardVO;
import com.project.mango.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	
//	list보기
	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("controller 지나감");
		List<BoardVO> ar = noticeService.getList(pager);
		mv.setViewName("notice/list");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		return mv;
	}
	
	
	//add 이동
	@GetMapping("add")
	public void setAdd() throws Exception{}
	
	//add 입력
	@PostMapping("add")
	public ModelAndView setAdd(NoticeVO noticeVO, MultipartFile [] files) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setAdd(noticeVO, files);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	//detail이동
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.getDetail(noticeVO);
		mv.setViewName("notice/detail");
		mv.addObject("vo", noticeVO);
		return mv;
	}
	
	//update이동
	@GetMapping("update")
	public ModelAndView setUpdate(NoticeVO noticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.getDetail(noticeVO);
		mv.setViewName("notice/update");
		mv.addObject("vo", noticeVO);
		return mv;
	}
	
	//update 입력
	@PostMapping("update")
	public ModelAndView setUpdate(NoticeVO noticeVO, ModelAndView mv) throws Exception {
		int result = noticeService.setUpdate(noticeVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	//delete이동
	@GetMapping("delete")
	public ModelAndView setDelete(NoticeVO noticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setDelete(noticeVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	//file
	@GetMapping("fileDown")
	public ModelAndView getFileDown(NoticeFilesVO noticeFilesVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(noticeFilesVO.getFileName());
		noticeFilesVO = noticeService.getFileDetail(noticeFilesVO);
		mv.addObject("fileVO", noticeFilesVO);
		mv.setViewName("fileDown");
		return mv;
	}
	
	
	//summerFile
	@PostMapping("summerFileUpload")
	public ModelAndView setSummerFileUpload(MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		String fileName = noticeService.setSummerFileUpload(file);
		mv.setViewName("common/result");
		mv.addObject("result", fileName);
		return mv;
	}
	
	@GetMapping("summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName) throws Exception {
		ModelAndView mv = new ModelAndView();
		boolean result = noticeService.setSummerFileDelete(fileName);
		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;
	}
}
