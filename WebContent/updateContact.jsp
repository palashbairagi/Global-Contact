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
String id=request.getParameter("id");
String firstname=request.getParameter("firstName");
String lastname=request.getParameter("lastName");
String emailid=request.getParameter("emailId");
String month=request.getParameter("month");
String day=request.getParameter("day");
String year=request.getParameter("year");
String dob=day+"-"+month+"-"+year;
String address=request.getParameter("address");
String contactNumber=request.getParameter("contactNumber");
String occupation=request.getParameter("occupation");
String groups=request.getParameter("contactGroup");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/contactsolution","root","root");

PreparedStatement stmt=con.prepareStatement("update contact_info set first_Name=?,last_Name=?,date_of_birth=?,address=?,contact_Number=?,occupation=?,contact_group=? where id=?");
  stmt.setString(8, id);
  stmt.setString(1, firstname);
  stmt.setString(2, lastname);
  stmt.setString(3, dob);
  stmt.setString(4, address);
  stmt.setString(5,contactNumber);
  stmt.setString(6, occupation);
  stmt.setString(7, groups);
  stmt.executeUpdate();
  %>
  <%="Contact Updated" %>
  <jsp:forward page="viewAllContact.jsp"></jsp:forward>
</body>
</html>