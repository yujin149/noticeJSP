package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn; 
	private ResultSet rs; 

	public BbsDAO()
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/testjsp"; 
			
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver"); 
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e)
		{
			e.printStackTrace(); 
		}
	}
	
	// 게시판 글쓰기를 위한 함수
	public String getDate()
	{
		String SQL = "SELECT NOW()"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ""; 
	}
	
	public int getNext() // 게시글 번호 입력 함수
	{
		String SQL = "SELECT bbsNum FROM BBS ORDER BY bbsNum DESC"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			} 
			return 1; 
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) 
	{
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)"; 

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); 
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); 
			
			return pstmt.executeUpdate(); 
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Bbs> getList(int pageNumber) 
	{
		String SQL = "SELECT * FROM BBS WHERE bbsNum < ?  AND bbsAvailable = 1 ORDER BY bbsNum DESC LIMIT 10"; 
		
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				Bbs bbs = new Bbs();
				bbs.setBbsNum(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
			    list.add(bbs);
			} 		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) 
	{
		String SQL = "SELECT * FROM BBS WHERE bbsNum < ?  AND bbsAvailable = 1 ORDER BY bbsNUm DESC LIMIT 10";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			} 		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Bbs getBbs(int bbsNum) { 
		String SQL = "SELECT * FROM BBS WHERE bbsNum = ?"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setInt(1, bbsNum);
	        rs = pstmt.executeQuery();
			
			if(rs.next()) {
	            Bbs bbs = new Bbs();
	            bbs.setBbsNum(rs.getInt(1));
	            bbs.setBbsTitle(rs.getString(2));
	            bbs.setUserID(rs.getString(3));
	            bbs.setBbsDate(rs.getString(4));
	            bbs.setBbsContent(rs.getString(5));
	            bbs.setBbsAvailable(rs.getInt(6));
	            return bbs;
	        }
		} catch(Exception e) {
	        e.printStackTrace();
	    }
		return null; 
	}
	
	public int update(int bbsNum, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent =? WHERE bbsNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsNum);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int delete(int bbsNum) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsNum);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}


	public ArrayList<Bbs> getSearch(String searchField, String searchText) {
	    String SQL = "";
	    ArrayList<Bbs> list = new ArrayList<Bbs>();
	    
	    try {
	        if(searchField.equals("bbsTitle")) {
	            SQL = "SELECT * FROM BBS WHERE bbsTitle LIKE ? AND bbsAvailable = 1 ORDER BY bbsNum DESC";
	        } else if(searchField.equals("userID")) {
	            SQL = "SELECT * FROM BBS WHERE userID LIKE ? AND bbsAvailable = 1 ORDER BY bbsNum DESC";
	        }
	        
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, "%" + searchText + "%");
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Bbs bbs = new Bbs();
	            bbs.setBbsNum(rs.getInt(1));
	            bbs.setBbsTitle(rs.getString(2));
	            bbs.setUserID(rs.getString(3));
	            bbs.setBbsDate(rs.getString(4));
	            bbs.setBbsContent(rs.getString(5));
	            bbs.setBbsAvailable(rs.getInt(6));
	            list.add(bbs);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
