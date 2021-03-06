package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//mysql 접속 명령 코딩
	public UserDAO(){
		try{
			String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			   String dbID = "root";
			   String dbPassword = "2213ab";
			   Class.forName("com.mysql.cj.jdbc.Driver"); 
		    conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e){
			e.printStackTrace();
	//mysql 접속 명령 코딩문		
		}
	}
	//계정 로그인 함수 코드문
	public int login(String userID, String userPassword){
		String SQL ="SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs =pstmt.executeQuery();
			if (rs.next()){
				if(rs.getString(1).equals(userPassword)) 
					return 1;//로그인성공
				
				
				else 
					return 0;//비밀번호 불일치
		
			}
			return -1;//아이디없음
			}catch(Exception e) {
			e.printStackTrace();
		}
//		**자바자원 반납  **코딩 명령어 (스프링에서는 닫는태그를 하지않는다 =이유는 di로 알아서 해준다)
		finally{
			if (rs !=null ){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
				if (pstmt !=null){
					try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
					
		}
 //  위 상단 해당부분에대하여 나중에 공부할것 	
		
		return -2;//데이터베이스오류
	}
	
	//계정 로그인 함수 코드문 
	
	public int join(User user){
		String SQL="INSERT INTO USER VALUES(?,?,?,?,?)";
		try {
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			 return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;//-1 값은 데이터베이스오류 값 
	}
	
	
}
