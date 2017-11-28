<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<script language="JavaScript" src="changePassword.js"></script>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
</head>
<body>
<jsp:include page="/header.jsp" />
<jsp:include page="setting.jsp"></jsp:include>
<h1><b>All About Contact Solution</b></h1>
<form id="theForm" action='changePassword.jsp' method="post" >
<table align="center" style="margin-top: 150px;">
 <tr><td>Current Password<td><input type="password" class="required" placeholder="Enter CurrentPassword" name="currentPassword"/>
 <span id="currentPasswordErrorMessage"></span></tr>
 <tr><td>New Password<td><input type="password" class="required" placeholder="Enter NewPassword" name="newPassword"/>
 <span id="newPasswordErrorMessage"></span></tr>
 <tr><td>Confirm Password<td><input type="password" class="required" placeholder="Enter ConfirmPassword" name="confirmPassword"/>
 <span id="confirmPasswordErrorMessage"></span></tr>
<tr><td colspan="2" align="center"> <input type="submit" value="Change"/></td></tr>
</table>
<jsp:include page="/footer.jsp" />
</form>
</body>
</html>