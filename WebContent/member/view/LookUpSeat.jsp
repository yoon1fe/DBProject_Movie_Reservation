<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jsp.member.model.*"%>
<%@ page import="jsp.util.DBConnection"%>
<%@ page import="javax.naming.NamingException"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%//book 정보 필요없음 예약할 때만 일단은 시트정보랑 AVail 사용
	request.setCharacterEncoding("UTF-8");
	String string_ScingID=request.getParameter("ScreeningName");	
	int Scingid = Integer.parseInt(string_ScingID);

	    int []Seat_no= new int [100];
	  	String []Sngid = new String[100];
	  	int []Type=new int[100];
	  	String []Avail=new String[100]; // y, n
	  	int Seat_count=0;
	  	ResultSet rs =null;
	  	Seat_count=0;
	  	Connection conn = null;
	  	Statement stmt = null;
	  	    int flag = 0;
	  	      try {
	  	         conn = DBConnection.getConnection();	         
	  	         conn.setAutoCommit(false);	         
	  	         //쿼리 생성
	  	         String sql = new String();
	  	         sql="select * from seat join screening on seat.Sngid=screening.Sngid ";	         
	  	         stmt = conn.createStatement();    
	  	         rs=stmt.executeQuery(sql);
	  	         conn.commit();
	  	      }catch(ClassNotFoundException | NamingException | SQLException sqle) {
	  	          conn.rollback();
	  	          throw new RuntimeException(sqle.getMessage());	         
	  	      }finally {
	  	         while(rs.next()){
	  	                  flag = 1;
	  	                  Seat_no[Seat_count] = rs.getInt(1);
	  	                  Sngid[Seat_count]  = rs.getString(2);
	  	                  Type[Seat_count]  = rs.getInt(3);
	  	                  Avail[Seat_count] =rs.getString(4);   
	  	                  Seat_count++;
	  	         }
	  	      }


	  	 ScreeningDAO scing = new ScreeningDAO();
	  	 scing.select_init_screening();

	  	 ScreenDAO sc = new ScreenDAO();
	  	 sc.select_init_screen();
	  	 int cur_scning=0;
	  	 for (cur_scning=0;cur_scning<scing.getScreening_count();cur_scning++){
	  		if(Scingid==scing.getSngid(cur_scning))break;
	  	 }
	  	 
	  	 scing.getSid(cur_scning);
	  	 
	  	 
	  	      
	  	      
	    %>
</body>
</html>