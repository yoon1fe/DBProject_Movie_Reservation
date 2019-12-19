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
   <%//book 정보 필요없음 예약할 때만 일단은 시트정보랑 AVail 사용
      request.setCharacterEncoding("UTF-8");
      String string_bid=request.getParameter("bid");   
      int bid = Integer.parseInt(string_bid);
      String string_Seat_no=request.getParameter("seat_no");
      int Seat_no=Integer.parseInt(string_Seat_no);
      String string_ScingID=request.getParameter("sngid");   
      int Scingid = Integer.parseInt(string_ScingID);
      
      String delete_book="{call delete_book(?,?,?)}";
        String update_seatNum="{call update_seatNum(?)}";
        CallableStatement cstmt = null;
        Connection conn = null;
        
        conn = DBConnection.getConnection();            
       conn.setAutoCommit(false);
       
        String sql = new String();

        cstmt=conn.prepareCall(delete_book);
         cstmt.setInt(1,bid);
         cstmt.setInt(2,Seat_no);
         cstmt.setInt(3,Scingid);

         int result=cstmt.executeUpdate();
        conn.commit();
        cstmt=conn.prepareCall(update_seatNum);
        cstmt.setInt(1,Scingid);
        int result2=cstmt.executeUpdate();
        conn.commit();
        

        
        out.println("<script>");
      out.println("alert('삭제되었습니다'); location.href='../../Main.jsp'");
      out.println("</script>");
      %>
</body>
</html>