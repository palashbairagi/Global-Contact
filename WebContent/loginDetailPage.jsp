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
<jsp:include page="setting.jsp" />
<form id="theForm" action="loginDetails.jsp">
<table align="center" style="margin-top: 100px;">
<tr><td>gmailLogin<td><input type="text" placeholder="Enter Gmail User Name" name="gmailLogin" />
<span id="gmailIdErrorMessage"></span></tr>
<tr><td>gmailPassword<td><input type="password" placeholder="Enter Gmail Password" name="gmailPassword" />
<span id="passwordErrorMessage"></span></tr>
<tr><td align="center" ><input type="submit" value="Ok " />
</table>
<jsp:include page="footer.jsp" />
</form>
</body>
</html>