package jsp.member.model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

import jsp.util.DBConnection;

public class BookDAO {
	private static TheaterDAO instance;
	
	private int []Bid= new int [100];
	private String [] Cid= new String [100];
	private int[] Seat_no =new int[100];
	private int[] Sngid = new int[100];
	private ResultSet rs =null;
	private int Book_count=0;
	
	public BookDAO(){
		
	}
	public void select_init_book() throws SQLException {
		
		Connection conn = null;
	      Statement stmt = null;
	       int flag = 0;
	      try {
	         conn = DBConnection.getConnection();
	         
	         conn.setAutoCommit(false);
	         
	         //쿼리 생성
	         String sql = new String();
	         sql="select * from book";
	         
	         stmt = conn.createStatement();
	         
	            
	         rs=stmt.executeQuery(sql);
	         conn.commit();
	      }catch(ClassNotFoundException | NamingException | SQLException sqle) {
	          conn.rollback();
	          throw new RuntimeException(sqle.getMessage());
	         
	      }finally {
	    	 Book_count=0;
	         while(rs.next()){
	                  flag = 1;
	                  Bid[Book_count] = rs.getInt(1);
	                  Cid[Book_count] = rs.getString(2);
	                  Seat_no[Book_count] = rs.getInt(3);
	                  Sngid[Book_count]=rs.getInt(4);   
	                  Book_count++;
	         }
	      }
	}
	public int getBid(int theaterNumber) {
		return Bid[theaterNumber];
	}
	public String getCid(int theaterNumber){
		return Cid[theaterNumber];
	}
	public int getSeat_no(int theaterNumber) {
		return Seat_no[theaterNumber];
	}
	public int getSngid(int theaterNumber) {
		return Sngid[theaterNumber];
	}
	public int getBook_count() {
		return Book_count;
	}
}
