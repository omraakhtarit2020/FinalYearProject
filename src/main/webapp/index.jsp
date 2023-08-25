<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TINT Digital Resource Library</title>
<style>
  .dashboard{
     margin-top:7%;
     margin-left:20%; 
     width:60%;
  }
</style>
</head>
<body>
	<%@ include file="nav.jsp" %>
	<%@page
		import="java.util.*,ProjMyDetails.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%
	myDetailsDaw mdw = new myDetailsDaw();
	String user=(String)session.getAttribute("user");
	MyDetailsData userInfo = mdw.getAllInfo(user);
	%>
	<!-- <p class="text-center">welcome to home page</p> -->
	<div class="dashboard">
	<div class="card">
	  <h5 class="card-header text-center">Welcome to home page</h5>
	  <div class="card-body" style="height:300px" id="cb">
	    <h5 class="card-title text-center"><%=userInfo.getSubject()%></h5>
	    <p class="card-text"></p>
	  </div>
  </div>
  </div>
	<!-- <div >
	<h1 class="text-center" id="depart">
		<%=userInfo.getSubject()%>
	</h1>
	<div> -->
   
  
  <script>
  //var edit="";
  //const sub=document.querySelector("#cb");
  //if(edit==null){
	//  function hideElement() {
		//  sub.style.display = "none";
		//}
  //}
  var edit = `<%= userInfo.getSubject() %>`;
	edit = (edit === "null") ? "Department:" : "Department: " + edit;

	// Now, you can set the card title with the updated value
	const cardTitle = document.querySelector(".card-title");
	cardTitle.textContent = edit;
  </script>
</body>
</html>