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
<jsp:include page="message.jsp"></jsp:include>
<h1><b>Compose Message</b></h1>
<form id="theForm" action="afterComposePage.jsp">
<table align="center" style="margin-top: 100px;" >
<tr><td>To<input class="required email" type="text" name="receiverEmailId" /></td></tr>
<tr><td><textarea class="required" rows="5" cols="50" name="message" ></textarea></td></tr>
<tr><td><input type="submit" name="button" value="Send">
<input type="reset" value="Clear" /> 
<input type="submit" name="button" value="Save"></td></tr>
 </table>
</form>
<jsp:include page="/footer.jsp" />
</body>
</html>