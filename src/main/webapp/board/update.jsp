<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.board.vo.BoardVO" %>
<%@ page import="com.web.main.exe.Execution" %>
<%
System.out.println("update.jsp");
Integer no = Integer.parseInt(request.getParameter("no"));
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String pw = request.getParameter("pw");
BoardVO vo = new BoardVO();
vo.setNo(no);
vo.setTitle(title);
vo.setContent(content);
vo.setWriter(writer);
vo.setPw(pw);
// DB에 글 수정 처리
String key = request.getServletPath();
Integer result = (Integer) Execution.execute(key, vo);
// result가 1이면 수정 성공
// result가 0이면 수정 실패 - 비밀번호나 번호가 틀림
// 자동적으로 글보기로 이동
if (result == 1)
	response.sendRedirect("view.jsp?no=" + no);
else
	response.sendRedirect("/error/info_error.jsp?no=" + no);
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