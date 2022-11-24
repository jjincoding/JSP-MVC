package com.web.util.db;

import java.sql.*;

public class DBInfo {
	
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bigdata";
	private static final String ID = "java00";
	private static final String PW = "black";
	
	private static boolean checkDriver;
	
	// 드라이버 확인
	static {
		try {
			Class.forName(DRIVER);
			checkDriver = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("드라이버가 존재하지 않습니다");
		}
	}
	
	// connection을 넘겨 주는 메서드
	public static Connection getConnection() throws Exception {
		if (!checkDriver) throw new Exception("드라이버가 존재하지 않음");
		return DriverManager.getConnection(URL, ID, PW);
	}
	
	// INSERT, UPDATE, DELETE
	public static void close(Connection con, PreparedStatement pstmt) throws Exception {
		if (con != null) con.close();
		if (pstmt != null) pstmt.close();
	}
	
	// SELECT
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws Exception {
		close(con, pstmt);
		if (rs != null) rs.close();
	}
}