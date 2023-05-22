package kr.kr.OnAirAuction.Interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kr.OnAirAuction.VO.MemberVO;

	public class GuestInterceptor extends HandlerInterceptorAdapter  {
		
		@Override
		
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			
			HttpSession session = request.getSession();
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			
			if(user != null) {
				
				response.sendRedirect(request.getContextPath() + "/");
				
				return false;
				
			}
			
			return true;
			
		}
		
	}
