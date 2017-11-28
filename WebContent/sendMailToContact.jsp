	<%@ page import="java.sql.*" %>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Write Mail</title>
	<link rel="stylesheet" type="text/css" href="style.css"></link>
	<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
	<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
	<script type="text/javascript" src="validate.js"></script>
	</head>
	<body>
	
	<%
	String id=request.getParameter("id");
	String sender,password,receiver;
	String emailId=(String)session.getAttribute("userName");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
	PreparedStatement stmt=con.prepareStatement("select gmail_id, password from login_details where email_id=?");
	stmt.setString(1,emailId);
	ResultSet rset=stmt.executeQuery();
	if(rset.next())
	{
	sender=rset.getString(1);
	password=rset.getString(2);
	
	PreparedStatement stmt1=con.prepareStatement("select email_id from contact_info where id=?");
	stmt1.setString(1,id);
	ResultSet rset1=stmt1.executeQuery();
	  if(rset1.next())
	  {
		  receiver=rset.getString(1);
	  
	%>
	
	<jsp:include page="header.jsp"></jsp:include>
	<form id="theForm" method=post action="mailservlet1">
	<input type="hidden" name="sender" value="<%=sender%>"><input type="hidden" name="password" value="<%=password%>">
	<table>
   	<tr><td>Email Id<td> <input class="required email" type="text" name="receiver" value=<%=receiver%> disabled="disabled"></tr>
    <tr><td>Subject<td> <input type="text" name="subject"></tr>
    <tr><td>Message<td> <br/><textarea class="required" rows=10 cols=50  name="message"> </textarea></tr>
    <tr><td colspan=2><input type="submit" value="Send"/></td></tr>
    </table>
    </form>
    <%} }%>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
    </html>