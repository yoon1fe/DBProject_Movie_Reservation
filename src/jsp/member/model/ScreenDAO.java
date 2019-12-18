package jsp.member.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
<<<<<<< HEAD

=======
>>>>>>> 191703a1ef02afce3af220861fec42235d21e67e
import javax.naming.NamingException;

import jsp.util.DBConnection;


public class ScreenDAO {
<<<<<<< HEAD
	private static TheaterDAO instance;
	
	private int []sid= new int [100];
	private	int [] sno = new int [100];
	private int [] tid =new int[100];
	private String [] type = new String[100];
	private int[] total_number = new int [100];
	private ResultSet rs =null;
	
	private int Screen_count=0;
	public ScreenDAO() {
		
		
	}
	
	public void select_init_screen() throws SQLException {
		
		Connection conn = null;
	      Statement stmt = null;
	       int flag = 0;
	      try {
	         conn = DBConnection.getConnection();
	         
	         conn.setAutoCommit(false);
	         
	         //ì¿¼ë¦¬ ìƒì„±
	         String sql = new String();
	         sql="select * from screen";
	         
	         stmt = conn.createStatement();
	         
	            
	         rs=stmt.executeQuery(sql);
	         conn.commit();
	      }catch(ClassNotFoundException | NamingException | SQLException sqle) {
	          conn.rollback();
	          throw new RuntimeException(sqle.getMessage());
	         
	      }finally {
	    	 Screen_count=0;
	         while(rs.next()){
	                  flag = 1;
	                  sid[Screen_count] = rs.getInt(1);
	                  sno[Screen_count] = rs.getInt(2);
	                  tid[Screen_count] = rs.getInt(3);
	                  type[Screen_count]=rs.getString(4);   
	                  total_number[Screen_count]=rs.getInt(5);
	                  Screen_count++;
	         }

		
	      }
	}
	public int getSid(int theaterNumber) {
		return sid[theaterNumber];
	}
	public int getSno(int theaterNumber){
		return sno[theaterNumber];
	}
	public int getTid(int theaterNumber) {
		return tid[theaterNumber];
	}
	public String getType(int theaterNumber) {
		return type[theaterNumber];
	}
	public int getTotal_number(int theaterNumber) {
		return total_number[theaterNumber];
	}
	public int getScreenCount() {
		return Screen_count;
	}
}
=======
   private static TheaterDAO instance;
   
   private int []sid= new int [100];
   private   int [] sno = new int [100];
   private int [] tid =new int[100];
   private String [] type = new String[100];
   private int[] total_number = new int [100];
   private ResultSet rs =null;
   
   private int Screen_count=0;
   public ScreenDAO() {
      
      
   }
   
   public void select_init_screen() throws SQLException {
      
      Connection conn = null;
         Statement stmt = null;
          int flag = 0;
         try {
            conn = DBConnection.getConnection();
            
            conn.setAutoCommit(false);
            
            //Äõ¸® »ý¼º
            String sql = new String();
            sql="select * from screen";
            
            stmt = conn.createStatement();
            
               
            rs=stmt.executeQuery(sql);
            conn.commit();
         }catch(ClassNotFoundException | NamingException | SQLException sqle) {
             conn.rollback();
             throw new RuntimeException(sqle.getMessage());
            
         }finally {
           Screen_count=0;
            while(rs.next()){
                     flag = 1;
                     sid[Screen_count] = rs.getInt(1);
                     sno[Screen_count] = rs.getInt(2);
                     tid[Screen_count] = rs.getInt(3);
                     type[Screen_count]=rs.getString(4);   
                     total_number[Screen_count]=rs.getInt(5);
                     Screen_count++;
            }

      
         }
   }
   public int getSid(int theaterNumber) {
      return sid[theaterNumber];
   }
   public int getSno(int theaterNumber){
      return sno[theaterNumber];
   }
   public int getTid(int theaterNumber) {
      return tid[theaterNumber];
   }
   public String getType(int theaterNumber) {
      return type[theaterNumber];
   }
   public int getTotal_number(int theaterNumber) {
      return total_number[theaterNumber];
   }
   public int getScreenCount() {
      return Screen_count;
   }
}
>>>>>>> 191703a1ef02afce3af220861fec42235d21e67e
