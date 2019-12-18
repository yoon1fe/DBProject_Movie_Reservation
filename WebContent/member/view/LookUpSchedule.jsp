<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jsp.member.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CDB :: 상영시간</title>
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
 ArrayList screeningSidList=new ArrayList();
 
 for(int i=0; i<screenCount;i++){
    if(screen.getTid(i)==(tid)){
       for(int j=0; j<screeningCount;j++){
          if(screening.getSid(j)==screen.getSid(i)&&MidList==screening.getMid(j)){
             screening_Time.add(Integer.toString(screening.getTime(j)));   
             screenNumberList.add(Integer.toString(screen.getSno(i)));
             reservedSeat.add(Integer.toString(screening.getSold_seat(j)));
             totalSeat.add(Integer.toString(screen.getTotal_number(i)));
             screeningSidList.add(Integer.toString(screen.getSid(i)));
          }
       }
    }
 }
 %>
	<h1 class="text-warning">CDB</h1>
	<div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
	<b><font size="6" color="gray">상영시간 선택</font></b><br>
	
	<center>
	<table>
	<th style="font-size:25px">상영시간표</th>
	<th style="font-size:25px">좌석 선택</th>
	<tr>
   
   <td>
   <form method="post" action="lookUpSeat.jsp" name="info" onsubmit="return checkValue()">
   <select name="theaterName" style="width:550px;height:35px">
   <option value="">상영시간표선택</option>
   <%  for(int i = 0; i < totalSeat.size(); i++) {
         String movieName=mvName;
           String screening_time = (String)screening_Time.get(i);
           String screenNumber = (String)screenNumberList.get(i);
           String totalseat=(String)totalSeat.get(i);
           String notReserve=Integer.toString(Integer.parseInt((String)totalSeat.get(i))-Integer.parseInt((String)reservedSeat.get(i)));
            String SidList=(String)screeningSidList.get(i);
   %>      
   <option value="<%= SidList %>">  영화이름=  <%= mvName %>  상영관 번호=  <%= screenNumber %>  상영시간=  <%= screening_time %>  남은좌석=  <%= notReserve %>/<%= totalseat %></option>
   <% } %>
   </select>
    </td>
    <td>
    <input type = "submit" class="btn btn-danger btn" style = "width:100pt" value="좌석확인"/>
    </td>
    
   </form>
    
    </tr>
    
   </table>
   </center>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
</body>
</html>