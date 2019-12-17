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
	
	<select name="theaterName">
	<option value="<%= thName %>"><%= thName %></option>
	<option value="<%= mvName %>"><%= mvName %></option>
	<option value="<%= address %>"><%= address %></option>
	</select>
	
</body>
</html>