package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.DriverManager;

public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/blog";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public Board getBoard(int Num) {
		String SQL = "SELECT * FROM board WHERE num = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,Num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setTxt(rs.getString(3));
				
				
				return board;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}


		public ArrayList<Board> getList(){
			
			String SQL = "SELECT * FROM board ";                        
			ArrayList<Board> list = new ArrayList<Board>();
			try {
				PreparedStatement pstmt=conn.prepareStatement(SQL);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Board Board = new Board();
					Board.setNum(rs.getInt(1));
					Board.setTitle(rs.getString(2));
					Board.setTxt(rs.getString(3));
					list.add(Board);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		public int write(int Num,String Title,String Txt) {
			String SQL = "INSERT INTO board VALUES(?,?,?)";
			try {
				PreparedStatement pstmt=conn.prepareStatement(SQL);
				pstmt.setInt(1, Num);
				pstmt.setString(2, Title);
				pstmt.setString(3,Txt);				
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
	
}

