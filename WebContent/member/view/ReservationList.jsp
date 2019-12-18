<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
    
<%
String cid = (String)session.getAttribute("cid");
String []title = new String [10];
int []sno = new int [10];
int []time = new int [10];
String []tname = new String [10];
int []seat_no = new int [10];
String []location = new String [10];
int []mid = new int [10];
%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="EUC-KR">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>CDB :: ������ȸ</title>
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
           #div2{
              position:relative;
              left:180px;
           }
       </style>
   </head>
   <body>
   <%
   String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
   String user = "cdb";
   String pass = "cdb";
   
   int mcount= 0;
   Connection conn = null;
   String sql = null;
   
   try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
   } catch (ClassNotFoundException e) {
      System.err.println("error = " + e.getMessage());
      System.exit(1);
   }

   try {
      conn = DriverManager.getConnection(url, user, pass);
   } catch (SQLException e) {
      System.err.println("sql error = " + e.getMessage());
      System.exit(1);
   }

   try {
      conn.setAutoCommit(false);
      Statement stmt = conn.createStatement();
      sql = "select m.title ��ȭ����, s.sno �󿵰�, mm.time ��ȭ�ð�, t.tname ��ȭ��, mm.seat_no �¼���ȣ, t.location, m.mid from (select scr.mid, scr.sid, scr.time, m.seat_no from (select b.seat_no, b.sngid from book b where b.cid = ?) m, screening scr where m.sngid = scr.sngid) mm, movie m, screen s, theater t where m.mid = mm.mid and mm.sid = s.sid and t.tid = s.tid";

      

      PreparedStatement pstmt = null;
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, cid);

      ResultSet rs = pstmt.executeQuery();

      System.out.println(cid);
      
      while(rs.next()){
         title[mcount] = rs.getString(1);
         sno[mcount] = rs.getInt(2);
         //time = rs.getInt(3);
         tname[mcount] = rs.getString(4);
         seat_no[mcount] = rs.getInt(5);
         location[mcount] = rs.getString(6);
         mid[mcount] = rs.getInt(7);
         mcount++;
      }

      conn.commit();
      conn.setAutoCommit(true);
      stmt.close();
      conn.close();
   } catch (Exception e) {
      System.err.println("sql error = " + e.getMessage());
   }
   
   
   %>
   <div OnClick="location.href='../../Main.jsp'" style="cursor:pointer">
   <h1 class="text-warning">CDB</h1>
   </div>
    <!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
    <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
    <div id="wrap">
        <b><font size="6" color="gray">������ȸ</font></b><br>
   
   
   <%for(int i=0; i<mcount;i++){ %>
    <div id="div2" style="float:left;">
    <img src ="../../ImageServlet?req=<%=mid[i] - 1 %>" width="200" /></div>
    <center> 
    <br></br>
    <br></br>
    <br></br>
        <table>
            <tr>
       
               <td style="font-weight:bold; font-size:30px;">��ȭ���� : <%=title[i] %></td>
               </tr>
               <td style="font-weight:bold; font-size:30px;">�� �ð�: <%=time[i]  %></td>
               </tr>
               <td style="font-weight:bold; font-size:30px;">��ȭ�� : <%=tname[i] %> <%=location[i] %> �� <%=sno[i] %> ��</td>
               </tr>
               <td style="font-weight:bold; font-size:30px;">�¼� : <%=seat_no[i] %> ��</td>
               </tr>
            </tr>
         </table>
         
   </center>
   <%} %>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript" src="../../js/bootstrap.js"></script>
   </body>
</html>