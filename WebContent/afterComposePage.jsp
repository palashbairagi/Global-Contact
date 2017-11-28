<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
		<link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen" />
</head>
<body>
<% 
String click=request.getParameter("button");
String receiverEmailId=request.getParameter("receiverEmailId");
String message=request.getParameter("message");

if(click.equals("Send"))
{%>
<jsp:forward page="send.jsp">
			<jsp:param name="receiverEmailId" value="<%=receiverEmailId %>" />
            <jsp:param name="message" value="<%=message %>" />
 </jsp:forward>
          
	<%}
else
{%>
<jsp:forward page="saveMessageToDraft.jsp">
			<jsp:param name="receiverEmailId" value="<%=receiverEmailId %>" />
            <jsp:param name="message" value="<%=message %>" />
</jsp:forward>	
<%}%>

</body>
</html>