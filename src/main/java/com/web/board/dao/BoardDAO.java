package com.web.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.web.board.vo.BoardVO;
import com.web.util.db.DBInfo;

import net.webjjang.util.PageObject;

public class BoardDAO {
	
	public List<BoardVO> list(PageObject pageObject) throws Exception {
		System.out.println("BoardDAO.list()");
		// 데이터를 담아서 넘겨줄 변수
		List<BoardVO> list = null;
		
		// 필요한 객체 선언 - SELECT
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "SELECT no, title, writer, writeDate, hit FROM board ORDER BY no DESC limit ?, ?";
			System.out.println("BoardDAO.list().sql:" + sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (pageObject.getPage() -1) * pageObject.getPerPageNum());
			pstmt.setInt(2, pageObject.getPerPageNum());
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
			throw new Exception ("게시판 리스트 데이터를 불러오는 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt, rs);
		}
		System.out.println(list);
		return list;
	}

	public Integer getCount() throws Exception {
		System.out.println("BoardDAO.getCount()");
		Integer result = null;
		
		// 필요한 객체 선언 - SELECT
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "SELECT count(*) FROM board";
			System.out.println("BoardDAO.list().sql:" + sql);
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs != null) {
				if (rs.next()) {
					result = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception ("게시판 리스트 전체 데이터의 개수를 불러오는 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt, rs);
		}
		System.out.println(result);
		return result;
	}

	public BoardVO view(Integer no) throws Exception {
		System.out.println("BoardDAO.view().no:" + no);
		BoardVO vo = null;
		
		// 필요한 객체 선언 - SELECT
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "SELECT no, title, content, writer, writeDate, hit FROM board WHERE no = ?";
			System.out.println("BoardDAO.view().sql:" + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if (rs != null) {
				if (rs.next()) {
					vo = new BoardVO();
					vo.setNo(rs.getInt("no"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setWriter(rs.getString("writer"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setHit(rs.getInt("hit"));
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception ("게시판 글보기 데이터를 불러오는 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt, rs);
	}
		return vo;
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
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getPw());
			
			result = pstmt.executeUpdate();
			
			System.out.println("게시글 등록 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception ("게시글 등록 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt);
		}
		return result;
	}
	
	public Integer increase(Integer no) throws Exception {
		System.out.println("BoardDAO.increase().no:" + no);
		Integer result = null;
		
		// 필요한 객체 선언 - UPDATE
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "UPDATE board SET hit = hit + 1 WHERE no = ?";
			System.out.println("BoardDAO.increase().sql:" + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			System.out.println("게시판 조회수 1 증가 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception ("게시판 조회수 1 증가 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt);
		}
		return result;
	}
	
	public Integer update(BoardVO vo) throws Exception {
		System.out.println("BoardDAO.update().vo:" + vo);
		Integer result = null;
		
		// 필요한 객체 선언 - UPDATE
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "UPDATE board SET title = ?, content = ?, writer = ? WHERE no = ? AND pw = ? ";
			System.out.println("BoardDAO.update().sql:" + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setInt(4, vo.getNo());
			pstmt.setString(5, vo.getPw());
			
			result = pstmt.executeUpdate();
			System.out.println("게시판 글 수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception ("게시판 글 수정 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt);
		}
		return result;
	}
	
	public Integer delete(Integer no) throws Exception {
		System.out.println("BoardDAO.delete().no:" + no);
		Integer result = null;
		
		// 필요한 객체 선언 - DELETE
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBInfo.getConnection();
			String sql = "DELETE FROM board WHERE no = ?";
			System.out.println("BoardDAO.delete().sql:" + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			System.out.println("게시판 글 삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception ("게시판 글 삭제 중 오류 발생");
		} finally {
			DBInfo.close(con, pstmt);
		}
		return result;
	}
}