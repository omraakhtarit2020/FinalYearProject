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
     background:#fff;
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
	  <h5 class="card-header text-center" style="background:#f78888">Welcome to Dashboard</h5>
	  <div class="card-body" style="height:300px" id="cb">
	  <div class="d-flex justify-content-between">
	     <h5 class="card-title subject"><%=userInfo.getSubject()%></h5>
	    <h5 class="card-title tcs"><%= userInfo.getTcsionId()%></h5>
	  </div>
	    <p class="card-text"></p>
	  </div>
  </div>
  </div>
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
	const cardTitlesub = document.querySelector(".subject");
	cardTitlesub.textContent = edit;
	
var edit2=`<%= userInfo.getTcsionId()%>`
   edit2= (edit2 ==="null") ? "Tcsion:" : "Tcsion: "+edit2;
   const cardTitleion=document.querySelector(".tcs");
   cardTitleion.textContent = edit2;
  </script>
</body>
</html>
