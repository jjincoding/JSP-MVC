<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setAttribute("today", new Date()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<div class="container">
<h1>공지사항 등록</h1>
<form action="write.jsp" method="post">
<table class="table">
	<tr>
		<th>제목</th>
		<td><input name="title"></td>	
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" rows="5"></textarea></td>	
	</tr>
	<tr>
		<th>공지 시작일</th>
		<td><input name="startDate" value='<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />'></td>
	</tr>
	<tr>
		<th>공지 종료일</th>
		<td><input name="endDate" value="${'2022.12.01' }"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button>등록</button>
			<button type="reset">새로 작성</button>
			<button type="button">취소</button>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>