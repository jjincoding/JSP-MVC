<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Beans" %>
<%@ page import="com.web.main.exe.Service" %>
<%@ page import="com.web.main.exe.Execution" %>
<%@ page import="net.webjjang.util.PageObject " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<%
// 페이지 객체 생성
PageObject pageObject = new PageObject();
// 넘어오는 페이지와 한 페이지에 표시할 데이터 받기
String pageStr = request.getParameter("page");
String perPageNumStr = request.getParameter("perPageNum");
// 페이지와 한 페이지에 표시할 데이터가 넘어온 경우 바꾸기
if (pageStr != null) pageObject.setPage(Integer.parseInt(pageStr));
if (perPageNumStr != null) pageObject.setPerPageNum(Integer.parseInt(perPageNumStr));
String key = request.getServletPath();
// 데이터를 가져와서 request에 담기
request.setAttribute("list", Execution.execute(key, pageObject));
// 페이지 처리를 위해서 pageObject를 request에 담아놓기
request.setAttribute("pageObject", pageObject);
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
<div class="container">
<h1>게시판 리스트</h1>
<table class="table">
	<tr>
		<th>글 번호</th>
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
	<c:if test="${pageObject.totalRow > pageObject.perPageNum }">
	<tr>
		<td>
			<pageNav:pageNav endPage="${pageObject.endPage }" totalPage="${pageObject.totalPage }" startPage="${pageObject.startPage }" page="${pageObject.page }"></pageNav:pageNav>
		</td>
	</tr>
	</c:if>
	<tr>
		<td colspan="5">
			<a href="writeForm.jsp" class="btn btn-default">글쓰기</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>