<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Execution" %>
<%
//
String uri = request.getServletPath();
// 데이터 수집
Integer no = Integer.parseInt(request.getParameter("no"));
request.setAttribute("vo", Execution.execute(uri, no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h1>게시판 글보기</h1>
	<table class="table">
	<tr>
		<th>글 번호</th>
		<td>${vo.no }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${vo.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><pre>${vo.content }</pre></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.writer }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${vo.writeDate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${vo.hit }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="updateForm.jsp?no=${vo.no }" class="btn btn-default">수정</a>
			<a href="delete.jsp?no=${vo.no }" class="btn btn-default">삭제</a>
			<a href="list.jsp" class="btn btn-default">리스트</a>
		</td>
	</tr>
	</table>
</div>
</body>
</html>