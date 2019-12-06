package jsp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.NamingException;


public class DBConnection 
{
    public static Connection getConnection() throws SQLException, NamingException, 
    ClassNotFoundException{
            //Context initCtx = new InitialContext();
            
            //initCtx의 lookup메서드를 이용해서 "java:comp/env" 에 해당하는 객체를 찾아서 evnCtx에 삽입
            //Context envCtx = (Context) initCtx.lookup("java:comp/env");
            
            //envCtx의 lookup메서드를 이용해서 "jdbc/oraknu"에 해당하는 객체를 찾아서 ds에 삽입
            //DataSource ds = (DataSource) envCtx.lookup("jdbc/oraknu");
            
            //getConnection메서드를 이용해서 커넥션 풀로 부터 커넥션 객체를 얻어내어 conn변수에 저장
            String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
            String user = "musong";
            String pass = "kdhong";
            
            Connection conn = null;
            
            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            }catch(ClassNotFoundException e) {
            	System.err.println("error = " + e.getMessage());
            	System.exit(1);
            }
            try {
            	conn = DriverManager.getConnection(url, user, pass);
           
            }catch(SQLException e) {
            	System.err.println("sql error = " + e.getMessage());
            	System.exit(1);
            }
    	
    	//Connection conn = ds.getConnection();
            return conn;
    }
}    
