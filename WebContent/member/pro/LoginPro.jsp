<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
	String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
	String user = "cdb";
	String pass = "cdb";

	Connection conn = null;
	int flag = 0;
	String sql = null;
	String query = null;
	String cid = null;
	String password = null;
	String cname = null;
	Date birthdate = null;
	String phone_number = null;
	String city = null;
	String sex = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		System.err.println("error = " + e.getMessage());
		System.exit(1);
	}

	try {
		conn = DriverManager.getConnection(url, user, pass);
	} catch (SQLException e) {
		System.err.println("sql error = " + e.getMessage());
		System.exit(1);
	}

	try {
		conn.setAutoCommit(false);

		Statement stmt = conn.createStatement();

		String id = request.getParameter("input_id");
		String pw = request.getParameter("input_pw");
		
		sql = "select * from customer where cid = '" + id +"' and pw = '" + pw + "'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			flag = 1;	//아이디, 비밀번호가 있는 경우 flag = 1
			cid = rs.getString(1);
			password = rs.getString(2);
			cname = rs.getString(3);
			birthdate = rs.getDate(4);
			phone_number = rs.getString(5);
			city = rs.getString(6);
			sex = rs.getString(7);
		}
		
		if(flag == 1){
			session.setAttribute("cid", cid);
			session.setAttribute("pw", password);
			session.setAttribute("cname", cname);
			session.setAttribute("birthdate", birthdate);
			session.setAttribute("phone_number", phone_number);
			session.setAttribute("city", city);
			session.setAttribute("sex", sex);
			
			out.println("<script>");
			out.println("alert('로그인이 되었습니다'); location.href='../../Main.jsp';");
			out.println("</script>");
			//response.sendRedirect("../../Main.jsp");
		}
		else{
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인하세요'); location.href='../view/LoginForm.jsp';");
			out.println("</script>");

			//response.sendRedirect("../view/LoginForm.jsp");
		}


		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		conn.close();
	} catch (Exception e) {
		System.err.println("sql error = " + e.getMessage());
	}
	%>
	</body>
</html>