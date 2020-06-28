package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class bbsDAO {

	

	private Connection conn;
	private ResultSet rs;
	//mysql ���� ��� �ڵ�
	public bbsDAO(){
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
			return "";//�����ͺ��̽�����
		}
		
		public int getNext(){
			String SQL ="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
			try{
				 PreparedStatement pstmt=conn.prepareStatement(SQL);
				 rs=pstmt.executeQuery();
				 if (rs.next()){
					 return rs.getInt(1)+1; 
				 }
				 return 1;//ù��°�Խù��ΰ��
		}catch(Exception e){
			e.printStackTrace();
		}
			return -1;//�����ͺ��̽�����
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
			return -1;//�����ͺ��̽�����	
		}
		

}



