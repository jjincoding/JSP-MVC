<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Beans" %>
<%@ page import="com.web.main.exe.Service" %>
<%@ page import="com.web.main.exe.Execution" %>
<%@ page import="com.web.board.vo.BoardVO" %>
<%
// 데이터 받아서 VO에 저장
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String pw = request.getParameter("pw");
BoardVO vo = new BoardVO();
vo.setTitle(title);
vo.setContent(content);
vo.setWriter(writer);
vo.setPw(pw);

// DB에 글쓰기 처리
String key = request.getServletPath();
// 실행객체를 이용한 실행
Execution.execute(key, vo);
// 자동적으로 리스트로 이동
response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>