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
<style>

tr:nth-child(even) {backgroung-color:#58FAF4;}
tr:nth-child(odd) {background-color:#A9F5F2;}

</style>
</head>
<body>
<jsp:include page="/header.jsp" />
<jsp:include page="contact.jsp"></jsp:include>
<jsp:include page="searchContactByNamePage.jsp"></jsp:include>
<br>
<jsp:include page="searchContactByNumberPage.jsp"></jsp:include>
<table style="margin-top: 20px;">
<%
String contact=(String)session.getAttribute("userName");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("select id,first_Name,last_Name from contact_info where contact=?");
stmt.setString(1,contact);
ResultSet rset=stmt.executeQuery();
while(rset.next())
{
%>
<tr>
<form action="afterViewAllContactPage.jsp">
<input type="hidden" name="id" value="<%=rset.getString(1)%>">
<td width=350><%=rset.getString(2)%><input type="hidden" name="firstName" value="<%=rset.getString(2)%>">
<%=rset.getString(3)%><input type="hidden" name="lastName" value="<%=rset.getString(3)%>"></td>
<td width=400>
<input type="submit" name="button" value="Send EMail" >
<input type="submit" name="button" value="Send Message">
<input type="submit" name="button" value="View">
<input type="submit" name="button" value="Edit">
<input type="submit" name="button" value="Delete"></td>
</form>
</tr>
<%}%>
</table>
<jsp:include page="/footer.jsp" />
</body>
</html>