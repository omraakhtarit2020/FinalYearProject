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
.error-text {
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

.error-pass {
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
	<%@page import="com.marvel.journals.*"%>
	<%@page import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<%
	journalsDaw jd = new journalsDaw();
	List<journalData> jourData = jd.getAllInfo();
	request.setAttribute("jourData", jourData);
	%>


	<div class="container-fluid"
		style="background-color: #DFCCFB; text-align: center;">
		<div class="py-2">
			<h4>
				<b>Journals of Faculty (NAAC Clause 3.2.1)</b>
			</h4>
		</div>
	</div>

	<div id="alert"></div>
	<c:if test="${not empty message}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			${message}
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>

	<div class="container btn-toolbar justify-content-between">
		<div>
			<button type="button" onclick="addNewField()"
				class="btn btn-success mt-4 margl" data-bs-toggle="modal"
				data-bs-target="#exampleModal" style="border-radius: 10px">
				Add New Field <b>&nbsp;+</b>
			</button>
		</div>


		<div>

			<input type="text" class="mt-4 mb-4 mr-1 margr"
				placeholder="Type to Search"
				style="padding: 4.8px; outline: none; border: none; width: 200px; border-radius: 20px;">
			<button type="submit" class="btn btn-dark mt-4 mb-4"
				style="border-radius: 10px">Search</button>
		</div>

		<table class="table table-striped">
			<thead style="background-color: #14a098;">
				<tr style="text-align: center">
					<th>Title of the Paper</th>
					<th>Name of the Author/s</th>
					<th>Dept. of the Teacher</th>
					<th>Name of the Journal</th>
					<th>Year of publication</th>
					<th>ISSN no.</th>
					<th colspan=3>Link to the recognition in UGC enlistment of
						journal/Digital object identifier(doi)no.</th>
					<!-- <th colspan="2">Actions</th> -->
				</tr>
			</thead>
			<tbody class="text-center" style="">
				<c:forEach items="${jourData}" var="jour">
					<tr>
						<td name="titleOfPpaer">${jour.getTitleOfPaper()}</td>
						<td name="author">${jour.getAuthor()}</td>
						<td name="dept">${jour.getDept()}</td>
						<td name="nameOfPublication">${jour.getNameOfJournal()}</td>
						<td name="yearOfPublication">${jour.getYearOfPublication()}</td>
						<td name="issn">${jour.getIssn()}</td>
						<c:set var="shortLink"
							value="${fn:substring(jour.getLink(), 0, 40)}" />
						<td name="Link">${shortLink}</td>
						<td style="width: 10px"><button class="btn btn-dark"
								role="button" style="display: none"
						onclick="Edit(
						    `${jour.getTitleOfPaper()}`,
						    `${jour.getAuthor()}`,
						    ${jour.getDept()},
						    `${jour.getNameOfJournal()}`,
						    `${jour.getYearOfPublication()}`,
						    `${jour.getIssn()}`,
						    `${jour.getLink()}`
						)">Edit</button></td>
						<td style="width: 10px"><a class="btn btn-dark"
							href="JournalDelete.jsp?pname=${jour.getIssn()}" style="display: none" role="button">Delete</a></td>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<!-- Add the Bootstrap Modal HTML code -->
	<form action="journalServlet" id="form" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-center" id="exampleModalLabel">Journals</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Your modal content here -->


						<div class="form-group">

							<label for="titleOfPaper" class="font-weight-bold mb-0">Title
								Of Paper: </label>
							<div class="text-danger" id="titleError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="titleError2" style="display: none">Invalid
								Title Name</div>
							<input type="text" onkeyup="titleCheck()"
								class="form-control  mb-3" id="titleOfPaper" name="titleOfPaper"
								placeholder="Title of the Paper"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="titleOfPaperprev" name="titleOfPaperprev"
								style="display: none"> 
								
								<label for="author"
								class="font-weight-bold mb-0">Author: </label>
							<div class="text-danger" id="authorError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="authorError2" style="display: none">Invalid
								Author Name</div>
							<input type="text" onkeyup="authorCheck()"
								class="form-control  mb-3" id="author" name="author"
								placeholder="Author"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="authorprev" name="authorprev"
								style="display: none"> 
								
								<label for="dept"
								class="font-weight-bold mb-0">Department of the Author:
							</label>
							<div class="text-danger" id="deptError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="deptError2" style="display: none">Invalid
								Author Name</div>
							<input type="text" onkeyup="deptCheck()"
								class="form-control  mb-3" id="dept" name="dept"
								placeholder="Department of the Author"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="deptprev" name="deptprev"
								style="display: none">
								
								 <label for="nameOfJournal"
								class="font-weight-bold mb-0">Name of the Journal: </label>
							<div class="text-danger" id="pubError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="pubError2" style="display: none">Invalid
								Name</div>
							<input type="text" onkeyup="pubCheck()"
								class="form-control  mb-3" id="nameOfJournal"
								name="nameOfJournal" placeholder="Name of the Journal"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="nameOfJournalprev"
								name="nameOfJournalprev" style="display: none"> 
								
								<label
								for="yearOfPublication" class="font-weight-bold mb-0">Year
								Of Publication: </label>
							<div class="text-danger" id="dateError1" style="display: none">This
								fields are mandatory.</div>
							<div class="text-danger" id="dateError2" style="display: none">Invalid
								Date</div>
							<select  class="form-control mb-3" id="yearOfPublication"
								name="yearOfPublication" onfocus="selectYear()"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
								<option value="Select year" selected >Select Year</option>
								
							
							</select> 
							<input type="text" id="yearOfPublicationprev"
								name="yearOfPublicationprev" style="display:none"> 
								
								
								<label for="issn"
								id="issnlabel" class="font-weight-bold mb-0">ISSN Number
								Of The Journal: </label>
							<div class="text-danger" id="issnError" style="display: none">Invalid
								Input</div>
							<input type="text" id="issnprev" name="issnprev"
								style="display: none"> <input type="text"
								class="form-control mb-3" onkeyup="ISSNcheck()" id="issn"
								name="issn" placeholder="ISSN Number Of The journal"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid black;">


							<label for="link" class="font-weight-bold mb-0">Link to
								the Activity Report on The Website: </label>
							<div class="text-danger" id="linkError1" style="display: none">This
								field is mandatory.</div>
							<div class="text-danger" id="linkError2" style="display: none">Invalid
								Link.</div>
							<input type="text" onkeyup="linkCheck()"
								class="form-control mb-3" id="link" name="link"
								placeholder="Link to the activity report on the website"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="linkprev" name="linkprev"
								style="display: none">
						</div>


					</div>
					<div class="modal-footer">
						<span><button type="submit" id="submit"
								class="btn btn-primary">Submit</button></span> <span><button
								type="reset" id="reset" value="reset" class="btn btn-primary">Reset</button></span>
						<span><button type="submit" id="edit"
								class="btn btn-primary" style="display: none">Edit</button></span>
					</div>
				</div>
			</div>
		</div>

	</form>



	<div class="container my-2">
		<div class="row justify-content-md-center">

			<div class="col-md-auto">
				<button type="button" class="btn text-white" style="background-color: #0f292f" id="download">Download</button>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		
	
			function selectYear(){
		        var currentYear = new Date().getFullYear();
		        var selectElement = document.querySelector('#yearOfPublication');
		        var options = "";
		
		        for (var year = currentYear; year >= 1945; year--) {
		            options += "<option value='" + year + "'>" + year + "</option>";
		        }
		
		        selectElement.innerHTML = options;
		    }
			selectYear();
				
		const titleOfPaper=document.getElementById("titleOfPaper");
		const titleOfPaperprev=document.getElementById("titleOfPaperprev");
		
		const author=document.getElementById("author");
		const authorprev=document.getElementById("authorprev");
		
		const dept=document.getElementById("dept");
		const deptprev=document.getElementById("deptprev");
		
		const nameOfJournal=document.getElementById("nameOfJournal");
		const nameOfJournalprev=document.getElementById("nameOfJournalprev");
		
		const yearOfPublication=document.getElementById("yearOfPublication");
		const yearOfPublicationprev=document.getElementById("yearOfPublicationprev");
		
		const issn=document.getElementById("issn");
		const issnprev=document.getElementById("issnprev");
		
		const link=document.getElementById("link");
		const linkprev=document.getElementById("linkPrev");
		
		const submitButton=document.querySelector("#submit");
		const resetButton=document.getElementById("reset");
		const editButton=document.getElementById("edit");
		
		const form=document.getElementById("form");
		
		var error = [0,0,0,0,0,0];
		
		<!-- Constraint for title of paper -->
		function titleCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(titleOfPaper.value.match(regex) && titleOfPaper.value != ""){
				document.getElementById("titleError1").style.display="none";
				document.getElementById("titleError2").style.display="none";
				error[0]=1;
			} else if(titleOfPaper.value === ""){
				document.getElementById("titleError1").style.display="block";
				document.getElementById("titleError2").style.display="none";
				error[0]=0;
			} else{
				document.getElementById("titleError1").style.display="none";
				document.getElementById("titleError2").style.display="block";
				error[0]=0;
			}
			check();
		}
		
		<!-- Constraint for author name -->
     function authorCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(author.value.match(regex) && author.value != ""){
				document.getElementById("authorError1").style.display="none";
				document.getElementById("authorError2").style.display="none";
				error[1]=1;
			} else if(author.value === ""){
				document.getElementById("authorError1").style.display="block";
				document.getElementById("authorError2").style.display="none";
				error[1]=0;
			} else{
				document.getElementById("authorError1").style.display="none";
				document.getElementById("authorError2").style.display="block";
				error[1]=0;
			}
			check();
		}
     
     <!-- Constraint for department -->
     
     function deptCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(dept.value.match(regex) && dept.value != ""){
				document.getElementById("deptError1").style.display="none";
				document.getElementById("deptError2").style.display="none";
				error[2]=1;
			} else if(dept.value === ""){
				document.getElementById("deptError1").style.display="block";
				document.getElementById("deptError2").style.display="none";
				error[2]=0;
			} else{
				document.getElementById("deptError1").style.display="none";
				document.getElementById("deptError2").style.display="block";
				error[2]=0;
			}
			check();
		}
		
     <!-- Constraint for name of journal  -->
      function pubCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(nameOfJournal.value.match(regex) && nameOfJournal.value != ""){
				document.getElementById("pubError1").style.display="none";
				document.getElementById("pubError2").style.display="none";
				error[3]=1;
			} else if(nameOfJournal.value === ""){
				document.getElementById("pubError1").style.display="block";
				document.getElementById("pubError2").style.display="none";
				error[3]=0;
			} else{
				document.getElementById("pubError1").style.display="none";
				document.getElementById("pubError2").style.display="block";
				error[3]=0;
			}
			check();
		}
  

		
		function ISSNcheck(){
			regex = new RegExp(/^(?=(?:[^0-9]*[0-9]){10}(?:(?:[^0-9]*[0-9]){3})?$)[\d-]+$/);
			if(regex.test(issn.value) & issn.value!=""){
				error[4]=1;
				issnError.style.display="none";
			}else{
				error[4]=0;
				issnError.style.display="block";
			}
			check();
		}
		
		<!-- Constraint for Link -->
		function linkCheck(){
			
			let regex = /^(http(s):\/\/.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$/;
			if(link.value.match(regex) && link.value != ""){
				document.getElementById("linkError1").style.display="none";
				document.getElementById("linkError2").style.display="none";
				error[5]=1;
			}else if(link.value === ""){
				document.getElementById("linkError1").style.display="block";
				document.getElementById("linkError2").style.display="none";
				error[5]=0;
			}else{
				document.getElementById("linkError1").style.display="none";
				document.getElementById("linkError2").style.display="block";
				error[5]=0;
			}
			check();
		}
		
		 function check() {
		        if (error.every(value => value === 1)) {
		            submitButton.disabled = false; // Enable the submit button
		            editButton.disabled = false;   // Enable the edit button
		        } else {
		            submitButton.disabled = true;  // Disable the submit button
		            editButton.disabled = true;    // Disable the edit button
		        }
		    }

		
		//Functionality of Add New Field button
		function addNewField(){
			error = [0,0,0,0,0,0];
			let myModal = new bootstrap.Modal(document.querySelector("#exampleModal"), {});
			myModal.show();
			submitButton.disabled=true;
			titleOfPaper.value="";
			author.value="";
			dept.value="";
			nameOfJournal.value="";
			yearOfPublication.value="";
			issn.value="";
			link.value="";
			submitButton.style.display="block";
			resetButton.style.display="block";
			editButton.style.display="none";
			form.action="journalServlet";
			
		}
		
		//Functionality of Edit button & populating Edit form with data from table
		function Edit(titleValue,authorValue,deptValue,nameValue,yearValue,issnValue,linkValue){
			error = [1,1,1,1,1,1];
			let myModal = new bootstrap.Modal(document.querySelector("#exampleModal"), {});
			myModal.show();
			
			
			titleOfPaper.value=titleValue;
			titleOfPaperprev.value=titleValue;
			
			author.value=authorValue;
			authorprev.value=authorValue;
			
			dept.value=deptValue;
			deptprev.value=deptValue;
			
			nameOfJournal.value=nameValue;
			nameOfJournalprev.value=nameValue;
			
			yearOfPublication.value=yearValue;
			yearOfPublicationprev.value=yearValue;
			
			issn.value=issnValue;
			issnprev.value=issnValue;
			
			link.value=linkValue;
			linkprev.value=linkValue;
			
			submitButton.style.display="none";
			resetButton.style.display="none";
			editButton.style.display="block";
			editButton.disabled=false;
			form.action="journalEditServlet";
		}
	
		//functionality of Download button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'journalDownloadServlet', true);
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