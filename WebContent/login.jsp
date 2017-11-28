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
<%
String userName=request.getParameter("userName");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactSolution","root","root");
PreparedStatement stmt=con.prepareStatement("select * from login_info where Email_id=? and Password=?");
stmt.setString(1,userName);
stmt.setString(2,password);
ResultSet r=stmt.executeQuery();
if(r.next())
{
	session.setAttribute("userName",r.getString(2));
	session.setAttribute("password",r.getString(3));

	Cookie c=new Cookie("myEmailId",userName);
	response.addCookie(c);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>Welcome,<%=r.getString(1) %></h2>
	<jsp:include page="message.jsp" />
	<jsp:include page="footer.jsp"></jsp:include>
<%
}
else {
	%>
	<jsp:include page="mainHeader.jsp"></jsp:include>
	<%="Invalid login,try again" %>
	<jsp:include page="loginPage.jsp" />
	<jsp:include page="mainFooter.jsp"></jsp:include>
	<%
}
%>
</body>
</html>
