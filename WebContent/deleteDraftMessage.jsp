<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Message</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
</head>
<body>
<%
try
{
String emailId=(String)session.getAttribute("userName");
String receiverEmailId=request.getParameter("receiverEmailId");
String message=request.getParameter("message");
String dateOfMessage=request.getParameter("dateOfMessage");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("delete from draft_info where sender_email_id=? and receiver_email_id=? and message=? and date_of_message=?");
stmt.setString(1,emailId);
stmt.setString(2,receiverEmailId);
stmt.setString(3,message);
stmt.setString(4,dateOfMessage);
stmt.executeUpdate();
%>
<jsp:include page="draft.jsp" />
<%="Message deleted" %>
<%}catch(Exception e)
	{
		 %><script type="text/javascript">
		 alert("Unable to delete");
		 </script><%
	}%></body>
</html>