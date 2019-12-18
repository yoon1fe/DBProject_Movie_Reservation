<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
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
<% 
String cid = (String)session.getAttribute("cid");
String password = (String)session.getAttribute("pw");
String cname = (String)session.getAttribute("cname");
String phone_number = (String)session.getAttribute("phone_number");
String city = (String)session.getAttribute("city");
String sex = (String)session.getAttribute("sex");
%>
   <%//book 정보 필요없음 예약할 때만 일단은 시트정보랑 AVail 사용
      request.setCharacterEncoding("UTF-8");
      String string_ScingID=request.getParameter("sngid");   
      int Scingid = Integer.parseInt(string_ScingID);
      String string_Seat_no=request.getParameter("seat_no");
      int Seat_no=Integer.parseInt(string_Seat_no);
      String insert_book="{call insert_book(?,?,?,?)}";
        String update_seatNum="{call update_seatNum(?)}";
        CallableStatement cstmt = null;
        Connection conn = null;
        
        conn = DBConnection.getConnection();            
       conn.setAutoCommit(false);
       
        String sql = new String();
        sql="select * from book";
        Statement stmt = conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        int Bid=0;
        while(rs.next()){
            
            Bid= rs.getInt(1);
            String Cid = rs.getString(2);
            int Sngid=rs.getInt(4);   
         }
        
        cstmt=conn.prepareCall(insert_book);
         cstmt.setInt(1,Bid+1);
         cstmt.setString(2,cid);
         cstmt.setInt(3,Seat_no);
         cstmt.setInt(4,Scingid);
         int result=cstmt.executeUpdate();
        conn.commit();
        cstmt=conn.prepareCall(update_seatNum);
        cstmt.setInt(1,Scingid);
        int result2=cstmt.executeUpdate();
        conn.commit();
        

        
        out.println("<script>");
      out.println("alert('예매되었습니다'); location.href='../../Main.jsp'");
      out.println("</script>");
      %>
</body>
</html>