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
		<title>CDB :: MyPage</title>
	</head>
	<body>
	
	<center>
            <table>
                <tr>
                    <td style="font-weight:bold;">이름 : <%=cname %></td>
                    </tr>
                    <td style="font-weight:bold;">생년월일 : <%=birthdate %></td>
                    </tr>
                    <td style="font-weight:bold;">전화번호 : <%=phone_number %></td>
                    </tr>
                    <td style="font-weight:bold;">도시 : <%=city %></td>
                    </tr>
                    <td style="font-weight:bold;">성별 : <%=sex %></td>
                    </tr>
                </tr>
                
                </table>
                
                <a href = "../../Main.jsp" class="btn btn-danger btn-sm" style = "width:70pt">돌아가기</a>
	</body>
	

</html>