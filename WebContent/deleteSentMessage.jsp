<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Message</title>
</head>
<body>
<table>
<%
try
{
String emailId=(String)session.getAttribute("userName");
String receiverEmailId=request.getParameter("receiverEmailId");
String message=request.getParameter("message");
String dateOfMessage=request.getParameter("dateOfMessage");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("delete from sent_info where sender_Email_Id=? and receiver_email_id=? and message=? and date_of_message=?");
stmt.setString(1,emailId);
stmt.setString(2,receiverEmailId);
stmt.setString(3,message);
stmt.setString(4,dateOfMessage);
stmt.executeUpdate();
%>
<%="Message deleted"%>
<%}
	catch(Exception e)
	{
		 %><script type="text/javascript">
		 alert("Unable to add contact");
		 </script><%
	}%>
<jsp:forward page="sent.jsp"></jsp:forward>
</table>
</body>
</html>