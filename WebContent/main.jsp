<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<link href="./css/practice_css.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">

<title>게시판 웹 사이트</title>
</head>
<body>
 	<%
 	  String  userID =null;
 	 if (session.getAttribute("userID") !=null){
 		 userID =(String) session.getAttribute("userID");
 		 
 	 }
 	%>
      <nav class="navbar navbar-default">
       <div class="navbar-header">
         <button type="button" class="navbar-toggle callapsed"
          data-toggle="callpse" data-target="#bs-example-navbar-callapse-1"
          aria-expended="false">
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
          </button>
           <a class="navbar-brand" href="main.jsp">
           JSP게시판 웹 사이트</a>
       </div>
         <div class="callapse navbar-collapse" id="bs-examle-navbar-callapse-1">
           <ul class="nav navbar-nav">
               <li class="active"><a href="main.jsp">메인</a></li>
               <li><a href="bbs.jsp">게시판</a></li>
               <li><a href="html_css_practice.jsp">CSS/HTML연습장</a></li>
             </ul>
             <%
              if (userID == null){
            	%>  
              <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                 <a href="#" class="dropdown-toggle"
                 data-toggle="dropdown" role="button"
                 aria-haspopup="true" aria-expended="false">
                 	접속하기<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                  <li ><a href="login.jsp">로그인</a></li>
                  <li><a href="join.jsp">회원가입</a></li>
                 </ul>
                </li>
              </ul>
              <%
              } else{ 
            	  %>
            	    <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                 <a href="#" class="dropdown-toggle"
                 data-toggle="dropdown" role="button"
                 aria-haspopup="true" aria-expended="false">
                 	회원관리<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                  <li ><a href="logoutAction.jsp">로그아웃</a></li>
                 </ul>
                </li>
              </ul>
            	  <%
              }
             %>
            
         </div>
      </nav>
      <div class="container">
       <div class ="jumbotron">
         <div class="container">
           <h1 style="text-align:center"> 웹 사이트 소개</h1>
           <p>이웹 싸이트는 부트스트랩과 최소한의 로직만을이용하여 개발하였습니다.
             mysql 사용 하여 데이터베이스 연동하여 회원가입 로그인 글수정 삭제 게시판 글쓰기든을 구현하였습니다.
             
             <br></p>
             <p style="text-align:center"><a class="btn btn-primary btn-pull" href="#" role="button" >자세히알아보기</a></p>
             
       		
         </div>
       </div>
      </div>
      <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
        	 
       		<div class="carousel-inner">
       		  <div class="item active">
       		    <img style="width:500px">
       		    <img src="images/1.jpg">
       		 </div>
       		 <div class="item" >
       		    <img style="width:500px">
       		    <img src="images/2.gif">
       		 </div>
       		 <div class="item">
       		    <img style="width:500px">
       		    <img src="images/3.png">
       		 </div>
       		 <div class="item">
       		    <img style="width:500px">
       		    <img src="images/4.jpg">
       		 </div>
       		</div>
       		<a class ="left carousel-control" href="#myCarousel" data-slide="prev">
       		   <span class ="glyphcglyphicon-chevron-left"></span>
       		</a> 
       		<a class ="right carousel-control" href="#myCarousel" data-slide="next">
       		   <span class ="glyphicon-chevron-right"></span>
       		</a> 
	     
        </div>
      </div>
          
      
       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

            
</body>
</html>