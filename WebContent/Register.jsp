<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ������</title>
	</head>
	<body>
	
	<form action="Main.jsp" method="post">
		���̵�  <input type="text" name="c_id"> </br>
		��й�ȣ  <input type="password" name="c_pw"></br>
		�̸�  <input type="text" name="c_name"> </br>
		������� <input type="date" name="c_birth_date"> </br>
		��ȭ��ȣ <input type="text" name = "c_phone_number"> </br>
		�ּ�  <select name="m_residence">
						<option value="seoul" selected="selected">����</option>
						<option value="incheon">��õ</option>
						<option value="daegu">�뱸</option>
						<option value="daejeon">����</option>
						<option value="gwangju">����</option>
						<option value="ulsan">���</option>
						<option value="busan">�λ�</option>
						<option value="jeju">����</option>
					</select></br>
		����  Man<input type="radio" name="c_sex" value="M">  Woman<input type="radio" name="c_sex" value="W"></br>
		
		<input type="submit" value="�����ϱ�">
	</form>
	<%
		//����Ŭ ����
	
	
	%>
	</body>
</html>