	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html >
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 웹 사이트</title>
</head>
<body>
	
	
	<%
	String userID =null;
	  if (session.getAttribute("userID") !=null){
		  userID = (String) session.getAttribute("userID");
	  }
	  if (userID ==null){
		  PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('로그인을 하세요.');");
	    	script.println("location.href ='login.jsp'");
	    	script.println("</script>");
	  }
	  int bbsID = 0;
	 	 if (request.getParameter("bbsID") !=null){
	 		// 리퀘스트 겟파라미터  관련 호출 해당문제 스터디
	 		 bbsID= Integer.parseInt(request.getParameter("bbsID"));
	 		
	 	}
	 	 
	 	 if (bbsID == 0 ){
	 		 
	 		  PrintWriter script = response.getWriter();
		    	script.println("<script>");
		    	script.println("alert('유효하지않은글입니다.');");
		    	script.println("location.href ='bbs.jsp'");
		    	script.println("</script>");
	 	 }
	 	 Bbs bbs = new BbsDAO().getBbs(bbsID);
	 	  if (!userID.equals(bbs.getUserID())){
	 		 PrintWriter script = response.getWriter();
		    	script.println("<script>");
		    	script.println("alert('권한이없습니다.');");
		    	script.println("location.href ='bbs.jsp'");
		    	script.println("</script>");
	 	  }
	  
	  else{
		  
		if (request.getParameter("bbsTitle") == null ||request.getParameter("bbsContent") == null
			|| request.getParameter("bbsTitle").equals("") ||request.getParameter("bbsContent").equals(""))
		{
			PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('입력이 안된 사항이 있씁니다.');");
	    	script.println("histroy.back()");
	    	script.println("</script>");
		}else{
			 BbsDAO bbsDAO = new BbsDAO();
			   int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"),request.getParameter("bbsContent")); 
			    if (result ==-1){
			    	PrintWriter script = response.getWriter();
			    	script.println("<script>");
			    	script.println("alert('글 수정에 실패했습니다.');");
			    	script.println("histroy.back()");
			    	script.println("</script>");
			    } 
			    else {
			      		PrintWriter script = response.getWriter();
				    	script.println("<script>");
				    	script.println("location.href='bbs.jsp'");
				    	script.println("</script>");
			    }
		}
	  
		  
	  }
	    
		    	
		    	
		    	%>




</body>
</html>