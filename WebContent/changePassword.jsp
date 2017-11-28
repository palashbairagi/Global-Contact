
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<h1><b>Change Password</b></h1>
<%
try
{
String emailId=(String)session.getAttribute("userName");
String currentPassword=request.getParameter("currentPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");

PreparedStatement stmt1=con.prepareStatement("select first_name from login_info where email_id=? and password=?");
stmt1.setString(1, emailId);
stmt1.setString(2, currentPassword);
ResultSet rset=stmt1.executeQuery();
if(rset.next())
{
	if(newPassword.equals(confirmPassword))
	{
PreparedStatement stmt=con.prepareStatement("update user_info set password=? where email_Id=?");
stmt.setString(1, confirmPassword);
stmt.setString(2, emailId);
stmt.executeUpdate();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="setting.jsp" /><br>
<%="Password Changed"%>
<jsp:include page="footer.jsp"></jsp:include>
<%}else{%>
<script type="text/javascript">alert("Both password do not match");</script>
<jsp:include page="changePasswordPage.jsp"></jsp:include>
	<% }}else{ %>
<script type="text/javascript">alert("Wrong Password");</script>
<jsp:include page="changePasswordPage.jsp"></jsp:include>
<%}}catch(Exception e)
{
	 %><script type="text/javascript">
	 alert("Unable to change Password");
	 </script><%
}%>
</body>
</html>