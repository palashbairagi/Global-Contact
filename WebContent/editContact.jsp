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
<jsp:include page="header.jsp" />
<jsp:include page="contact.jsp"></jsp:include>
<% 
String id=request.getParameter("id");  

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/contactsolution","root","root");

  PreparedStatement stmt=con.prepareStatement("select * from contact_info where id=?");
  stmt.setString(1,id);
  ResultSet rset=stmt.executeQuery();
  if(rset.next())
  {
  String firstName=rset.getString(2);
  String lastName=rset.getString(3);
  String emailId=rset.getString(4);
  String dob=rset.getString(5);
  String address=rset.getString(6);
  String contactNumber=rset.getString(7);
  String occupation=rset.getString(8);
  String contactGroup=rset.getString(9);
  
  int c1,c2; String day,month,year;
  c1=dob.indexOf("-");
  c2=dob.indexOf("-",c1+1);
  day=dob.substring(0,c1);
  month=dob.substring(c1+1,c2);
  year=dob.substring(c2+1);
  %>
  <form id="theForm" action="updateContact.jsp">
<table align=center style="margin-top: 100px;">
<tr><td><input type="hidden" name="id" value="<%=id%>" /></td></tr>
<tr><td>First Name<td><input type=text class="required" placeholder="Enter First Name" name="firstName" value="<%=firstName %>">
<span id="firstNameErrorMessage"></span></tr>
<tr><td>Last Name<td><input type=text class="required" placeholder="Enter Last Name" name="lastName" value="<%=lastName %>">
<span id="lastNameErrorMessage"></span></tr>
<tr><td>Email Id<td><input type=text class="required" placeholder="Enter Email Id" name="emailId" value="<%=emailId%>">
<span id="emailIdErrorMessage"></span></tr>
<tr><td>Date Of Birth<td colspan='4'>
<select name="day">
<% int day1=Integer.parseInt(day);
	for(int y=1;y<=31;y++){ 
		if(y==day1){%>
<option value=<%=y%> selected><%=y %></option>
<%} else{%>
	<option value=<%=y%>><%=y %></option>
<%}}%>
</select>


<select name="month">
<%if(month.equals("Jan"))%><option value="Jan" selected="selected">Jan</option><%else %><option value="Jan">Jan</option>
<%if(month=="Feb")%><option value="Feb" selected="selected">Feb</option><%else %><option value="Feb">Feb</option>
<%if(month=="Mar")%><option value="Mar" selected="selected">Mar</option><%else %><option value="Mar">Mar</option>
<%if(month=="Apr")%><option value="Apr" selected="selected">Apr</option><%else %><option value="Apr">Apr</option>
<%if(month=="May")%><option value="May" selected="selected">May</option><%else %><option value="May">May</option>
<%if(month=="Jun")%><option value="Jun" selected="selected">Jun</option><%else %><option value="Jun">Jun</option>
<%if(month=="Jul")%><option value="Jul" selected="selected">Jul</option><%else %><option value="Jul">Jul</option>
<%if(month=="Aug")%><option value="Aug" selected="selected">Aug</option><%else %><option value="Aug">Aug</option>
<%if(month=="Sep")%><option value="Sep" selected="selected">Sep</option><%else %><option value="Sep">Sep</option>
<%if(month=="Oct")%><option value="Oct" selected="selected">Oct</option><%else %><option value="Oct">Oct</option>
<%if(month=="Nov")%><option value="Nov" selected="selected">Nov</option><%else %><option value="Nov">Nov</option>
<%if(month=="Dec")%><option value="Dec" selected="selected">Dec</option><%else %><option value="Dec">Dec</option>
</select>


<select name="year">
<% int year1=Integer.parseInt(year);
	for(int y=1980;y<=2014;y++){ 
		if(y==year1){%>
<option value=<%=y%> selected><%=y %></option>
<%} else{%>
	<option value=<%=y%>><%=y %></option>
<%}}%></select>
<span id="dateErrorMessage"></span> 

<tr><td>Address<td><textarea rows="3" cols="15" placeholder="Enter Address" name="address" ><%=address %> </textarea></td>
<td><span id="addressErrorMessage"></span></tr>
<tr><td>Contact Number<td><input type="text" placeholder="Enter Contact Number" name="contactNumber"value="<%=contactNumber %>">
<span id="contactNumberErrorMessage"></span></tr>

<tr><td>Occupation<td>
<select name="occupation" class="large">
<%if(occupation.equals("Student"))%><option value="Student" selected="selected">Student</option><%else %><option value="Student" >Student</option>
<%if(occupation.equals("Business")) %><option value="Business" selected="selected">Business</option><%else %><option value="Business" >Business</option>
<%if(occupation.equals("Gov")) %><option value="Gov" selected="selected">Service</option><%else %><option value="Gov">Service</option>
<%if(occupation.equals("Other")) %><option value="Other" selected="selected">Other</option><%else %><option value="Other" >Other</option>

</select><span id="occupationErrorMessage"></span></tr>
<tr><td>Group<td><input type=text placeholder="Enter Group Name" name="contactGroup" value="<%=contactGroup %>" />
<span id="groupErrorMessage"></span></tr>
<tr><td align="center" ><input type="submit" value="Update"/>
<td align="center" ><input type="reset" value="Clear"/></td></tr>

</table>
</form>
<%} %>  
<jsp:include page="footer.jsp" />
</body>
</html>