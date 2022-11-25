package com.web.util.init;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
// import javax.serlvet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.web.board.dao.BoardDAO;
import com.web.board.service.*;
import com.web.main.exe.Beans;

// @WebServlet("/InitServ")
public class InitServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InitServ() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("InitServ.init()");
		// DB 사용할 객체 확인
		try {
			Class.forName("com.web.util.db.DBInfo");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ServletException("DB를 처리하는 객체가 없습니다");
		}
		// 사용할 모든 객체를 생성해서 저장 -> Beans 객체에 저장
		// DAO를 생성해서 넣어 주는 프로그램 작성
		Beans.setDAO("boardDAO", new BoardDAO());
		// Service를 생성해서 넣어 주는 프로그램 작성
		Beans.setService("/board/list.jsp", new BoardListService((BoardDAO) Beans.getDAO("boardDAO")));
		Beans.setService("/board/write.jsp", new BoardWriteService((BoardDAO) Beans.getDAO("boardDAO")));
		Beans.setService("/board/view.jsp", new BoardViewService((BoardDAO) Beans.getDAO("boardDAO")));
		Beans.setService("/board/update.jsp", new BoardUpdateService((BoardDAO) Beans.getDAO("boardDAO")));
		Beans.setService("/board/delete.jsp", new BoardDeleteService((BoardDAO) Beans.getDAO("boardDAO")));
		// System.out.println(Beans.getService("/board/list.jsp"));
		System.out.println("객체 생성 완료");
	}
	
}
