package com.web.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.web.board.vo.BoardVO;
import com.web.util.db.DBInfo;

public class BoardDAO {
	
	public List<BoardVO> list() throws Exception {
		System.out.println("BoardDAO.list()");
		// 데이터를 담아서 넘겨줄 변수
		List<BoardVO> list = null;
		
		// 필요한 객체 선언 - SELECT
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "SELECT no, title, writer, writeDate, hit FROM board ORDER BY no DESC";
			System.out.println("BoardDAO.list().sql:" + sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					if (list == null)
						list = new ArrayList<BoardVO>();
					BoardVO vo = new BoardVO();
					vo.setNo(rs.getInt("no"));
					vo.setTitle(rs.getString("title"));
					vo.setWriter(rs.getString("writer"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setHit(rs.getInt("hit"));
					list.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("게시판 리스트 데이터를 불러오는 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt, rs);
		}
		System.out.println(list);
		return list;
	}
	
	public Integer write(BoardVO vo) throws Exception {
		System.out.println("BoardDAO.write().vo:" + vo);
		Integer result = null;
		
		// 필요한 객체 선언 - INSERT
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "INSERT INTO board (title, content, writer, pw) VALUES (?, ?, ?, ?)";
			System.out.println("BoardDAO.write().sql" + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPw());
			
			result = pstmt.executeUpdate();
			
			System.out.println("게시글 등록 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("게시글 등록 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt);
		}
		return result;
	}
}
