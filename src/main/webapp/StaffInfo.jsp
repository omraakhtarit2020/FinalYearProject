<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Informatione</title>
</head>
<body>
	<%@ include file="nav.jsp" %>

	<%@page
		import="StaffInformation.StaffInfoDao,java.util.*,ProjMyDetails.MyDetailsData"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%
	StaffInfoDao stf = new StaffInfoDao();
	String dep = request.getParameter("dep");
	List<MyDetailsData> staffList = stf.getAllInfo(dep);
	request.setAttribute("staffList", staffList);
	%>
	<h1>
		STAFF INFORMATION OF
		<%=dep.toUpperCase()%>
		DEPARTMENT
	</h1>
	<div id="alert"></div>
	<table class="table table-striped">
		<tr>

			<th scope="col">Name</th>
			<th scope="col">Email</th>
			<th scope="col">Alternate Email</th>
			<th scope="col">Phone no.</th>
			<th scope="col">D.O.B</th>
			<th scope="col">Tcsion Id</th>
			<th scope="col">Designation</th>
			<th scope="col">Subject</th>
			<th scope="col">Highest Qualification</th>
			<th scope="col">Any other</th>
			<th scope="col">Teaching Experience (Years)</th>
			<th scope="col">Teaching Methods</th>
			<th scope="col">Technology used for teaching and frequency of
				use</th>
			<th scope="col">Study material developed during last 5 years
				(yes/no)</th>
			<th scope="col">Contributions to enrich quality of teaching</th>
		</tr>
		<c:forEach items="${staffList}" var="staffInfo">
			<tr>

				<td>${staffInfo.getfName()}${" "}${staffInfo.getmName()}${" "}${staffInfo.getlName()}</td>
				<td>${staffInfo.getuName()}</td>
				<td>${staffInfo.getaName()}</td>
				<td>${staffInfo.getPhn()}</td>
				<td>${staffInfo.getudob()}</td>
				<td>${staffInfo.getTcsionId()}</td>
				<td>${staffInfo.getDesignation()}</td>
				<td>${staffInfo.getSubject()}</td>
				<td>${staffInfo.getHighestQualification()}</td>
				<td>${staffInfo.getAnyOther()}</td>
				<td>${staffInfo.getTeachingExp()}</td>
				<td>${staffInfo.getTeachingMethods()}</td>
				<td>${staffInfo.getTechnologyUses()}</td>
				<td>${staffInfo.getSmd()}</td>
				<td>${staffInfo.getCeqt()}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="container my-2">
  		<div class="row justify-content-md-center">
    
    		<div class="col-md-auto">
      			<button type="button" class="btn btn-success" id="download">Download</button>
    		</div>
    
  		</div>
  	</div>

	<script type="text/javascript">
		//functionality of save As button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'DownloadServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	//alert("Downloaded successfully");
			    	document.getElementById("alert").innerHTML=`<div class="alert alert-success alert-dismissible fade show" role="alert">
			      		The file has been saved in Downloads folder.
			  			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    			<span aria-hidden="true">&times;</span>
			  			</button>
				</div>`;
			    }
			    else{
			    	alert("Some Error Occured");
			    }
		 	}
		 	
		 	// send the request
			var dept="dept="+`<%=request.getParameter("dep")%>`
		 	
		    xhr.send(dept);
		}
	</script>
</body>
</html>