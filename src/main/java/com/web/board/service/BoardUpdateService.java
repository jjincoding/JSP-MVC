package com.web.board.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.exe.Service;

public class BoardUpdateService implements Service {
	
	private BoardDAO dao;
	
	public BoardUpdateService(BoardDAO dao) {
		this.dao = dao;
	}
	
	public Integer service(Object obj) throws Exception {
		return dao.update((BoardVO) obj);
	}
}
