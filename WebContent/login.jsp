<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html contextmenu="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content ="width=device-width, initial-scale=1">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">

<title>게시판 웹 사이트</title>
</head>
<body>
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
               <li><a href="main.jsp">메인</a></li>
               <li><a href="bbs.jsp">게시판</a></li>
               <li><a href="html_css_practice.jsp">CSS/HTML연습장</a></li>
             </ul>
             <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                 <a href="#" class="dropdown-toggle"
                 data-toggle="dropdown" role="button"
                 aria-haspopup="true" aria-expended="false">
                 접속하기<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                  <li class="activ"><a href="loginAction.jsp">로그인</a></li>
                  <li><a href="join.jsp">회원가입</a></li>
                 </ul>
              </li>
              </ul>
         </div>
      </nav>
      <div class="container"> 
       <div class="col-lg-4"></div>
       <div class="col-lg-4">
          <div class="jumbotron" style="padding-top:20px;">
          <form method="post" action="loginAction.jsp">
             <h3 style="text-align: center;">로그인 화면</h3>
             <div class="form-group">
               <input type="text" class="form-control" placeholder="아이디"
               name="userID" maxlength="20">
             </div> 
             <div class="form-group">
               <input type="password" class="form-control" placeholder="비밀번호"
               name="userPassword" maxlength="20">
             </div> 
                <input type="submit" class="btn btn-primary form-controle" value="로그인">
          </form>
       </div>
       </div>
          <div class="col-lg-4"></div>
          </div>
          
      
       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

            
</body>
</html>