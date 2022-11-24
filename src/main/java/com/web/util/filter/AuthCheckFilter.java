package com.web.util.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.vo.LoginVO;
// import javax.servlet.annotation.WebFilter;

// @WebFilter("/AuthCheckFilter")
public class AuthCheckFilter implements Filter {

	private static Map<String, Integer> authMap = new HashMap<String, Integer>();

	static {
		// authMap 데이터 세팅
		// 메시지 권한
		authMap.put("/message/list.jsp", 1);
		authMap.put("/message/writeForm.jsp", 1);
		authMap.put("/message/write.jsp", 1);
		authMap.put("/message/view.jsp", 1);
		authMap.put("/message/answerForm.jsp", 1);
		authMap.put("/message/answer.jsp", 1);
		
		// 공지사항 권한
		authMap.put("/notice/writeForm.jsp", 9);
		authMap.put("/notice/write.jsp", 9);
	}
	
    public AuthCheckFilter() { 
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("AuthCheckFilter.doFilter()");
		// 사용자가 요청한 URI 가져오기
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String uri = req.getServletPath();
		System.out.println("AuthCheckFilter.doFilter().uri:" + uri);
		
		// 로그인 확인 처리
		Integer pageGrade = authMap.get(uri);
		if (pageGrade != null && pageGrade >= 1) {
			// 로그인이 필요한 경우의 처리
			LoginVO login = (LoginVO) session.getAttribute("login");
			// 로그인이 되어 있지 않으면 로그인 오류 페이지로 이동
			if (login == null) {
				res.sendRedirect("/mini/error/login_error.jsp");
				return;
			}
			
			// 권한 처리
			Integer userGradeNo = login.getGradeNo();
			// uri에 맞는 페이지 권한보다 사용자의 권한이 적으면 접근 권한 오류 페이지로 이동
			if (pageGrade > userGradeNo) {
				res.sendRedirect("/mini/error/auth_error.jsp");
			}
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
