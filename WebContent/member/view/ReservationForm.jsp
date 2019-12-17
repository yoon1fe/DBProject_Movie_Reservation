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
            if(!document.info.movieName.value){
                alert("영화이름을 입력하세요.");
                return false;
            }
            
            if(!document.info.address.value){
                alert("위치를 입력하세요.");
                return false;
            }
           
        }
    </script>


</head>
<body>

<div id="div2" style="float:right;">
		<%

			if((String)session.getAttribute("cid") == null){	
				%>
				<a href = "member/view/LoginForm.jsp" class="btn btn-danger btn-sm" style = "width:70pt">로그인</a>
				<a href = "member/view/RegisterForm.jsp" class="btn btn-danger btn-sm" style = "width:70pt">회원가입</a>
				<%
			}
		
			else{												
				%>
				<a href = "member/pro/Logout.jsp" class="btn btn-danger btn-sm" style = "width:70pt">로그아웃</a>
				<%
			}
			%>
		
		<a href = "" class="btn btn-danger btn-sm" style = "width:70pt">마이페이지</a>
		</div><br><br>
	<%
	int mvCount;
	MovieDAO mv= new MovieDAO();
	ArrayList al = new ArrayList();
	mv.select_init_movie();
	mvCount=mv.getMovieCount();
	for(int i=0;i<mvCount;i++){
		al.add(mv.getTitle(i));	
	}
	%>
	
	<table>
	<th>영화</th>
	<th>지역</th>
	<th>영화시간표 검색</th>
	<tr>
	<td>
	<form method="post" action="LookUpTheater.jsp" name="info" onsubmit="return checkValue()">
	<select name="movieName">
	<option value="">영화선택</option>
      <%  for(int i = 0; i < al.size(); i++) {
           String option = (String)al.get(i);
   %>
   <option value="<%= option %>"><%= option %></option>
   <% } %>
    </select>
    </td>
    <td>
    <select name="address">
                        	<option value = "">도시 선택</option>
                        	<option>서울</option>
                        	<option>인천</option>
                        	<option>대구</option>
                        	<option>부산</option>
                        	<option>울산</option>
                        	<option>광주</option>
                        	<option>대전</option>
                        	<option>제주</option>
                        </select>
    </td>
    <td>
    
 <input type = "submit" class="btn btn-danger btn" style = "width:100pt" value="영화관확인"/><br>
    </td>
    </form>
    </tr>
	</table>
</body>


</html>