<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String click=request.getParameter("button");
String receiverEmailId=request.getParameter("receiverEmailId");
String message=request.getParameter("message");
String dateOfMessage=request.getParameter("dateOfMessage");

if(click.equals("Delete"))
{%>
<jsp:forward page="deleteDraftMessage.jsp">
			<jsp:param name="receiverEmailId" value="<%=receiverEmailId %>" ></jsp:param>
            <jsp:param name="message" value="<%=message %>"></jsp:param>
            <jsp:param name="dateOfMessage" value="<%=dateOfMessage %>" ></jsp:param>
 </jsp:forward>
          
	<%}
if(click.equals("Edit"))
{%>
<jsp:forward page="editDraft.jsp">
			<jsp:param name="receiverEmailId" value="<%=receiverEmailId %>" ></jsp:param>
            <jsp:param name="message" value="<%=message %>"></jsp:param>
			<jsp:param name="dateOfMessage" value="<%=dateOfMessage %>" ></jsp:param>
</jsp:forward>	
<%}
if(click.equals("Send"))
{%>
<jsp:forward page="sendMessageFromDraft.jsp">
			<jsp:param name="receiverEmailId" value="<%=receiverEmailId %>" ></jsp:param>
            <jsp:param name="message" value="<%=message %>" ></jsp:param>
            <jsp:param name="dateOfMessage" value="<%=dateOfMessage %>" ></jsp:param>
</jsp:forward>	
<%}%>

</body>
</html>