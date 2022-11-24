<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.main.exe.Beans" %>
<%@ page import="com.web.main.exe.Service" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String key = request.getServletPath();
System.out.println(key);
// Service service = Beans.getService(key);
// System.out.println(service);
// 데이터를 가져와서 request에 담기
// request.setAttribute("list", service.service(null));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
		location="view.jsp";
	});
})
</script>
</head>
<body>
<div class="conainer">
<h1>게시판 리스트</h1>
<table class="table">
	<tr>
		<th>공지번호</th>
		<th>제목</th>
		<th>공시시작일</th>
		<th>공지종료일</th>
	</tr>
	<tr class="dataRow">
		<td>1</td>
		<td>JSP</td>
		<td>2022.11</td>
		<td>2022.12</td>
	</tr>
	<c:if test="${login.gradeNo >= 9 }">
		<tr>
			<td colspan="5">
				<a href="writeForm.jsp" class="btn btn-default">공지 등록</a>
			</td>
		</tr>
	</c:if>
</table>
</div>
</body>
</html>