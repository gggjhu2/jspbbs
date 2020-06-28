<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content ="width=device-width, initial-scale=1">
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
          </button>
           <a class="navbar-brand" href="main.jsp">
           JSP게시판 웹 사이트</a>
       </div>
         <div class="callapse navbar-collapse" id="bs-examle-navbar-callapse-1">
           <ul class="nav navbar-nav">
               <li class="active"><a href="main.jsp">메인</a></li>
               <li><a href="bbs.jsp">게시판</a></li>
             </ul>
             <%
              if (userID==null){
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
     
          
      
       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

            
</body>
</html>