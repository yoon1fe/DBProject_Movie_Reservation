package jsp.member.model;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

import jsp.util.DBConnection;
public class MovieDAO {
   private static MovieDAO instance;
   private int movieCount=0;
   
   
   private int [] mid = new int [100]  ;
   private String [] title = new String [100];
   private Blob [] poster = new Blob[100];
   private byte[][] imgData = new byte[20][10000000]; //10편만 넣자
   private String [] grade = new String [100];
   private int [] score = new int [100];
   private String []director = new String [100];
   private String []actor = new String [100];
   private int []run_time = new int [100];
   private int []moviegoers = new int [100];
   private String []genre = new String [100];
   private ResultSet rs =null;
    
   
   public MovieDAO() {
      
      
   }
   
   public static MovieDAO getInstance() {
      if(instance == null)
         instance = new MovieDAO();
      return instance;
   }
   public void select_init_movie() throws SQLException{
      Connection conn = null;
      Statement stmt = null;
       int flag = 0;
      try {
         conn = DBConnection.getConnection();
         
         conn.setAutoCommit(false);
         
         //쿼리 생성
         String sql = new String();
         sql="select * from movie";
         
         stmt = conn.createStatement();
         
            
         rs=stmt.executeQuery(sql);
           conn.commit();

         
      }catch(ClassNotFoundException | NamingException | SQLException sqle) {
         conn.rollback();
         
         throw new RuntimeException(sqle.getMessage());
      }finally {
         try {
            movieCount=0;
            while(rs.next()){
                  flag = 1;
                  mid[movieCount] = rs.getInt(1);
                  title[movieCount] = rs.getString(2);
                  poster[movieCount] = rs.getBlob(3);
                  imgData[movieCount]=poster[movieCount].getBytes(1, (int)poster[movieCount].length());
                  grade[movieCount] = rs.getString(4);
                  score[movieCount] = rs.getInt(5);
                  director[movieCount] = rs.getString(6);
                  actor[movieCount] = rs.getString(7);
                  run_time[movieCount] = rs.getInt(8);
                  moviegoers[movieCount] = rs.getInt(9);
                  genre[movieCount] = rs.getString(10);
                  movieCount++;
               }

         }catch(Exception e) {
            throw new RuntimeException(e.getMessage());
         }
      }
   }
   
   public int getMid(int movieNum) {
      return mid[movieNum];
   }

   public String getTitle(int movieNum) {
      return  title[movieNum];
   }

   public byte[] getPoster(int movieNum) {
      return imgData[movieNum];
   }

   public String getGrade(int movieNum) {
      return grade[movieNum];
   }

   public int getScore(int movieNum) {
      return score[movieNum];
   }

   public String getDirector(int movieNum) {
      return director[movieNum];
   }

   public String getActor(int movieNum) {
      return actor[movieNum];
   }

   public int getRun_time(int movieNum) {
      return run_time[movieNum];
   }

   public int getMovieGoers(int movieNum) {
      return moviegoers[movieNum];
   }
   public String getGenre(int movieNum) {
      return genre[movieNum];
   }
   

   
}