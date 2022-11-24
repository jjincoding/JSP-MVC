package com.web.board.service;

import com.web.board.dao.BoardDAO;
import com.web.board.vo.BoardVO;
import com.web.main.exe.Service;

public class BoardWriteService implements Service {
	
	private BoardDAO dao;
	
	public BoardWriteService(BoardDAO dao) {
		this.dao = dao;
	}
	
	public Integer service(Object obj) throws Exception {
		System.out.println("BoardWriteService.service()");
		return dao.write((BoardVO) obj);
	}
}
