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
String id=request.getParameter("id");

if(click.equals("Edit")){%>
<jsp:forward page="editContact.jsp">
			<jsp:param name="id" value="<%=id %>" />
 </jsp:forward>
<%}

if(click.equals("View")){%>
<jsp:forward page="viewContact.jsp">
			<jsp:param name="id" value="<%=id %>" />
 </jsp:forward>
<%}

if(click.equals("Delete")){%>
<jsp:forward page="deleteContact.jsp">
			<jsp:param name="id" value="<%=id %>" />
 </jsp:forward>
 <%}

if(click.equals("Send Message")){%>
<jsp:forward page="sendMessageToContact.jsp">
			<jsp:param name="id" value="<%=id %>" />
 </jsp:forward>
<%}

if(click.equals("Send EMail")){%>
<jsp:forward page="sendMailToContact.jsp">
			<jsp:param name="id" value="<%=id %>" />
</jsp:forward>

<%}%>

</body>
</html>