<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Beans" %>
<%@ page import="com.web.main.exe.Service" %>
<%@ page import="com.web.main.exe.Execution" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String key = request.getServletPath();
// 데이터를 가져와서 request에 담기
request.setAttribute("list", Execution.execute(key, null));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	.dataRow:hover {
		background: #eee;
		cursor: pointer;
	}
</style>

<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		location="view.jsp?no=" + no;
	});
});

</script>
</head>
<body>
<div class="conainer">
<h1>게시판 리스트</h1>
<table class="table">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list }" var="vo">
		<tr class="dataRow">
			<td class="no">${vo.no }</td>
			<td>${vo.title }</td>
			<td>${vo.writer }</td>
			<td>${vo.writeDate }</td>
			<td>${vo.hit }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<a href="writeForm.jsp" class="btn btn-default">글쓰기</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>