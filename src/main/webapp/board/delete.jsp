<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Execution" %>
<%
System.out.println("delete.jsp");
String uri = request.getServletPath();

// 데이터 수집
Integer no = Integer.parseInt(request.getParameter("no"));
Execution.execute(uri, no);
// DB에 글쓰기 처리
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