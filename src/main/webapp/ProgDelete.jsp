<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TINT Digital Resource Library</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<%@page import="com.marvel.program.*"%>
	<%
	ProgramDaw pd = new ProgramDaw();
	String pname = request.getParameter("pname");
	pd.delete(pname);
	response.sendRedirect("Program.jsp");
	%>
</body>
</html>