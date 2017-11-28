<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
<% 
String emailId=(String)session.getAttribute("userName");
String gmailLogin=request.getParameter("gmailLogin");
String gmailPassword=request.getParameter("gmailPassword");
System.out.print(emailId);
System.out.print(gmailLogin);
System.out.print(gmailPassword);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("update login_details set gmail_id=?, password=? where email_id=?");

stmt.setString(1,gmailLogin);
stmt.setString(2,gmailPassword);
stmt.setString(3,emailId);
stmt.executeUpdate();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="setting.jsp"></jsp:include>
<br>
<h1><%="Setting has been saved" %></h1>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>