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
<jsp:include page="/header.jsp" />
<jsp:include page="contact.jsp"></jsp:include>
<%
String id=request.getParameter("id");  

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/contactsolution","root","root");

  PreparedStatement stmt=con.prepareStatement("select * from contact_info where id=?");
  stmt.setString(1,id);
  ResultSet rset=stmt.executeQuery();
  if(rset.next())
  {
  String firstName=rset.getString(2);
  String lastName=rset.getString(3);
  String emailId=rset.getString(4);
  String dob=rset.getString(5);
  String address=rset.getString(6);
  String contactNumber=rset.getString(7);
  String occupation=rset.getString(8);
  String contactGroup=rset.getString(9);
%>
<form action="editContact.jsp">
<table align="center" style="margin-top: 100px;">
<tr><td><input type="hidden" name="id" value="<%=id %>">
<tr><td>Name<td><%=firstName+" "+lastName  %></tr>
<tr><td>Contact Number<td><%=contactNumber %></tr>
<tr><td>Email Id<td><%=emailId%></tr>
<tr><td>Date Of Birth<td><%=dob %></tr>
<tr><td>Address<td><%=address %></tr>
<tr><td>Occupation<td><%=occupation %></tr>
<tr><td>Group<td><%=contactGroup %></td></tr>
<tr><td colspan=2><input type="submit" value="Edit" /></td></tr>
</table>
</form>
<%} %>
<jsp:include page="/footer.jsp" />
</body>
</html>