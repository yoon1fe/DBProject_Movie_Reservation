<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%-- �ڹٺ� Ŭ���� import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 

<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ������ ó�� JSP</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		%>
		
		<%-- javaBean ���� �׼��±� ��� --%>
		<jsp:useBean id = "memberBean" class = "jsp.member.model.MemberBean"/>
		<jsp:setProperty property="*" name = "memberBean"/>
		
		<%
			MemberDAO dao = MemberDAO.getInstance();
			// ȸ�������� ����ִ� memberBean�� dao�� insertMember() �޼���� �ѱ��.
        	// insertMember()�� ȸ�� ������ CUSTOMER ���̺� �����Ѵ�.
        	dao.insertMember(memberBean);
		%>

		<script>
			alert('ȸ�������� �Ϸ�Ǿ����ϴ�');
			location.href="../../Main.jsp";
		</script>
		
	</body>
</html>