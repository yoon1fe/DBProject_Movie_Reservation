package jsp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.NamingException;


public class DBConnection 
{
    public static Connection getConnection() throws SQLException, NamingException, 
    ClassNotFoundException{
            String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
            String user = "cdb";
            String pass = "cdb";
            
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
