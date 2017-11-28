<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inbox</title>
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
<jsp:include page="header.jsp" />
<jsp:include page="message.jsp"></jsp:include>
<table>
<tr>
<th width="250">From</th>
<th width="350">Message</th><th width="250">Date</th></tr>
<%
Cookie c[]=request.getCookies();
String emailId=c[0].getValue();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("select sender_Email_Id,message,date_of_message from inbox_info where receiver_Email_Id=? order by date_of_message desc");
stmt.setString(1,emailId);
ResultSet rset=stmt.executeQuery();
while(rset.next())
{%>
<tr>
<form action="deleteInboxMessage.jsp">
<td><%=rset.getString(1)%><input type="hidden" name="senderEmailId" value="<%=rset.getString(1)%>"></td>
<td><%=rset.getString(2)%><input type="hidden" name="message" value="<%=rset.getString(2)%>"></td>
<td><%=rset.getString(3)%><input type="hidden" name="dateOfMessage" value="<%=rset.getString(3)%>"></td>
<td><input type="submit" value="Delete"></td>
</form>
</tr>
<%}
response.setIntHeader("Refresh",5);
%>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>