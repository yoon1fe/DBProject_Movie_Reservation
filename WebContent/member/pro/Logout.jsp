<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	
    <%
    // �α׾ƿ� ��ư�� ������ ���ԵǴ� ���ε�
    // session�� ������ؼ� ����� ������ ������
    session.invalidate();
    // �׸��� �ٽ� LOGIN.jsp�� ���ư��� �Ѵ�
    %>
    <script>
    	alert('�α׾ƿ� �Ǿ����ϴ�');
    	location.href = '../../Main.jsp';
    </script>
	</body>
</html>