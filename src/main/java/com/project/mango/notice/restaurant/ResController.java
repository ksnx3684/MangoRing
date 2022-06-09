package com.project.mango.notice.restaurant;

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
import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.Pager;

@Controller
@RequestMapping("/resNotice/*")
public class ResController {
	
	@Autowired
	private ResService resService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "resNotice";
	}
	
	
	//list
	@GetMapping("list")
	public ModelAndView getList(Pager pager, RestaurantVO restaurantVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardVO> ar = resService.getList(pager);
		mv.setViewName("resNotice/list");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.addObject("num", restaurantVO);
		
		return mv;
	}
	
	//add이동
	@GetMapping("add")
	public void setAdd() throws Exception{}
	
	//add입력
	@PostMapping("add")
	public ModelAndView setAdd(ResNoticeVO resNoticeVO, MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = resService.setAdd(resNoticeVO, files);
		mv.setViewName("redirect:./list");
		mv.addObject("add", mv);
		return mv;
	}
	
	
	//detail 이동
	@GetMapping("detail")
	public ModelAndView getDetail(ResNoticeVO resNoticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resNotice/detail");
		resNoticeVO = (ResNoticeVO) resService.getDetail(resNoticeVO);
		mv.addObject("vo", resNoticeVO);
		return mv;
	}
	
	//update이동
	@GetMapping("update")
	public ModelAndView setUpdate(ResNoticeVO resNoticeVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		resNoticeVO = (ResNoticeVO) resService.getDetail(resNoticeVO);
		mv.setViewName("resNotice/update");
		mv.addObject("vo", resNoticeVO);
		return mv;
	}
	
	//update 입력
	@PostMapping("update")
	public ModelAndView setUpdate(ResNoticeVO resNoticeVO, ModelAndView mv) throws Exception{
		int result = resService.setUpdate(resNoticeVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	//delete 이동
	@GetMapping("delete")
	public ModelAndView setDelete(ResNoticeVO resNoticeVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = resService.setDelete(resNoticeVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	//file
	@GetMapping("fileDown")
	public ModelAndView getFileDown(ResFilesVO resFilesVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		resFilesVO = resService.getFileDetail(resFilesVO);
		mv.addObject("fileVO", resFilesVO);
		mv.setViewName("fileDown");
		return mv;
	}
	
	//summerFile
	@PostMapping("summerFileUpload")
	public ModelAndView setSummerFileUpload(MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		String fileName = resService.setSummerFileUpload(file);
		mv.setViewName("common/result");
		mv.addObject("result", fileName);
		return mv;
	}

	@GetMapping("summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName) throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = resService.setSummerFileDelete(fileName);
		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;
	}
}
