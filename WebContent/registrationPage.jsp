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
<jsp:include page="mainHeader.jsp"></jsp:include>			
<center>
<form id="theForm" action="registration.jsp" method="post" onsubmit="return validateRegistration(this)">
<table>
<tr><td>First Name<td><input class="required" type=text placeholder="Enter First Name" name="firstName"/>
<span id="firstNameErrorMessage"></span></tr>
<tr><td>Last Name<td><input class="required" type=text placeholder="Enter Last Name" name="lastName"/>
<span id="lastNameErrorMessage"></span></tr>
<tr><td>Email Id<td><input class="required email" type=text placeholder="Enter Email Id" name="emailId"/>
<span id="emailIdErrorMessage"></span></tr>
<tr><td>Password<td><input class="required" type=password placeholder="Enter Password" name="password"/>
<span id="passwordErrorMessage"></span></tr>
<tr><td>Confirm Password<td><input class="required" type=password placeholder="Enter Confirm Password" name="confirmPassword"/>
<span id="confirmPasswordErrorMessage"></span></tr>
<tr><td>Gender</td>
<td colspan='2' align="center"><input type="radio" name="gender" value="M" checked/>Male
<input type="radio" name="gender" value="F" />Female</td>
<tr><td>Date Of Birth<td colspan='4'>


<select name="day"><option value="Date" selected="selected">Day</option>
		<%for(int x=1;x<=31;x++){%>
			<option value=<%=x%>><%=x %></option>
		<%}%>
</select>

<select name="month">
<option value="Month" selected >Month</option>
<option value="Jan" >Jan</option>
<option value="Feb">Feb</option>
<option value="Mar">Mar</option>
<option value="Apr">Apr</option>
<option value="May">May</option>
<option value="Jun">Jun</option>
<option value="Jul">Jul</option>
<option value="Aug">Aug</option>
<option value="Sep">Sep</option>
<option value="Oct">Oct</option>
<option value="Nov">Nov</option>
<option value="Dec">Dec</option></select>

<select name="year"><option value="Year" selected >Year</option>
		<%for(int y=1980;y<=2014;y++){ %>
			<option value=<%=y%>><%=y %></option>
		<%} %>
</select>
<span id="dateErrorMessage"></span>
<tr><td>Address<td><textarea class="required" rows="3" cols="15" placeholder="Enter Address" name="address"></textarea></td>
<td><span id="addressErrorMessage"></span></tr>
<tr><td>Contact Number<td><input class="required number" type="text" placeholder="Enter Contact Number" name="contactNumber"/>
<span id="contactNumberErrorMessage"></span></tr>
<tr><td>Occupation<td><select name="occupation" class="large">
<option value="Occupation" selected >Occupation</option>
<option value="Student" >Student</option>
<option value="Business" >Business</option>
<option value="Gov">Service</option>
<option value="Other" >Other</option>
</select><span id="occupationErrorMessage"></span></tr>
<tr><td align="center" ><input type="submit" value="Register"/>
<td align="center" ><input type="reset" value="Clear"/></td>
</table>
</form>
</center>
<jsp:include page="mainFooter.jsp"></jsp:include></body>
</html>