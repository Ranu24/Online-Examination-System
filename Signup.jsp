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
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM signup where username=(?) and enrollment_no=(?)");
		ps1.setInt(1,Integer.parseInt(request.getParameter("enrollment_no")));
		ps1.setString(2, request.getParameter("username"));
		ResultSet rs = ps1.executeQuery();
		
		int c=0;
		while(rs.next())
			c++;
		if(c == 0)
		{
			PreparedStatement ps2 = conn.prepareStatement("INSERT INTO signup(enrollment_no,username,password,email,mobile_no,sem,scoreboard) VALUES(?,?,?,?,?,?,?)");
			ps2.setInt(1, Integer.parseInt(request.getParameter("enrollment_no")));
			ps2.setString(2, request.getParameter("username"));
			ps2.setString(3, request.getParameter("password"));
			ps2.setString(4, request.getParameter("email"));
			ps2.setString(5, request.getParameter("mobile_no"));
			ps2.setInt(6, Integer.parseInt(request.getParameter("sem")));
			ps2.setInt(7, 0);
			ps2.execute();
			out.println("Welcome " +request.getParameter("username"));
			response.sendRedirect("QuizQuestions.jsp");
		}
		else 
			out.println("Already Signed-In");
	%>
</body>
</html>