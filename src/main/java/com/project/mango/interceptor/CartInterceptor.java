package com.project.mango.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.mango.member.MemberVO;

@Component
public class CartInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		if(memberVO != null) {
			
			return true;
		
		}
		
		request.setAttribute("message", "먼저 로그인을 해주세요");
		request.setAttribute("path", "../");
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
		view.forward(request, response);
		
		return false;
	}
	
}
