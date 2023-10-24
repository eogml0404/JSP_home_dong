package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


//데이터베이스를 접근해서 데이터를 넣거나 가져오는 데이터 접근 클래스
public class UserDAO {

	private Connection conn; //데이터베이스에 접근 할수있게 하는 객체
	
	private PreparedStatement pstmt; //높은 효율성으로 반복문을 실행 할 수있게 하는 객체
	
	private ResultSet rs; //정보를 담을수 있는 객체

	public UserDAO() {
		try {
			
			//본인 로컬호스트에 접속
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "0000";
			//접속 할 수있도록 하는 매개체 역할
			Class.forName("com.mysql.jdbc.Driver");
			
			//conn객체안에 정보가 담긴다.
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		}catch(Exception e) {
			//오류가 뭔지 출력 하는 메소드
			e.printStackTrace();
		}
	}
		public int login(String userID,String userPassword) {
			
			//명령어 문장
			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			try {
				//해킹막기위해
				pstmt = conn.prepareStatement(SQL);
				
				//?에 해당하는내용을 넣어준다.
				pstmt.setString(1,userID);
				
				//결과 값
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
				
					//결과값이 패스워드와 같다면
					if(rs.getString(1).equals(userPassword)) {
						
						return 1; // 로그인 성공
					}
					else 
						return 0; //비밀번호 불일치
				}
				
				return -1; //아이디가 없음
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return -2; //데이터베이스 오류
			
		}
	
		public int join(User user) {
			String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		
		
		try {
			//pstmt에 인스턴스값 넣기
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			//실행한 결과를 넣을 수 있게한다.
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	
		return -1; //데이터베이스 오류
	}
}
