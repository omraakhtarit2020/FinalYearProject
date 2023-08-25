<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
	
	<style>
        .error-text{
            margin: -21px 0px 15px 552px;
            background: #e74c3c;
            color: #fceae8;
            font-size: 10px;
            padding: 8px;
            border-radius: 5px;
            width: 200px;
            text-align: center;
            display: none;
        }
        .error-pass{
            margin: -21px 0px 15px 552px;
            background: #e74c3c;
            color: #fceae8;
            font-size: 10px;
            padding: 8px;
            border-radius: 5px;
            width: 200px;
            text-align: center;
            display: none;
        }
    </style>

<title>TINT Digital Resource Library</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<%@page import="com.marvel.extension.*"%>
	<%@page import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<%
	extensionDaw ed = new extensionDaw();
	List<extensionData> extData = ed.getAllInfo();
	request.setAttribute("extData", extData);
	%>


	<div class="container-fluid"
		style="background-color: #D9B08C; text-align: center;">
		<div class="py-2">
			<h4>
				<b>Extensions & Outreach Programs  (NAAC Clause 3.3.4)</b>
			</h4>
		</div>
	</div>

	<div id="alert"></div>
	<c:if test="${not empty message}">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			${message}
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>

	<div class="container btn-toolbar justify-content-between">
		<div>
			<button type="button" onclick="addNewField()"
				class="btn btn-success mt-4 margl mb-4" data-bs-toggle="modal"
				data-bs-target="#exampleModal" style="border-radius: 10px">
				Add New Field <b>&nbsp;+</b>
			</button>
		</div>

		<table class="table table-striped">
			<thead style="background-color: #dbd0b5;">
				<tr style="text-align: center">
					<th>Extension Activity</th>
					<th>Organising unit/ agency/ collaborating Agency</th>
					<th>Name of the Scheme</th>
					<th>Year of the Activity</th>
					<th>No. of students participated in such activities</th>
				</tr>
			</thead>
			<tbody class="text-center" style="">
				<c:forEach items="${extData}" var="ext">
					<tr>
						<td name="extensionActivity">${ext.getExtensionActivity()}</td>
						<td name="extensionAgency">${ext.getExtensionAgency()}</td>
						<td name="extensionScheme">${ext.getExtensionScheme()}</td>
						<td name="extensionYear">${ext.getExtensionYear()}</td>
					    <td name="extensionNoStudent">${ext.getExtensionNoStudent()}</td>
				</c:forEach>
			</tbody>
		</table>

	</div>


	<form action="extensionServlet" id="form" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-center" id="exampleModalLabel">Extension</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="extensionActivity" class="font-weight-bold mb-0">Extension Activity: </label>
							<div class="text-danger" id="extensionActivityError1" style="display:none">This field is mandatory</div>
							<div class="text-danger" id="extensionActivityError2" style="display:none">Invalid Extension Activity</div>
							<input type="text" onkeyup="extensionActivityCheck()" class="form-control  mb-3" id="extensionActivity" name="extensionActivity"
							placeholder="Extension Activity"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">

							
						
							<label for="extensionAgency" class="font-weight-bold mb-0">Extension Agency: </label>
							<div class="text-danger" id="extensionAgencyError" style="display:none">This field is mandatory</div>
							<input type="text" onkeyup="extensionAgencyCheck()" class="form-control mb-3"
							id="extensionAgency" name="extensionAgency"
							placeholder="Extension Agency"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							
							
							<label for="extensionScheme" class="font-weight-bold mb-0">Extension Scheme: </label>
							<div class="text-danger" id="extensionSchemeError" style="display:none">This field is mandatory</div>
							<input type="text" onkeyup="extensionSchemeCheck()" class="form-control mb-3"
							id="extensionScheme" name="extensionScheme"
							placeholder="Extension Scheme"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							
						
							<label
								for="extensionYear" class="font-weight-bold mb-0">Year Of Extension: </label>
							<select  class="form-control mb-3" id="extensionYear" name="extensionYear" onfocus="selectYear()"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
								<option value="Select year" selected >Select Year</option>
							</select>
							
							<label
								for="extensionNoStudent" class="font-weight-bold mb-0">No. of students participated in such activities: </label>
							<input type="number" onkeyup="extensionNoStudentCheck()" class="form-control mb-3"
							    id="extensionNoStudent" name="extensionNoStudent"
							    placeholder="Extension student"
							    style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<div class="text-danger" id="extensionNoStudentError" style="display:none">This field is mandatory</div>
							<div class="text-danger" id="extensionNoStudentError1" style="display:none">Cannot be negative</div>

                            
						</div>
					</div>
					<div class="modal-footer mx-auto">
						<span><button type="submit" id="submit" class="btn btn-primary">Submit</button></span>
						<span><button type="reset" id="reset" value="reset" class="btn btn-primary">Reset</button></span>
						<span><button type="submit" id="edit" class="btn btn-primary" style="display:none">Edit</button></span>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<div class="container my-2">
		<div class="row justify-content-md-center">

			<div class="col-md-auto">
				<button type="button" class="btn btn-success" id="download">Download</button>
			</div>

		</div>
	</div>
	


	<script type="text/javascript">
	
	function selectYear() {
	    var currentYear = new Date().getFullYear();
	    var selectElement = document.querySelector('#extensionYear');
	    var options = "";

	    for (var year = currentYear; year >= 1945; year--) {
	        options += "<option value='" + year + "'>" + year + "</option>";
	    }

	    selectElement.innerHTML = options;
	}
	selectYear();

	const extensionActivity = document.getElementById("extensionActivity");
	const extensionAgency = document.getElementById("extensionAgency");
	const extensionScheme = document.getElementById("extensionScheme");
	const extensionYear = document.getElementById("extensionYear");
	const extensionNoStudent = document.getElementById("extensionNoStudent");
	const submitButton = document.getElementById("submit");
	const resetButton = document.getElementById("reset");
	const editButton = document.getElementById("edit");
	const form = document.getElementById("form");

	var error = [0, 0, 0, 0];

	function extensionActivityCheck() {
	    let regex = /^[a-zA-Z ]*$/;
	    if (extensionActivity.value.match(regex) && extensionActivity.value !== "") {
	        document.getElementById("extensionActivityError1").style.display = "none";
	        document.getElementById("extensionActivityError2").style.display = "none";
	        error[0] = 1;
	    } else if (extensionActivity.value === "") {
	        document.getElementById("extensionActivityError1").style.display = "block";
	        document.getElementById("extensionActivityError2").style.display = "none";
	        error[0] = 0;
	    } else {
	        document.getElementById("extensionActivityError1").style.display = "none";
	        document.getElementById("extensionActivityError2").style.display = "block";
	        error[0] = 0;
	    }
	    check();
	}

	function extensionAgencyCheck() {
	    if (extensionAgency.value === "") {
	        document.getElementById("extensionAgencyError").style.display = "block";
	        error[1] = 0;
	    } else {
	        document.getElementById("extensionAgencyError").style.display = "none";
	        error[1] = 1;
	    }
	    check();
	}

	function extensionSchemeCheck() {
	    let regex = /^[a-zA-Z ]*$/;
	    if (extensionScheme.value.match(regex) && extensionScheme.value !== "") {
	        document.getElementById("extensionSchemeError").style.display = "none";
	        error[2] = 1;
	    } else if (extensionScheme.value === "") {
	        document.getElementById("extensionSchemeError").style.display = "block";
	        error[2] = 0;
	    } else {
	        document.getElementById("extensionSchemeError").style.display = "none";
	        error[2] = 0;
	    }
	    check();
	}
	
	function extensionNoStudentCheck() {
	    if (extensionNoStudent.value === "") {
	        document.getElementById("extensionNoStudentError").style.display = "block";
	        document.getElementById("extensionNoStudentError1").style.display = "none";
	        error[3] = 0;
	    } else if(extensionNoStudent.value < 0){
	    	document.getElementById("extensionNoStudentError1").style.display = "block";
	    	document.getElementById("extensionNoStudentError").style.display = "none";
	        error[3] = 0;
	    }else {
	        document.getElementById("extensionNoStudentError").style.display = "none";
	        document.getElementById("extensionNoStudentError1").style.display = "none";
	        error[3] = 1;
	    }
	    check();
	}


	function check() {
	    if (error.includes(0)) {
	        submitButton.disabled = true;
	        editButton.disabled = true;
	    } else {
	        submitButton.disabled = false;
	        editButton.disabled = false;
	    }
	}

	function addNewField() {
	    error = [0, 0, 0, 0];
	    let myModal = new bootstrap.Modal(document.querySelector("#exampleModal"), {});
	    myModal.show();
	    submitButton.disabled = true;
	    extensionActivity.value = "";
	    extensionAgency.value = "";
	    extensionScheme.value = "";
	    extensionYear.value = "";
	    extensionNoStudent.value = "";
	    submitButton.style.display = "block";
	    resetButton.style.display = "block";
	    editButton.style.display = "none";
	    form.action = "extensionServlet";
	}

		
		//functionality of Download button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'extensionDownloadServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	if(this.responseText==="0"){
			    		alert("Some Error Occured");
			    	}else{
			    		document.getElementById("alert").innerHTML=`
				    		<div class="alert alert-success alert-dismissible fade show" role="alert">
				      			The file has been saved in Downloads folder.
				  				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    				<span aria-hidden="true">&times;</span>
				  				</button>
							</div>`;
			    	}
			    }
			    else{
			    	alert("Some Error Occured");
			    }
		 	}
		 	
		 	// send the request
		    xhr.send();
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


</body>
</html>