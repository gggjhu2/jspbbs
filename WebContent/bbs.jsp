<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content ="width=device-width, initial-scale=1">
<link href="./css/practice_css.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">  
<link href="./css/custom.css" rel="stylesheet"> 


<title>게시판 웹 사이트</title>
<style type="text/css">
 a, a:hover{
 color:#000000;
 text-decoration : none;
 }
</style> 
</head>
<body>
 	<%
 	  String  userID =null;
 	 if (session.getAttribute("userID") !=null){
 		 userID =(String) session.getAttribute("userID");
 		 
 	 }
 	 int pageNumber = 1;
 	 if (request.getParameter("pageNumber") != null){
 		 pageNumber =Integer.parseInt(request.getParameter("pageNumber"));
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
               <li ><a href="main.jsp">메인</a></li>
              <li class="active"><a href="bbs.jsp">게시판</a></li>
                  <li><a href="html_css_practice.jsp">CSS/HTML연습장</a></li>
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
       <div class="container">
        <div class="row">
          <table class="table table-striped" style="text-align:center; border: 9px solid #050505">
           <thead>
            <tr>
              <th style="background-color:#eeeeee; text-align:center;">번호</th>
              <th style="background-color:#eeeeee; text-align:center;">제목</th>
              <th style="background-color:#eeeeee; text-align:center;">작성자</th>
              <th style="background-color:#eeeeee; text-align:center;">작성일</th>
            </tr>
           </thead>
            <tbody>
              <tr>
            <%
              BbsDAO bbsDAO = new BbsDAO();
              ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
              for(int i = 0; i <list.size(); i++) {
            %>
            <tr>
              <td><%= list.get(i).getBbsID() %></td>
            <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
              <td><%= list.get(i).getUserID() %></td>
              <td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13) +"시"+ list.get(i).getBbsDate().substring(14,16)+"분" %></td>
            </tr>
            <%
              }
              %>
            </tbody>
            </table>
           <% 
            
            if (pageNumber != 1){
            %>
           <a href ="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-Left">이전</a>
            <%
              	}if(bbsDAO.nextPage(pageNumber + 1)) {
             %>
                 <a href ="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-Left">다음</a>
             <% 		
              	}
            %>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
       		</div>
       	</div>	
       	
       
          
      
       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

            
</body>
</html>