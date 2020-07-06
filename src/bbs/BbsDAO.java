package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	// 티님 보이시나요~~ t:yes
	private Connection conn;
	private ResultSet rs;
	//mysql 접속 명령 코딩
	public BbsDAO(){
		try{
			String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			   String dbID = "root";
			   String dbPassword = "2213ab";
			   Class.forName("com.mysql.cj.jdbc.Driver"); 
		    conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e){
			e.printStackTrace();
}
	}
	//날짜 데이타베이스 호출
		public String getDate(){
			String SQL ="SELECT NOW()";
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 rs=pstmt.executeQuery();
				 if (rs.next()){
					 return rs.getString(1); 
				 }
		}catch(Exception e){
			e.printStackTrace();
		}
			return "";//데이터베이스오류
		}
		
		
		public int getNext(){
			//내림차순 글 호출
			String SQL ="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
			
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 rs=pstmt.executeQuery();
				 if (rs.next()){
					 return rs.getInt(1)+1; 
				 }
				 return 1;//첫번째게시물인경우
		}catch(Exception e){
			e.printStackTrace();
		}
			return -1;//데이터베이스오류
		}

		public int write(String bbsTitle, String userID, String bbsContent){
			String SQL ="INSERT INTO BBS VALUES(?,?,?,?,?,?)";
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 pstmt.setInt(1, getNext());
				 pstmt.setString(2, bbsTitle);
				 pstmt.setString(3, userID);
				 pstmt.setString(4, getDate());
				 pstmt.setString(5, bbsContent);
				 pstmt.setInt(6, 1);
				 return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
			return -1;//데이터베이스오류	
		}
		
		public ArrayList<Bbs> getList(int pageNumber){
			String SQL ="SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable =1 ORDER BY bbsID DESC LIMIT 10";
			ArrayList<Bbs> list =new ArrayList<Bbs>();
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 pstmt.setInt(1, getNext()-(pageNumber -1) *10);
				 rs=pstmt.executeQuery();
				 while (rs.next()){
					 Bbs bbs=new Bbs();
					 bbs.setBbsID(rs.getInt(1));
					 bbs.setBbsTitle(rs.getString(2));
					 bbs.setUserID(rs.getString(3));
					 bbs.setBbsDate(rs.getString(4));
					 bbs.setBbsContent(rs.getString(5));
					 bbs.setBbsAvailable(rs.getInt(6));
					 list.add(bbs);
				 }
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;//데이터베이스오류
		}
//		페이징처리 코드
		public boolean nextPage(int pageNumber) {
			String SQL ="SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable =1 ORDER BY bbsID DESC LIMIT 10";
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 pstmt.setInt(1,getNext() - (pageNumber -1) *10);
				 rs=pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
			return false;//데이터베이스오류
		}
		
//		작성글 호출 명령코드
		public Bbs getBbs(int bbsID) {
			String SQL ="SELECT * FROM BBS WHERE bbsID =?";
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 pstmt.setInt(1,bbsID);
				 rs=pstmt.executeQuery();
			if(rs.next()){ 	
				 Bbs bbs =new Bbs();
				 bbs.setBbsID(rs.getInt(1));
				 bbs.setBbsTitle(rs.getString(2));
				 bbs.setUserID(rs.getString(3));
				 bbs.setBbsDate(rs.getString(4));
				 bbs.setBbsContent(rs.getString(5));
				 bbs.setBbsAvailable(rs.getInt(6));
				 return bbs;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
			return null;
		}
		public int update(int bbsID,String bbsTitle,String bbsContent){
			
			String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ? ";
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 pstmt.setString(1, bbsTitle);
				 pstmt.setString(2, bbsContent);
				 pstmt.setInt(3, bbsID);
				 return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
			return -1;//데이터베이스오류	
		}
}





