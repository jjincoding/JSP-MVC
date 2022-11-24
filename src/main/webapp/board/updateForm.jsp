<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>
</head>
<body>
<h1>게시판 글수정</h1>
<form action="update.jsp" method="post">
<table>
	<tr>
		<th>글번호</th>
		<td><input name="no" value="10" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input name="title" value="JSP"></td>	
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" rows="5">MVC</textarea></td>	
	</tr>
	<tr>
		<th>작성자</th>
		<td><input name="writer" value="백"></td>
	<tr>
		<td colspan="2">
			<button>수정</button>
			<button type="reset">새로 작성</button>
			<button type="button">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>