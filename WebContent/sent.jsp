<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sent</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
</head>
<style>

tr:nth-child(even) {backgroung-color:#58FAF4;}
tr:nth-child(odd) {background-color:#A9F5F2;}

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="message.jsp"></jsp:include>
<table>
<tr>
<th width="250">To</th>
<th width="350">Message</th><th width="100">Date</th></tr>
<%
String emailId=(String)session.getAttribute("userName");
Class.forName("com.mysql.jdbc.Driver");
Connection con=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("select receiver_Email_Id,message,date_of_message from sent_info where sender_Email_Id=? order by date_of_message desc");
stmt.setString(1,emailId);
ResultSet rset=stmt.executeQuery();
while(rset.next())
{%>
<form action="deleteSentMessage.jsp">
<tr><td><%=rset.getString(1)%><input type="hidden" name="receiverEmailId" value="<%=rset.getString(1)%>"></td>
<td><%=rset.getString(2)%><input type="hidden" name="message" value="<%=rset.getString(2)%>"></td>
<td><%=rset.getString(3)%><input type="hidden" name="dateOfMessage" value="<%=rset.getString(3)%>"></td>
<td><input type="submit" value="Delete"></td>
</form>
</tr>
<%}
%>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>