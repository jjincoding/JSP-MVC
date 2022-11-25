package com.web.board.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.exe.Service;

import net.webjjang.util.PageObject;

public class BoardListService implements Service {
	
	private BoardDAO dao;
	
	public BoardListService(BoardDAO dao) {
		this.dao = dao;
	}
	
	public List<BoardVO> service(Object obj) throws Exception {
		System.out.println("BoardListService.service()");
		PageObject pageObject = (PageObject) obj;
		// 화면을 위한 전체 데이터 개수 세팅과 계산
		pageObject.setTotalRow(dao.getCount());
		return dao.list(pageObject);
	}
}
