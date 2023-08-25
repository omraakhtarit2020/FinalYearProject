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
	<%@page import="com.marvel.journals.*"%>
	<%
	journalsDaw pd = new journalsDaw();
	String issn = request.getParameter("issn");
	pd.delete(issn);
	response.sendRedirect("journals.jsp");
	%>
</body>
</html>