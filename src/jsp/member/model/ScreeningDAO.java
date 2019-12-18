package jsp.member.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

import jsp.util.DBConnection;
   
public class ScreeningDAO {
   private int []Sngid= new int [100];
   private int [] Mid= new int [100];
   private int [] Sid =new int[100];
   private int [] Time= new int[100];
   private int [] Sold_seat=new int [100];
   private ResultSet rs =null;
   private int Screening_count=0;
   
   public ScreeningDAO(){
      
   }
   public void select_init_screening() throws SQLException {
      
      Connection conn = null;
         Statement stmt = null;
          int flag = 0;
         try {
            conn = DBConnection.getConnection();
            
            conn.setAutoCommit(false);
            
            //쿼리 생성
            String sql = new String();
            sql="select * from screening";
            
            stmt = conn.createStatement();
            
               
            rs=stmt.executeQuery(sql);
            conn.commit();
         }catch(ClassNotFoundException | NamingException | SQLException sqle) {
             conn.rollback();
             throw new RuntimeException(sqle.getMessage());
            
         }finally {
           Screening_count=0;
            while(rs.next()){
                     flag = 1;
                     Sngid[Screening_count] = rs.getInt(1);
                     Mid[Screening_count] = rs.getInt(2);
                     Sid[Screening_count] = rs.getInt(3);
                     //Time[Screening_count]=rs.getInt(4);   
                     Sold_seat[Screening_count]=rs.getInt(5);
                     Screening_count++;
            }
         }      
   }
   public int getSngid(int theaterNumber) {
      return Sngid[theaterNumber];
   }
   public int getMid(int theaterNumber){
      return Mid[theaterNumber];
   }
   public int getSid(int theaterNumber) {
      return Sid[theaterNumber];
   }
   //public int getTime(int theaterNumber) {
  //    return Time[theaterNumber];
  // }
   public int getSold_seat(int theaterNumber) {
      return Sold_seat[theaterNumber];
   }
   public int getScreening_count() {
      return Screening_count;
   }
   
}