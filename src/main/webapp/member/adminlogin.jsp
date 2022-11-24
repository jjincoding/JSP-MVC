<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.member.vo.LoginVO" %>
<%
String id = "admin";
String name = "관리자";
int gradeNo = 9;
String gradeName = "관리자";
LoginVO login = new LoginVO();
// 생성된 객체에 데이터 넣기
login.setId(id);
login.setName(name);
login.setGradeNo(gradeNo);
login.setGradeName(gradeName);
// 세션에 데이터를 담아두기 (이름을 login으로)
session.setAttribute("login", login);
response.sendRedirect("/mini/board/list.jsp");

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