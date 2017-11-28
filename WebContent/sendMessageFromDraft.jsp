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
String senderEmailId=(String)session.getAttribute("userName");
String receiverEmailId=request.getParameter("receiverEmailId");
String message=request.getParameter("message");
String dateOfMessage=request.getParameter("dateOfMessage");

java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");

PreparedStatement stmt=con.prepareStatement("delete from draft_info where sender_email_id=? and receiver_email_id=? and date_of_message=?");
stmt.setString(1,senderEmailId);
stmt.setString(2,receiverEmailId);
stmt.setString(3,dateOfMessage);
stmt.executeUpdate();

PreparedStatement stmt1=con.prepareStatement("insert into inbox_info values(?,?,?,?)");
stmt1.setString(1,senderEmailId);
stmt1.setString(2,receiverEmailId);
stmt1.setString(3,message);
stmt1.setTimestamp(4,date);
stmt1.executeUpdate();

PreparedStatement stmt2=con.prepareStatement("insert into sent_info values(?,?,?,?)");
stmt2.setString(1,senderEmailId);
stmt2.setString(2,receiverEmailId);
stmt2.setString(3,message);
stmt2.setTimestamp(4,date);
stmt2.executeUpdate();

%>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="message.jsp"></jsp:include>
<h1>Message has been sent successfully</h1>
<jsp:include page="footer.jsp" />

</body>
</html>