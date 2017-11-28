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
<jsp:include page="/header.jsp" />
<%
String emailId=(String)session.getAttribute("userName");
String receiverEmailId=request.getParameter("receiverEmailId");
String message=request.getParameter("message");
String dateOfMessage=request.getParameter("dateOfMessage");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");
PreparedStatement stmt=con.prepareStatement("select receiver_Email_Id,message from draft_info where sender_Email_Id=? and date_of_message=?");
stmt.setString(1,emailId);
stmt.setString(2,dateOfMessage);

ResultSet rset=stmt.executeQuery();
if(rset.next())
{%>
<form id="theForm" action="sendMessageFromDraft.jsp">
<table align="center" style="margin-top: 100px">
<tr><td>To<td><input type="text" name="receiverEmailId" value=<%=rset.getString(1)%>>
<tr><td>Message<td><textarea rows="5" cols="50" name="message"><%=rset.getString(2) %></textarea>
<tr><td><input type="submit" name="button" value="Send">
<input type="reset" value="Clear" /> 
<input type="submit" name="button" value="Save"></td></tr>
</table>
</form>


<%}
%>
<jsp:include page="/footer.jsp" />
</body>
</html>