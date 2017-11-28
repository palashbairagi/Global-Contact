<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jQuery.Validate/1.6/jQuery.Validate.min.js"></script>
<script type="text/javascript" src="validate.js"></script>
</head>
<body>
<center>
<form id="theForm" action="login.jsp" method="post">
<table style="margin-top: 100px; margin-bottom: 100px;">
<tr><td> User Name<td><input class="required email" type="text" placeholder="Enter User Name" name="userName"/>
<span id="userNameErrorMessage"></span></tr>
<tr><td>Password<td> <input class="required" type="password" placeholder="Enter Password" name="password"/>
<span id="passwordErrorMessage"></span></tr>
<tr><td colspan="2" align="center"> <input type="submit" value="Login" class="button"/></td></tr>
</table>
<a href="registrationPage.jsp">Sign Up</a>
</form>
</center>
</body>
</html>