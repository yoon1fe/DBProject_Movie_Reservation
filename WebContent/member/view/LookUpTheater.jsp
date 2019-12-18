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
<title>CDB :: 극장 선택</title>
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
<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.info.theaterName.value){
                alert("영화관을 선택하세요.");
                return false;
            }
            

        }
    </script>
</head>
<body>

	<% 
		request.setCharacterEncoding("UTF-8");
		String mvName = request.getParameter("movieName");
		String address = request.getParameter("address");
		

	int thCount=0;
	TheaterDAO th= new TheaterDAO();
	ArrayList thList = new ArrayList();
	th.select_init_theater();
	thCount=th.getTheaterCount();
	for(int i=0; i<thCount;i++){
		if(th.getLocation(i).equals(address))
		thList.add(th.getTname(i));
	}
	%>
	<h1 class="text-warning">CDB</h1>
	<div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
	<b><font size="6" color="gray">영화관 선택</font></b><br>
	<center>
	<table>
	<th style="font-size:25px">영화관</th>
	<th style="font-size:25px">상영시간 선택</th>
	<tr>
	
	<td>
	<form method="post" action="LookUpSchedule.jsp" name="info" onsubmit="return checkValue()">
		<select name="theaterName"  style="width:110px;height:35px">
			<option value="">영화관선택</option>
    		<%  for(int i = 0; i < thList.size(); i++) {
           	String option = (String)thList.get(i);
           	String value = Integer.toString(th.getTid(i));
   			%>
   			<option value="<%= value %>"><%= option %></option>
   			<% } %>
    	</select>
    
    </td>
    <input type="hidden" name="movieName" value="<%= mvName %>" />
	<input type="hidden" name="address" value="<%= address %>" />
    <td>
	<input type = "submit" class="btn btn-danger btn" style = "width:100pt" value="시간표확인"/>
    </td>
    
	</form>
    
    </tr>
    
	</table>
	</center>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
</body>


</html>