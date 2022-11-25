package com.web.board.service;

import com.web.board.dao.BoardDAO;
import com.web.main.exe.Service;

public class BoardDeleteService implements Service {
	
	private BoardDAO dao;
	
	public BoardDeleteService(BoardDAO dao) {
		this.dao = dao;
	}
	
	// obj = no
	public Integer service(Object obj) throws Exception {
		Integer no = (Integer) obj;
		return dao.delete(no);
	}
}
