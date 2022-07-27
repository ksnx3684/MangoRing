package com.project.mango.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.mango.member.MemberVO;

@Component
public class ManagerInterceptor implements HandlerInterceptor{

	@Autowired(required = false)
	private MemberVO memberVO;
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		// TODO Auto-generated method stub
//		
//		boolean check = false;
//		
//		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
//		System.out.println("============"+memberVO.getUserType());
//		
//		if(memberVO.getUserType() == 3) {
//			check = true;
//		}
//		
//		if(!check) {	
//			request.setAttribute("message", "권한이 없습니다.");
//			request.setAttribute("path", "../");
//			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
//			view.forward(request, response);	
//		}
//		
//		return check;
//	}
//	
//}

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean check = false;
		
		//사용자가 3이면 통과 아니면 거절
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		
		//관리자계정이아니라면
		if(memberVO==null||memberVO.getUserType()!=3) {
			request.setAttribute("message", "접근하실 수 없습니다.");
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			
			return false;
		}
		return true;
	} 

}