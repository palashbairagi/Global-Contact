<%
	if (session.getAttribute("userName") != null && session.getAttribute("password")!=null) {
%>
<%
	response.setHeader("Cache-Control",
				"no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
%>
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
session = request.getSession(false);
String userName = null;
String password=null;
userName=(String)session.getAttribute("userName");
password=(String) session.getAttribute("password");
if(session!=null && userName!=null && password!=null){
	System.out.println(userName);
	session.removeAttribute("userName");
	session.removeAttribute("password");
	session.invalidate(); 
	System.out.println(userName);
}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>