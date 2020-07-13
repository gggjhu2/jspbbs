<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML/CSS 연습장입니다</title>
<link href="../practice.css" rel="stylesheet">
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");

		}
	%>
	<ul>
		<li><a href="main.jsp">JSP웹 게시판</a></li>

		<li><a href="main.jsp">메인</a></li>
		<li><a href="bbs.jsp">게시판</a></li>
		<li><a href="html_css_practice.jsp">CSS/HTML연습장</a></li>
	</ul>
	<%
		if (userID == null) {
	%>
	<div class="dropdown">
		<button class="dropbtn">회원관리</button>
			<div class="dropdown-content">
				<a href="login.jsp">로그인</a>
				<a href="join.jsp">회원가입</a>
	</div>
	</div>	
	
	
	<%
		} else {
	%>
	<div class="dropdown">
		<button class="dropbtn">Dropdown</button>
			<div class="dropdown-content"></div>	
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="logoutAction.jsp">로그아웃</a></li>
	</div>
	</div>		
	
	<%-- <ul class="nav navbar-nav navbar-right">
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expended="false"> 회원관리<span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul></li>
	</ul>
	<%
		}
	%>
	</div>
 


 --%>


</body>
</html>