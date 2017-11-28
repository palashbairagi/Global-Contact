<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="setting.jsp"></jsp:include>
<form action="editProfile.jsp">

<table align="center" style="margin-top: 100px;">

<% 
String emailId=(String)session.getAttribute("userName");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("select * from user_info where email_id=?");
stmt.setString(1, emailId);
ResultSet rset=stmt.executeQuery();
while(rset.next())
{
emailId=rset.getString(1);
String firstName=rset.getString(3);
String lastName=rset.getString(4);
String gender=rset.getString(5);
String dob=rset.getString(6);
String address=rset.getString(7);
String contact=rset.getString(8);
String occupation=rset.getString(9);

if (gender.equals("M"))gender="Male";
else gender="Female";
%>
<tr><td>Email Id<td><%=emailId%></tr>
<tr><td>Name<td><%=firstName+" "+lastName  %></tr>
<tr><td>Gender<td><%=gender %></tr>
<tr><td>Date Of Birth<td><%=dob %></tr>
<tr><td>Address<td><%=address %></tr>
<tr><td>Contact<td><%=contact %></tr>
<tr><td>Occupation<td><%=occupation %></tr>
<%} %>
<tr><td colspan=2><input type="submit" value="Edit" /></td></tr>
</table>
</form>
<jsp:include page="/footer.jsp" />
</body>
</html>