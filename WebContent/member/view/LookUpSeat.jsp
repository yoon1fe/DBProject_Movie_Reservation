<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jsp.member.model.*"%>
<%@ page import="jsp.util.DBConnection"%>
<%@ page import="javax.naming.NamingException"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CDB :: 좌석 서택</title>
<link rel="stylesheet" href="../../css/bootstrap.css">
      <style type="text/css">
        body{
            background-color: #e6dfc0;
        }
        h1{
           text-shadow:-1px 0 red, 0 1px red, 1px 0 red, 0 -1px red;
        }
        #div1{
            background-color: #dc3232;
            padding: 10px;
        }
    </style>

<script>
function trans_fer() {

   document.sub1.submit();
</script>
</head>
<body>


   <%//book 정보 필요없음 예약할 때만 일단은 시트정보랑 AVail 사용
   request.setCharacterEncoding("UTF-8");
   String string_ScingID=request.getParameter("ScreeningName");   
   int Scingid = Integer.parseInt(string_ScingID);

       int []Seat_no= new int [100];
        int []Sngid = new int[100];
        String []Type=new String[100];
        String []Avail=new String[100]; // y, n
        int Seat_count=0;
        ResultSet rs =null;
        Seat_count=0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        CallableStatement cstmt = null;
        

         
         
            int flag = 0;
              try {
                 conn = DBConnection.getConnection();            
                 conn.setAutoCommit(false);            
                 //쿼리 생성
                 String sql = new String();
                 sql="select * from seat where sngid=?";            
                 pstmt = conn.prepareStatement(sql);    
                 pstmt.setString(1,string_ScingID);
                 rs=pstmt.executeQuery();
                 conn.commit();
              }catch(ClassNotFoundException | NamingException | SQLException sqle) {
                  conn.rollback();
                  throw new RuntimeException(sqle.getMessage());            
              }finally {
                 while(rs.next()){
                          flag = 1;
                          Seat_no[Seat_count] = rs.getInt(1);
                          Sngid[Seat_count]  = rs.getInt(2);
                          Type[Seat_count]  = rs.getString(3);
                          Avail[Seat_count] =rs.getString(4);   
                          Seat_count++;
                 }
              }
              
             String insert_book="{call insert_book(?,?,?,?)}";
               String update_seatNum="{call update_seatNum(?)}";
               cstmt=conn.prepareCall(update_seatNum);
                cstmt.setInt(1,Scingid);
               int result=cstmt.executeUpdate();
               conn.commit();
         ScreeningDAO scing=new ScreeningDAO();
         scing.select_init_screening();
         ScreenDAO sc=new ScreenDAO();
         sc.select_init_screen();
         int cur_scning=0;
         for (cur_scning=0;cur_scning<scing.getScreening_count();cur_scning++){
           if(Scingid==scing.getSngid(cur_scning))break;
         }
         
         int cur_sc=0;
         
         for(cur_sc=0;cur_sc<sc.getScreenCount();cur_sc++){
            if(scing.getSid(cur_scning)==sc.getSid(cur_sc))break;
         }
            
         System.out.println(string_ScingID+"  "+ Integer.toString(Seat_count)+"  "+Integer.toString(sc.getSid(cur_sc))+"  "+Integer.toString(Seat_no[0]));
              
       %>
        <h1 class="text-warning">CDB</h1>
   		<div id="div1" style="height: auto; width: 100%; border:1px solid black;">
   		</div><b><font size="6" color="gray">좌석 선택</font></b><br>
       <form name="sub1" method="post" action="../pro/ReservationPro.jsp">
       <center>
       <%
      for (int i=0;i<20;i++) {
      %>
      <%if (i%5==0){ %><br></br>
      <%} %>
      <tr>
      <td>
         <%
         int verify=0;
         for(int j=0;j<Seat_count;j++){ %>
            <%if(Seat_no[j]==i){verify=1; %>
            <button name ="seat_no" value ="<%=i %>" style="width:100px;height:50px; background-color:#FF0000;cursor:default"><%=i %></button>
            <%}%>
         <%} %>
         
         <%if (verify==0){ %>
               <button name ="seat_no" value ="<%=i %>" onclick="trans_fer()" style="width:100px;height:50px"><%=i %></button>
               <%} %>
      </td>
      </tr>
       <input type="hidden" name="sngid" value="<%=string_ScingID%>" />
      <% } %>
      </center>
      </form>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script type="text/javascript" src="../../js/bootstrap.js"></script>
</body>
</html>