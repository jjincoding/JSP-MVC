<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>
<div class="container">
<h1>게시판 글쓰기</h1>
<form action="write.jsp" method="post" class="form-group">
<table class="table">
	<tr>
		<th>제목</th>
		<td><input name="title" class="form-control"></td>	
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" rows="5" class="form-control"></textarea></td>	
	</tr>
	<tr>
		<th>작성자</th>
		<td><input name="writer" class="form-control"></td>	
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input name="pw" class="form-control"></td>
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