package com.project.mango.owner;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.hashtag.HashtagService;
import com.project.mango.hashtag.HashtagVO;
import com.project.mango.member.MemberVO;
import com.project.mango.menu.MenuFileVO;
import com.project.mango.menu.MenuService;
import com.project.mango.menu.MenuVO;
import com.project.mango.order.OrderService;
import com.project.mango.order.PaymentVO;
import com.project.mango.promotion.PromotionService;
import com.project.mango.promotion.PromotionVO;
import com.project.mango.reservation.ReservationService;
import com.project.mango.reservation.ReservationVO;
import com.project.mango.restaurant.RestaurantFileVO;
import com.project.mango.restaurant.RestaurantService;
import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.review.ReviewService;
import com.project.mango.review.ReviewVO;
import com.project.mango.util.PackagePager;
import com.project.mango.util.ReservationPager;

@Controller
@RequestMapping(value="owner/*")
public class OwnerController {
	
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private HashtagService hashtagService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private PromotionService promotionService;
	
	@GetMapping("list")
	public ModelAndView getList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		RestaurantVO restaurantVO = new RestaurantVO();
		
		//임시 (로그인 추가되면 수정), Mapper에 parameter도 MemberVO로 바꾸기
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		restaurantVO.setId(memberVO.getId());
		
		//가게 정보
		restaurantVO = restaurantService.getList(restaurantVO);

		mv.addObject("restaurantVO", restaurantVO);
		mv.setViewName("owner/list");
		
		return mv;
	}
	
	@GetMapping("reservationManage")
	public ModelAndView reservationManage(ReservationVO reservationVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("restaurantNum", reservationVO.getRestaurantNum());
		mv.setViewName("owner/reservationManage");
		
		return mv;
	}
	
	@PostMapping("reservationList")
	public ModelAndView getReservationList(ReservationPager reservationPager, String startDate, String endDate) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(startDate != null) {
			reservationPager.setStartDate(Date.valueOf(startDate));
		}
		
		if(endDate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdf.parse(endDate));
			cal.add(Calendar.DATE, 1);
			String result = sdf.format(cal.getTime());
			
			reservationPager.setEndDate(Date.valueOf(result));
			
		}
		
		//예약 리스트
		List<ReservationVO> reservationVOs = reservationService.getList(reservationPager);
		
		mv.addObject("reservationVOs", reservationVOs);
		mv.addObject("pager", reservationPager);
		mv.setViewName("common/reservationList");
		
		return mv;
	}
	
	@PostMapping("reportList")
	public ModelAndView getReportList(ReservationPager reservationPager, String startDate, String endDate) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(startDate != null) {
			reservationPager.setStartDate(Date.valueOf(startDate));
		}
		
		if(endDate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdf.parse(endDate));
			cal.add(Calendar.DATE, 1);
			String result = sdf.format(cal.getTime());
			
			reservationPager.setEndDate(Date.valueOf(result));
			
		}
		
		List<ReservationVO> reportList = reservationService.getReportList(reservationPager);
		
		mv.addObject("reportList", reportList);
		mv.addObject("pager2", reservationPager);
		mv.setViewName("common/reportList");
		
		return mv;
	}
	
	@PostMapping("changeReservation")
	public ModelAndView setChangeReservation(ReservationVO reservationVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = reservationService.setChangeReservation(reservationVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("packageManage")
	public ModelAndView packageManage(PackagePager packagePager, String startDate, String endDate, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		RestaurantVO restaurantVO = restaurantService.getRestaurantNum(memberVO);
		packagePager.setRestaurantNum(restaurantVO.getRestaurantNum());
		
		if(startDate != null) {
			packagePager.setStartDate(Date.valueOf(startDate));
		}
		
		if(endDate != null) {
			packagePager.setEndDate(Date.valueOf(endDate));
		}

		List<PaymentVO> packageList = orderService.getOrderList(packagePager);
		
		mv.addObject("packageList", packageList);
		mv.addObject("pager", packagePager);
		mv.setViewName("owner/packageManage");
		
		return mv;
	}
	
	@GetMapping("packageDetail")
	public ModelAndView packageDetail(PaymentVO paymentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		paymentVO = orderService.getOrderDetail(paymentVO);
		
		mv.addObject("paymentVO", paymentVO);
		
		return mv;
	}
	
	@PostMapping("waitingUpdate")
	public ModelAndView setWaitingUpdate(PaymentVO paymentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = orderService.setWaitingUpdate(paymentVO);
		
		mv.setViewName("redirect:./packageManage");
		
		return mv;
	}
	
	@PostMapping("visitUpdate")
	public ModelAndView setVisitUpdate(PaymentVO paymentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = orderService.setVisitUpdate(paymentVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping("shop/add")
	public ModelAndView setAdd(RestaurantVO restaurantVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		restaurantVO = restaurantService.getDetail(restaurantVO);
		List<HashtagVO> hashtagVOs = hashtagService.getList();
		
		mv.addObject("hashtagVOs", hashtagVOs);
		mv.addObject("restaurantVO", restaurantVO);
		mv.setViewName("owner/shop/add");
		
		return mv;
	}
	
	@PostMapping("shop/add")
	public ModelAndView setRegistration(MultipartFile restFile, MultipartFile [] menuFiles, RestaurantVO restaurantVO, MenuVO menuVO, @RequestParam List<String> tagNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
//		for(MultipartFile mf : files) {
//			System.out.println(mf.getOriginalFilename());
//		}
//		
//		System.out.println("===================================");
//		
//		for(MultipartFile mf : menuFiles) {
//			System.out.println(mf.getOriginalFilename());
//		}
//		
//		System.out.println("===================================");
//		
//		System.out.println(restaurantVO.getRestaurantPhone());
//		System.out.println(restaurantVO.getIntroduction());
//		
//		System.out.println("===================================");
//		
//		for(MenuVO menu : menuVO.getMenuVOList()) {
//			System.out.println(menuVO.getMenuVOList().indexOf(menu));
//			System.out.println(menu.getRestaurantNum()); //null로 나옴
//			System.out.println(menu.getName());
//			System.out.println(menu.getDetail());
//			System.out.println(menu.getPrice());
//		}
		
		// 1. restaurant 테이블에 insert
		// 2. 가게 사진 저장하고 res_file 테이블에 insert
		restaurantService.setRegistration(restFile, restaurantVO);
		// 3. menu 테이블에 insert
		// 4. 메뉴 사진 저장하고 menu_file 테이블에 insert
		for(MenuVO menu : menuVO.getMenuVOList()) {
			menu.setRestaurantNum(restaurantVO.getRestaurantNum());
			menuService.setAdd(menuFiles[menuVO.getMenuVOList().indexOf(menu)], menu);
		}

		// 5. 해쉬태그 관련 추가
		for(String num : tagNum) {
			HashtagVO hashtagVO = new HashtagVO();
			hashtagVO.setTagNum(Long.parseLong(num));
			restaurantService.setRestuarantTag(restaurantVO, hashtagVO);
		}

		mv.setViewName("redirect:../list");
		
		return mv;
	}
	
	@GetMapping("shop/update")
	public ModelAndView setUpdate(RestaurantVO restaurantVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		//가게의 메뉴
		List<MenuVO> menuVOs = menuService.getList(restaurantVO);
		//전체 해쉬태그
		List<HashtagVO> allTagList = hashtagService.getList();
		//가게의 해쉬태그
		RestaurantVO selectedList = restaurantService.getSelectedList(restaurantVO);
		restaurantVO = restaurantService.getDetail(restaurantVO);
		
		mv.addObject("menuVOs", menuVOs);
		mv.addObject("allTagList", allTagList);
		mv.addObject("selectedList", selectedList);
		mv.addObject("restaurantVO", restaurantVO);
		mv.setViewName("owner/shop/update");
		return mv;
	}
	
	@PostMapping("shop/update")
	public ModelAndView setUpdate(MultipartFile restFile, MultipartFile [] menuFiles2, RestaurantVO restaurantVO, MenuVO menuVO, @RequestParam List<String> tagNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		
		//레스토랑 파일, 정보 업데이트
		if(restFile != null) {
			result = restaurantService.setUpdate(restFile, restaurantVO);
		}else {
			result = restaurantService.setUpdateNoFile(restaurantVO);
		}
		
		//원래 있던 메뉴 업데이트
		for(MenuVO menu : menuVO.getMenuVOList()) {	
			menuService.setUpdate(menu);
		}
		
		//추가된 메뉴 insert
		if(menuVO.getMenuVOList2() != null) {		
			for(MenuVO menu : menuVO.getMenuVOList2()) {
				menu.setRestaurantNum(restaurantVO.getRestaurantNum());
				menuService.setAdd(menuFiles2[menuVO.getMenuVOList2().indexOf(menu)], menu);
			}
		}
		
		//해쉬태그 업데이트
		//원래 있던 태그 모두 삭제
		result = restaurantService.setAllTagDelete(restaurantVO);
		//선택된 태그들 다시 insert
		for(String num : tagNum) {
			HashtagVO hashtagVO = new HashtagVO();
			hashtagVO.setTagNum(Long.parseLong(num));
			restaurantService.setRestuarantTag(restaurantVO, hashtagVO);
		}
		
		mv.setViewName("redirect:../list");
		return mv;
	}
	
	@GetMapping("shop/delete")
	public ModelAndView setDelete(RestaurantVO restaurantVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		restaurantVO = restaurantService.getDetail(restaurantVO);
		List<RestaurantFileVO> restFiles = new ArrayList<RestaurantFileVO>();
		for(RestaurantFileVO restFile : restaurantVO.getRestaurantFileVOs()) {
			restFile = restaurantService.getFileDetail(restFile);
			restFiles.add(restFile);
		}
		List<MenuVO> menuVOs = menuService.getList(restaurantVO);
		List<MenuFileVO> menuFiles = new ArrayList<MenuFileVO>();
		for(MenuVO menuVO : menuVOs) {
			MenuFileVO menuFile = menuService.getFileDetail(menuVO.getMenuFileVO());
			menuFiles.add(menuFile);
		}
		
		int result = restaurantService.setDelete(restaurantVO);
		
		if(result > 0) {
			
			//가게 파일 삭제
			for(RestaurantFileVO restFile : restFiles) {
				boolean check = restaurantService.setFileDeleteOnly(restFile);
			}
			
			//메뉴 파일 삭제
			for(MenuFileVO menuFile : menuFiles) {
				boolean check = menuService.setFileDeleteOnly(menuFile);
			}
	
		}
		
		mv.setViewName("redirect:../list");
		return mv;
	}
	
	@PostMapping("shop/fileDelete")
	public ModelAndView setFileDelete(RestaurantFileVO restaurantFileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = restaurantService.setFileDelete(restaurantFileVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("shop/menuDelete")
	public ModelAndView setMenuDelete(MenuFileVO menuFileVO, MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = menuService.setDelete(menuFileVO, menuVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}

	
	// -------- ownerPage
	
	@GetMapping("shop/ownerPage")
	public ModelAndView getOwnerPage(HttpSession session,RestaurantVO restaurantVO,ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		restaurantVO.setId(memberVO.getId()); //레스토랑 정보 ?
		restaurantVO= restaurantService.getList(restaurantVO);
		
		reviewVO.setRestaurantNum(restaurantVO.getRestaurantNum());
		reviewVO.setId(memberVO.getId());
		List<ReviewVO> ar= reviewService.getListReview(reviewVO);
		
		List<PromotionVO> arPromo = promotionService.getList();
		mv.setViewName("owner/shop/ownerPage");
		mv.addObject("rest",restaurantVO);
		mv.addObject("list",ar);
		mv.addObject("listPromo",arPromo);
		return mv;
	}
	
	/*
	 * @GetMapping("detail") public ModelAndView getDetailWM(RestaurantVO
	 * restaurantVO,ReviewVO reviewVO,MenuVO menuVO)throws Exception{ ModelAndView
	 * mv = new ModelAndView();
	 * 
	 * //레스토랑 정보 , 카테고리 종류 restaurantVO =
	 * restaurantService.getDetailWM(restaurantVO);
	 * 
	 * 
	 * 
	 * //MenuVO menuVO = restaurantService.getDetail(restaurantVO.getMenuVO());
	 * 
	 * 
	 * //리뷰 디테일로 가는 리스트 //ReviewVO reviewVO =new ReviewVO();
	 * reviewVO.setRestaurantNum(restaurantVO.getRestaurantNum());
	 * System.out.println(restaurantVO.getRestaurantNum());
	 * System.out.println(reviewVO.getRseNum());
	 * System.out.println(reviewVO.getRssNum()); List<ReviewVO> ar =
	 * reviewService.getListReview(reviewVO);
	 * 
	 * 
	 * System.out.println(menuVO.getMenuNum());
	 * 
	 * menuVO.setRestaurantNum(restaurantVO.getRestaurantNum()); List<MenuVO> menuAr
	 * = restaurantService.getListWM(menuVO);
	 * 
	 * 
	 * 
	 * //전체 리뷰 카운트 long count = reviewService.countReview(reviewVO);
	 * 
	 * //맛있어요 리뷰 카운트 long goodCount = reviewService.goodCount(reviewVO);
	 * 
	 * //보통이에요 리뷰 카운트 long normalCount = reviewService.normalCount(reviewVO);
	 * 
	 * //별로에요 리뷰 카운트 long badCount = reviewService.badCount(reviewVO);
	 * 
	 * 
	 * mv.addObject("count",count); mv.addObject("goodCount",goodCount);
	 * mv.addObject("normalCount",normalCount); mv.addObject("badCount",badCount);
	 * mv.addObject("list",ar); mv.addObject("vo",restaurantVO.getCategoryVO());
	 * //카테고리 종류 mv.addObject("vo1",restaurantVO); //레스토랑 정보
	 * mv.addObject("menu",menuAr); mv.setViewName("restaurant/detail"); return mv;
	 */
}
