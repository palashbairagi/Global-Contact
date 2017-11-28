<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Contact</title>
</head>
<body>
<% 
try
{
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/contactsolution","root","root");

  PreparedStatement stmt=con.prepareStatement("delete from contact_info where Id=?");
  stmt.setString(1,id);
  stmt.executeUpdate();
  %>
  <%= "Contact Deleted" %>
<jsp:forward page="viewAllContact.jsp"></jsp:forward>
<%}catch(Exception e)
	{
		 %><script type="text/javascript">
		 alert("Unable to add contact");
		 </script><%
	}%>
</body>
</html>