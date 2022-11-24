<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Beans" %>
<%@ page import="com.web.main.exe.Service" %>
<%@ page import="com.web.board.vo.BoardVO" %>
<%
// 데이터 받아서 VO에 저장
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
BoardVO vo = new BoardVO();
vo.setTitle(title);
vo.setContent(content);
vo.setWriter(writer);
System.out.println("write.jsp.vo:" + vo);

// DB에 글쓰기 처리
String key = request.getServletPath();
System.out.println(key);
Service service = Beans.getService(key);
service.service(null);
// 자동적으로 리스트로 이동
response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 쓰기</title>
</head>
<body>

</body>
</html>