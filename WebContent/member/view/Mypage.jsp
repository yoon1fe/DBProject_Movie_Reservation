<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
    
<% 
String cid = (String)session.getAttribute("cid");
String password = (String)session.getAttribute("pw");
String cname = (String)session.getAttribute("cname");
Date birthdate = (Date)session.getAttribute("birthdate");
String phone_number = (String)session.getAttribute("phone_number");
String city = (String)session.getAttribute("city");
String sex = (String)session.getAttribute("sex");
%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="EUC-KR">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>CDB :: MyPage</title>
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
   <div OnClick="window.location.reload()"; style="float:left; cursor:pointer;">
   <h1 class="text-warning">CDB</h1>
   </div>
   <br>
   <br>
   <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
    <b><font size="6" color="gray">마이페이지</font></b><br><br>
   <center>
            <table>
                <tr>
                    <td style="font-weight:bold; font-size:20px;">이름 : <%=cname %></td>
                    </tr>
                    <td style="font-weight:bold; font-size:20px;">생년월일 : <%=birthdate %></td>
                    </tr>
                    <td style="font-weight:bold; font-size:20px;">전화번호 : <%=phone_number %></td>
                    </tr>
                    <td style="font-weight:bold; font-size:20px;">도시 : <%=city %></td>
                    </tr>
                    <td style="font-weight:bold; font-size:20px;">성별 : <%=sex %></td>
                    </tr>
                </tr>
            </table>
                
                <br><a href = "../../Main.jsp" class="btn btn-danger btn" style = "width:70pt">돌아가기</a>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript" src="../../js/bootstrap.js"></script>
   </body>
   

</html>