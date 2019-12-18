<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="EUC-KR">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>CDB :: 겨울왕국2</title>
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
   </head>
   <body>
   <%
   String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
   String user = "cdb";
   String pass = "cdb";

   Connection conn = null;
   String sql = null;
   String query = null;
   
   String title = null;
   String grade = null;
   int score = 0;
   String director = null;
   String actor = null;
   int runningTime = 0;
   int moviegoers = 0;
   String genre = null;
   
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
      
      sql = "select * from movie where mid = 1";
      ResultSet rs = stmt.executeQuery(sql);
      while(rs.next()){
         title = rs.getString(2);
         grade= rs.getString(4);
         score = rs.getInt(5);
         director = rs.getString(6);
         actor = rs.getString(7);
         runningTime = rs.getInt(8);
         moviegoers = rs.getInt(9);
         genre = rs.getString(10);
      }
      System.out.println(grade + score+director);
      conn.commit();
      conn.setAutoCommit(true);
      stmt.close();
      conn.close();
   } catch (Exception e) {
      System.err.println("sql error = " + e.getMessage());
   }
   %>
   
   <h1 class="text-warning">CDB</h1>
   <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
   
   <center>
       <table>
           <tr>
               <img src ="../../ImageServlet?req=0" width="200" />
               <td style="font-weight:bold; font-size:20px;">제목 : <%=title %></td>
           </tr>
           <td style="font-weight:bold; font-size:20px;">장르 : <%=genre %></td>
           </tr>
           <td style="font-weight:bold; font-size:20px;"> <%=grade %> 세 관람가</td>
           </tr>
           <td style="font-weight:bold; font-size:20px;">박스오피스 순위 : <%=score %></td>
           </tr>
           <td style="font-weight:bold; font-size:20px;">감독 : <%=director %></td>
           </tr>
           <td style="font-weight:bold; font-size:20px;">출연 배우 : <%=actor %></td>
           </tr>
           <td style="font-weight:bold; font-size:20px;">상영 시간 : <%=runningTime%></td>
           </tr>
           <td style="font-weight:bold; font-size:20px;">관객수 : <%=moviegoers %></td>
           </tr>
           </tr>
       </table>
   </center>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript" src="../../js/bootstrap.js"></script>
   </body>
</html>