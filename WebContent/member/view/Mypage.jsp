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
                    <td style="font-weight:bold;">�̸� : <%=cname %></td>
                    </tr>
                    <td style="font-weight:bold;">������� : <%=birthdate %></td>
                    </tr>
                    <td style="font-weight:bold;">��ȭ��ȣ : <%=phone_number %></td>
                    </tr>
                    <td style="font-weight:bold;">���� : <%=city %></td>
                    </tr>
                    <td style="font-weight:bold;">���� : <%=sex %></td>
                    </tr>
                </tr>
                
                </table>
                
                <a href = "../../Main.jsp" class="btn btn-danger btn-sm" style = "width:70pt">���ư���</a>
	</body>
	

</html>