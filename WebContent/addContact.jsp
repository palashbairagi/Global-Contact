<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add contact</title>
</head>
<body>
<% 
try
{
int id=0;
String contact=(String)session.getAttribute("userName");
String firstname=request.getParameter("firstName");
String lastname=request.getParameter("lastName");
String emailid=request.getParameter("emailId");
String month=request.getParameter("month");
String day=request.getParameter("day");
String year=request.getParameter("year");
String dob=day+"-"+month+"-"+year;
String address=request.getParameter("address");
String contactNumber=request.getParameter("contactNumber");
String occupation=request.getParameter("occupation");
String groups=request.getParameter("groups");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contactsolution","root","root");

PreparedStatement pstmt=con.prepareStatement("select max(id) from contact_info");
ResultSet rset=pstmt.executeQuery();
if(rset.next())
{
id=rset.getInt(1);
id++;
}
	
PreparedStatement stmt=con.prepareStatement("insert into contact_info values(?,?,?,?,?,?,?,?,?,?)");
  
  stmt.setInt(1,id);
  stmt.setString(2, firstname);
  stmt.setString(3, lastname);
  stmt.setString(4, emailid);
  stmt.setString(5, dob);
  stmt.setString(6, address);
  stmt.setString(7,contactNumber);
  stmt.setString(8, occupation);
  stmt.setString(9, groups);
  stmt.setString(10,contact);
  stmt.executeUpdate();
  %>
  <%="Contact Added" %>
  <jsp:forward page="viewAllContact.jsp"></jsp:forward>
  <%}
	catch(Exception e)
	{
		 %><script type="text/javascript">
		 alert("Unable to add contact");
		 </script><%
	}%>
  
</body>
</html>