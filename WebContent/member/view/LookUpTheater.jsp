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
<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.info.theaterName.value){
                alert("영화이름을 입력하세요.");
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
	<table>
	<th>영화관</th>
	<th>상영 시간표 선택</th>
	<tr>
	
	<td>
	<form method="post" action="LookUpSchedule.jsp" name="info" onsubmit="return checkValue()">
	<select name="theaterName">
	<option value="">영화관선택</option>
    <%  for(int i = 0; i < thList.size(); i++) {
           String option = (String)thList.get(i);
   %>
   <option value="<%= option %>"><%= option %></option>
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
</body>


</html>