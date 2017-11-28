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
          String firstname=request.getParameter("firstName");
          String lastname=request.getParameter("lastName");
          String emailId=request.getParameter("emailId");
          String password=request.getParameter("password");
          String confirmPassword=request.getParameter("confirmPassword");
          String gender=request.getParameter("gender");
          String month=request.getParameter("month");
          String day=request.getParameter("day");
          String year=request.getParameter("year");
          String dob=day+"-"+month+"-"+year;
          String address=request.getParameter("address");
          String contact=request.getParameter("contactNumber");
          String occupation=request.getParameter("occupation");
          
          if(password.equals(confirmPassword)==true)
          {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection
                  ("jdbc:mysql://localhost:3306/contactsolution","root","root");
          
		    PreparedStatement stmt=con.prepareStatement("insert into user_info values(?,?,?,?,?,?,?,?,?)");
		    stmt.setString(1, emailId);
		    stmt.setString(2, password);
		    stmt.setString(3, firstname);
		    stmt.setString(4, lastname);
		    stmt.setString(5, gender);
		    stmt.setString(6, dob);
		    stmt.setString(7, address);
		    stmt.setString(8, contact);
		    stmt.setString(9, occupation);
		   	stmt.executeUpdate();
		   	
		   	PreparedStatement pstmt=con.prepareStatement("insert into login_details value(?,?,?)");
		   	pstmt.setString(1,emailId);
		  	pstmt.setString(2,"");
		  	pstmt.setString(3,"");
		  	pstmt.executeUpdate();
          %>
          <jsp:include page="header.jsp"></jsp:include>
          <h1><%="Congratulation, you are registered" %></h1>
          <jsp:include page="loginPage.jsp"></jsp:include>
          <jsp:include page="footer.jsp"></jsp:include>
          <%}else {%>
          <script type="text/javascript">
		 alert("Both password do not match");
		 </script>
		 <jsp:include page="registrationPage.jsp"></jsp:include>
		 <%} %>
</body>
</html>