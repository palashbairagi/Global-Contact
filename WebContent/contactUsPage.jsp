<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<%
	try
	{
	String emailId=(String)session.getAttribute("userName");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
	PreparedStatement stmt=con.prepareStatement("select gmail_id, password from login_details where email_id=?");
	stmt.setString(1,emailId);
	ResultSet rset=stmt.executeQuery();
	if(rset.next())
	{
	String sender=rset.getString(1);
	String password=rset.getString(2);
	%>

    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="style.css"></link>
	<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
	<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
	<script type="text/javascript" src="validate.js"></script>
    </head>
    <body>
    <jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="setting.jsp"></jsp:include>
    <h1><b>All About Contact Solution</b></h1>
    <form id="theForm" method=post action="mailservlet1">
    <input type="hidden" name="sender" value="<%=sender%>">
    <input type="hidden" name="password" value="<%=password%>"> 
 	<input type="hidden" name="receiver" value="ritutiwari11122@gmail.com">
    <table align="center" style="margin-top: 100px;">
    <tr><td>
    <tr><td>Subject<td> <input type="text" name="subject"></tr>
    <tr><td>Message<td> <br/><textarea rows=10 cols=50  name="message"> </textarea></tr>
    <tr><td colspan=2><input type="submit" value="Submit">
    <input type="reset" value="Reset"></tr>
  </table>
  </form>
  <%}}catch(Exception e)
	{
		 %><script type="text/javascript">
		 alert("Unable to Contact. Check Email Setting");
		 </script><%
	}%>
  </body>
  </html>