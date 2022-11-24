<!-- sitemesh 사용을 위한 설정 파일 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판<decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 400px;
	margin-top: 80px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
			
	});
</script>
<decorator:head/>
</head>
<body>
	<header>
	<!-- <div><img href="#"></div> -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="/mini/notice/list.jsp">공지사항</a></li>
						<li><a href="/mini/board/list.jsp">게시판</a></li>
					<c:if test="${!empty login }">
						<li><a href="/mini/message/list.jsp">메시지</a></li>
					</c:if>
					</ul>
				</div>
				<div class="collapse navbar-collapse">
					<c:if test="${empty login }">
						<!-- 로그인 하지 않은 경우의 메뉴 -->
						<a href="/mini/member/adminlogin.jsp" class="btn btn-default">관리자 로그인</a>
						<a href="/mini/member/login.jsp" class="btn btn-default">회원 로그인</a>
					</c:if>
					<c:if test="${!empty login }">
						<!-- 로그인 한 경우의 메뉴 -->
						<a href="/mini/member/logout.jsp" class="btn btn-default">로그아웃</a>
					</c:if>
				</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center navbar navbar-inverse navbar-fixed-bottom">
		<p>JSP 홈페이지</p>
	</footer>
</body>
</html>