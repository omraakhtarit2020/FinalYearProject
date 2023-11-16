<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		myDetailsDaw mdw = new myDetailsDaw();
		String user=(String)session.getAttribute("user");
		MyDetailsData userInfo = mdw.getAllInfo(user);
	%>
	<div class="dashboard">
	<div class="card">
	  <h5 class="card-header text-center" style="background:#f78888">Welcome to Dashboard</h5>
	  <div class="card-body" style="height:300px" id="cb">
	<!--  <div class="d-flex justify-content-between">
	     <h5 class="card-title subject"><%=userInfo.getSubject()%></h5>
	    <h5 class="card-title tcs"><%= userInfo.getTcsionId()%></h5>
	  </div> --> 		
	    <p class="card-text"></p>
	  </div>
  </div>
  </div>
</body>
</html>