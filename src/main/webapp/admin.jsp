<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.util.*,ProjMyDetails.*"%>
	<%
		myDetailsDaw mdw = new myDetailsDaw();
		String user = (String) session.getAttribute("user");
		MyDetailsData userInfo = mdw.getAllInfo(user);
	%>
	<div class="dashboard">

		<h5 class="card-header text-center" style="background: #f78888">Welcome to Dashboard</h5>
		<div class="d-flex flex-wrap justify-content-between p-5">
			<div class="other areas">
				
			</div>
			<div id="notification-panel" style=" width:30%;min-height:400px;background-color:#ecf286;border-radius:8px; border:2px solid #a8b029;">
				<h4 class="text-center py-3" >Notifications</h4>
			</div>
		</div>	
	  	
	  	
	</div>
</body>
</html>