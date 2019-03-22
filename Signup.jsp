<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","");
	%>
	
	<%
		PreparedStatement ps1 = conn.prepareStatement("INSERT INTO register(enrollment_no,username,password,email,mobile_no,sem) VALUES(?,?,?,?,?,?)");
		ps1.setString(1, request.getParameter("enrollment_no"));
		ps1.setString(2, request.getParameter("username"));
		ps1.setString(3, request.getParameter("password"));
		ps1.setString(4, request.getParameter("email"));
		ps1.setString(5, request.getParameter("mobile_no"));
		ps1.setString(6, request.getParameter("sem"));
		//ps1.setInt(7, 0);
		ps1.execute();
		out.println("Welcome " +request.getParameter("name"));
	%>
</body>
</html>