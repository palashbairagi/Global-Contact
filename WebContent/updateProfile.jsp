<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String emailId=(String)session.getAttribute("userName");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String gender=request.getParameter("gender");
String dob=request.getParameter("day")+"-"+request.getParameter("month")+"-"+request.getParameter("year");
String address=request.getParameter("address");
String contact=request.getParameter("contactNumber");
String occupation=request.getParameter("occupation");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("update user_info set first_Name=?,last_Name=?,sex=?,date_of_birth=?,Address=?,contact_Number=?,occupation=? where email_Id=?");

stmt.setString(1,firstName);
stmt.setString(2,lastName);
stmt.setString(3,gender);
stmt.setString(4,dob);
stmt.setString(5,address);
stmt.setString(6,contact);
stmt.setString(7,occupation);
stmt.setString(8,emailId);
stmt.executeUpdate();

%> 
<%="Profile Updated" %>
<jsp:include page="viewProfile.jsp" />
</body>
</html> 