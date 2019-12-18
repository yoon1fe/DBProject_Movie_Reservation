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
<title>CDB :: 예매</title>
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
            top:15px;
        }
    </style>
 <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.info.movieName.value){
                alert("영화를 선택하세요.");
                return false;
            }
            
            if(!document.info.address.value){
                alert("위치를 선택하세요.");
                return false;
            }
           
        }
    </script>


</head>
<body>
<div style="float:left;">
    <h1 class="text-warning">CDB</h1>
</div>
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
            <a href = "member/view/Mypage.jsp" class="btn btn-danger btn-sm" style = "width:70pt">마이페이지</a>
            <%
         }
         %>
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
   <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
   <b><font size="6" color="gray">예매</font></b><br>
   <center>
   <table>
   <th style="font-size:25px">영화</th>
   <th style="font-size:25px">지역</th>
   <th style="font-size:25px">영화관 검색</th>
   <tr>
   <td>
   <form method="post" action="LookUpTheater.jsp" name="info" onsubmit="return checkValue()">
   <select name="movieName"  style="width:100px;height:30px">
   <option value="">영화선택</option>
      <%  for(int i = 0; i < al.size(); i++) {
           String option = (String)al.get(i);
   %>
   <option value="<%= option %>"><%= option %></option>
   <% } %>
    </select>
    </td>
    <td>
    <select name="address" style="width:100px;height:30px">
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
    
 <input type = "submit" class="btn btn-danger btn-sm" style = "width:100pt" value="영화관 확인"/><br>
    </td>
    </form>
    </tr>
   </table>
   </center>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript" src="../../js/bootstrap.js"></script>
   
</body>


</html>