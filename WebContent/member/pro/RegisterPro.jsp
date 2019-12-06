<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%-- 자바빈 클래스 import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 

<html>
	<head>
		<meta charset="EUC-KR">
		<title>회원가입 처리 JSP</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		%>
		
		<%-- javaBean 관련 액션태그 사용 --%>
		<jsp:useBean id = "memberBean" class = "jsp.member.model.MemberBean"/>
		<jsp:setProperty property="*" name = "memberBean"/>
		
		<%
			MemberDAO dao = MemberDAO.getInstance();
			// 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
        	// insertMember()는 회원 정보를 CUSTOMER 테이블에 저장한다.
        	dao.insertMember(memberBean);
		%>

		<script>
			alert('회원가입이 완료되었습니다');
			location.href="../../Main.jsp";
		</script>
		
	</body>
</html>