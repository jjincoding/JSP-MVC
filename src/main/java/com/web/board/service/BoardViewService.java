package com.web.board.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.exe.Service;

public class BoardViewService implements Service {
	
	private BoardDAO dao;
	
	public BoardViewService(BoardDAO dao) {
		this.dao = dao;
	}
	
	// obj = no
	public BoardVO service(Object obj) throws Exception {
		Integer no = (Integer) obj;
		dao.increase(no);
		return dao.view(no);
	}
}
