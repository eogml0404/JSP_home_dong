package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//데이터 접근객체
public class BbsDAO {
	private Connection conn; //데이터베이스에 접근 할수있게 하는 객체
	
	private ResultSet rs; //정보를 담을수 있는 객체

	public BbsDAO() {
		try {
			
			//본인 로컬호스트에 접속
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "0000";
			//접속 할 수있도록 하는 매개체 역할
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		}catch(Exception e) {
			//오류가 뭔지 출력 하는 메소드
			e.printStackTrace();
		}
	}
	
	//현재시간 가져옴
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
		
			//나오는 결과
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return ""; //데이터 오류
	}
	

	//다음 글번호
	public int getNext() {
		//마지막의 글
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return -1; //데이터 오류
	}
	
	//게시글 작성 (데이터 삽입)
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ? )";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,bbsTitle);
			pstmt.setString(3,userID);
			pstmt.setString(4,getDate());
			pstmt.setString(5,bbsContent);
			pstmt.setInt(6,1);
			
			//insert는 executeUpdate를 사용
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return -1; //데이터 오류
	}
		
	
	public ArrayList<Bbs> getList(int pageNumber){
		//삭제가 x available = 1
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			// ? 에 들어갈 내용
			// 다음글 - (페이지갯수-1) * 10
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				list.add(bbs);
				
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
	
	//페이징 처리때문에 존재
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
		
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			
			//결과가 존재하면 true 다음으로 넘어갈 수있음
			if(rs.next()) {
				
				return true;
				
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return false;
	}	
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
		
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			//글이 존재하면
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
					
				return bbs;
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return null;		
		
		
	}
	
}
