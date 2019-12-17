package jsp.member.model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

import jsp.util.DBConnection;

public class TheaterDAO {
	private static TheaterDAO instance;
	
	private int []tid= new int [100];
	private String [] tname= new String [100];
	private String [] phoneNumber =new String[100];
	private String [] location = new String[100];
	private ResultSet rs =null;
	private int theater_count=0;
	
	public TheaterDAO(){
		
	}
	public void select_init_theater() throws SQLException {
		
		Connection conn = null;
	      Statement stmt = null;
	       int flag = 0;
	      try {
	         conn = DBConnection.getConnection();
	         
	         conn.setAutoCommit(false);
	         
	         //쿼리 생성
	         String sql = new String();
	         sql="select * from theater";
	         
	         stmt = conn.createStatement();
	         
	            
	         rs=stmt.executeQuery(sql);
	         conn.commit();
	      }catch(ClassNotFoundException | NamingException | SQLException sqle) {
	          conn.rollback();
	          throw new RuntimeException(sqle.getMessage());
	         
	      }finally {
	    	 theater_count=0;
	         while(rs.next()){
	                  flag = 1;
	                  tid[theater_count] = rs.getInt(1);
	                  tname[theater_count] = rs.getString(2);
	                  phoneNumber[theater_count] = rs.getString(3);
	                  location[theater_count]=rs.getString(4);   
	                  theater_count++;
	         }

		
	      }
	}
	public int getTid(int theaterNumber) {
		return tid[theaterNumber];
	}
	public String getTname(int theaterNumber){
		return tname[theaterNumber];
	}
	public String getPhoneNumber(int theaterNumber) {
		return phoneNumber[theaterNumber];
	}
	public String getLocation(int theaterNumber) {
		return location[theaterNumber];
	}
	public int getTheaterCount() {
		return theater_count;
	}
}
