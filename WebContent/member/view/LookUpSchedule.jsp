<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jsp.member.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <% 
      request.setCharacterEncoding("UTF-8");
      String string_tid=request.getParameter("theaterName");   
      int tid = Integer.parseInt(string_tid);
      String mvName = request.getParameter("movieName");
      String address = request.getParameter("address");
      

      int mvCount=0;
      MovieDAO mv= new MovieDAO();
      int MidList= 0;
      mv.select_init_movie();
      mvCount=mv.getMovieCount();
      for(int i=0; i<mvCount;i++){
         System.out.println(mv.getTitle(i)+"d  f"+ mvName);
         if(mv.getTitle(i).equals(mvName))
            MidList=mv.getMid(i);
      }

   
   int screenCount=0;
   ScreenDAO screen= new ScreenDAO();
   
   screen.select_init_screen();
   screenCount=screen.getScreenCount();
   
   int screeningCount=0;
   ScreeningDAO screening= new ScreeningDAO();
   
   screening.select_init_screening();
   screeningCount=screening.getScreening_count();
   
   ArrayList reservedSeat = new ArrayList();
   ArrayList totalSeat=new ArrayList();
   ArrayList screenNumberList=new ArrayList();
   ArrayList screening_Time=new ArrayList();
   ArrayList screeningID=new ArrayList();
   System.out.println(screeningCount);
   for(int i=0; i<screenCount;i++){
      if(screen.getTid(i)==(tid)){
         for(int j=0; j<screeningCount;j++){
            if(screening.getSid(j)==screen.getSid(i)&&MidList==screening.getMid(j)){
               //screening_Time.add(Integer.toString(screening.getTime(j)));   
               screenNumberList.add(Integer.toString(screen.getSno(i)));
               reservedSeat.add(Integer.toString(screening.getSold_seat(j)));
               totalSeat.add(Integer.toString(screen.getTotal_number(i)));
               screeningID.add(Integer.toString(screening.getSngid(j)));
            }
         }
      }
   }
   
   %>
   <table>
   <th>상영시간표</th>
   <th>좌석 선택</th>
   <tr>
   
   <td>
   <form method="post" action="LookUpSeat.jsp" name="info" onsubmit="return checkValue()">
   <select name="ScreeningName">
   <option value="">상영시간표선택</option>
   <%  for(int i = 0; i < totalSeat.size(); i++) {
         String movieName=mvName;
         //  String screening_time = (String)screening_Time.get(i);
           String screenNumber = (String)screenNumberList.get(i);
           String totalseat=(String)totalSeat.get(i);
           String notReserve=Integer.toString(Integer.parseInt((String)totalSeat.get(i))-Integer.parseInt((String)reservedSeat.get(i)));
            String SidList=(String)screeningID.get(i);
   %>      
   <option value="<%= SidList %>">  영화이름=  <%= mvName %>  상영관 번호=  <%= screenNumber %>  상영시간=  ㄹㄹㄹㄹ  남은좌석=  <%= notReserve %>/<%= totalseat %></option>
   <% } %>
   </select>
    </td>
    <td>
    <input type = "submit" class="btn btn-danger btn" style = "width:100pt" value="좌석확인"/>
    </td>
    
   </form>
    
    </tr>
    
   </table>
</body>
</html>