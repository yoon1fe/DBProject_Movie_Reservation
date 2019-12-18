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