package com.web.board.service;

import java.util.List;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.exe.Service;

public class BoardListService implements Service {
	
	private BoardDAO dao;
	
	public BoardListService(BoardDAO dao) {
		this.dao = dao;
	}
	
	public List<BoardVO> service(Object obj) throws Exception {
		System.out.println("BoardListService.service()");
		return dao.list();
	}
}
