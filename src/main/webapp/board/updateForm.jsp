<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Execution" %>
<%
String uri = "/board/view.jsp";
Integer no = Integer.parseInt(request.getParameter("no"));
request.setAttribute("vo", Execution.execute(uri, no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정</title>
</head>
<body>
<div class="container">
	<h1>게시판 글 수정</h1>
	<form action="update.jsp" method="post" class="form-group">
	<table class="table">
		<tr>
			<th>글 번호</th>
			<td><input name="no" value="${vo.no }" readonly="readonly" class="form-control"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="title" value="${vo.title }" class="form-control"></td>	
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="5" class="form-control">${vo.content }</textarea></td>	
		</tr>
		<tr>
			<th>작성자</th>
			<td><input name="writer" value="${vo.writer }" class="form-control"></td>
		<tr>
		<tr>
			<th>비밀번호</th>
			<td><input name="pw" type="password" class="form-control"></td>
		<tr>
			<td colspan="2">
				<button>수정</button>
				<button type="reset">새로 작성</button>
				<button type="button">취소</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>