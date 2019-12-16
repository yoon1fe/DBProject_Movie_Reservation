<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>CDB :: ��Ʈ ũ��������</title>
	</head>
	<body>
	<%
	String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
	String user = "cdb";
	String pass = "cdb";

	Connection conn = null;
	String sql = null;
	String query = null;
	
	String title = null;
	String grade = null;
	int score = 0;
	String director = null;
	String actor = null;
	int runningTime = 0;
	int moviegoers = 0;
	String genre = null;
	
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
		
		sql = "select * from movie where mid = 3";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			title = rs.getString(2);
			grade= rs.getString(4);
			score = rs.getInt(5);
			director = rs.getString(6);
			actor = rs.getString(7);
			runningTime = rs.getInt(8);
			moviegoers = rs.getInt(9);
			genre = rs.getString(10);
		}
		System.out.println(grade + score+director);
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		conn.close();
	} catch (Exception e) {
		System.err.println("sql error = " + e.getMessage());
	}
	%>
	
	<center>
            <table>
                <tr>
                	<img src ="../../ImageServlet?req=2" width="200" />
                    <td style="font-weight:bold;">���� : <%=title %></td>
                    </tr>
                    <td style="font-weight:bold;">�帣 : <%=genre %></td>
                    </tr>
                    <td style="font-weight:bold;"> <%=grade %> �� ������</td>
                    </tr>
                    <td style="font-weight:bold;">�ڽ����ǽ� ���� : <%=score %></td>
                    </tr>
                    <td style="font-weight:bold;">���� : <%=director %></td>
                    </tr>
                    <td style="font-weight:bold;">�⿬ ��� : <%=actor %></td>
                    </tr>
                    <td style="font-weight:bold;">�� �ð� : <%=runningTime%></td>
                    </tr>
                    <td style="font-weight:bold;">������ : <%=moviegoers %></td>
                    </tr>
                </tr>
                
                </table>
	</body>
</html>