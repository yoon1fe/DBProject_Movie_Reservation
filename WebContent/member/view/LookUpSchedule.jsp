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
		String thName = request.getParameter("theaterName");
		String mvName = request.getParameter("movieName");
		String address = request.getParameter("address");
		

	int thCount=0;
	TheaterDAO th = new TheaterDAO();
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
	<b><font size="6" color="gray">상영시간 선택</font></b><br>
	
	<center>
	<select name="theaterName"  style="width:100px;height:35px">
	<option value="<%= thName %>"><%= thName %></option>
	<option value="<%= mvName %>"><%= mvName %></option>
	<option value="<%= address %>"><%= address %></option>
	</select>
	</center>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
</body>
</html>