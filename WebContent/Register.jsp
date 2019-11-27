<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>회원가입</title>
	</head>
	<body>
	
	<form action="Main.jsp" method="post">
		아이디  <input type="text" name="c_id"> </br>
		비밀번호  <input type="password" name="c_pw"></br>
		이름  <input type="text" name="c_name"> </br>
		생년월일 <input type="date" name="c_birth_date"> </br>
		전화번호 <input type="text" name = "c_phone_number"> </br>
		주소  <select name="m_residence">
						<option value="seoul" selected="selected">서울</option>
						<option value="incheon">인천</option>
						<option value="daegu">대구</option>
						<option value="daejeon">대전</option>
						<option value="gwangju">광주</option>
						<option value="ulsan">울산</option>
						<option value="busan">부산</option>
						<option value="jeju">제주</option>
					</select></br>
		성별  Man<input type="radio" name="c_sex" value="M">  Woman<input type="radio" name="c_sex" value="W"></br>
		
		<input type="submit" value="가입하기">
	</form>
	<%
		//오라클 연동
	
	
	%>
	</body>
</html>