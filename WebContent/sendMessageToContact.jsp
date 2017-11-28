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
String id=request.getParameter("id");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/contactsolution","root","root");

PreparedStatement stmt=con.prepareStatement("select email_id from contact_info where id=?");
stmt.setString(1,id);
ResultSet rset=stmt.executeQuery();
  if(rset.next())
  {
  	String emailId=rset.getString(1);
  	%>
	
<jsp:include page="header.jsp" />
<br>
<form id="theForm" action="afterComposePage.jsp">
<table align="center" style="margin-top: 150px;">
<tr><td>
To<td><input type="text" class="required email" name="receiverEmailId" value=<%=emailId%> />
<tr><td>Message<td><textarea class="required" rows="5" cols="50" name="message" >
</textarea>
</td></tr>
<tr><td colspan=3><center>
<input type="submit" name="button" value="Send">
<input type="reset" value="Clear" /> 
<input type="submit" name="button" value="Save">
</center></table>
</form>
<%}%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>