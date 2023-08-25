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
	<%@page import="com.marvel.collaboration.*"%>
	<%@page import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<%
	collabDaw cd = new collabDaw();
	List<collabData> collData = cd.getAllInfo();
	request.setAttribute("collData", collData);
	%>


	<div class="container-fluid"
		style="background-color: #D9B08C; text-align: center;">
		<div class="py-2">
			<h4>
				<b>Collaborations (NAAC Clause 3.4.1)</b>
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
			<button type="button" onclick="addNewField()" class="btn btn-success mt-4 margl"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				style="border-radius: 10px">
				Add New Field <b>&nbsp;+</b>
			</button>
		</div>
		<br>
		<!--div>

			<!--input type="text" class="mt-4 mb-4 mr-1 margr"
				placeholder="Type to Search"
				style="padding: 4.8px; outline: none; border: none; width: 200px; border-radius: 20px;">
			<button type="submit" class="btn btn-dark mt-4 mb-4"
				style="border-radius: 10px">Search</button-->
		</div-->

		<table class="table table-striped">
			<thead style="background-color: #dbd0b5;">
				<tr style="text-align: center">
					<!--th>serial no.</th-->
					<th>Title of the collaborative activity</th>
					<th>Name of the collaboration/ Linking agency with contact details</th>
					<th>Name of the Participant</th>
					<th>Year of collaboration</th>
					<th>Duration</th>
					<th>Link to the relevant document</th>
					<!--th colspan="2">Actions</th-->
				</tr>
			</thead>
			<tbody class="text-center" style="">
				<c:forEach items="${collData}" var="coll">
					<tr>
						<td name="collabactivity">${coll.getCollabactivity()}</td>
						<td name="collabagency">${coll.getCollabagency()}</td>
						<td name="collabparticipant">${coll.getCollabparticipant()}</td>
						<td name="collabyear">${coll.getCollabyear()}</td>
						<td name="collabduration">${coll.getCollabduration()}</td>
						<c:set var="shortLink"
							value="${fn:substring(coll.getCollablink(), 0, 40)}" />
						<td name="collablink">${shortLink}</td>
				</c:forEach>
			</tbody>
		</table>

	</div>


	<form action="collabServlet" id="form" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content text-center">
					<div class="modal-header">
						<h5 style:"text-aline=center;">
							<b>Collaborations</b>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
					
						<div class="form-group">

							<label for="collabactivity" class="font-weight-bold mb-0">Title of the Collaborative Activity </label>
							<div class="text-danger" id="titleError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="titleError2" style="display: none">Invalid
								Title Name</div>
							<input type="text" onkeyup="titleCheck()"
								class="form-control  mb-3" id="collabactivity" name="collabactivity"
								placeholder="Collaborative Activity"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="collabactivityprev" name="collabactivityprev"
								style="display: none"> 
								
								<label for="collabagency"
								class="font-weight-bold mb-0">Name of the Collaborating Agency/
								Linking Agency with contact details </label>
							<div class="text-danger" id="agencyError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="agencyError2" style="display: none">Invalid
								Agency Name</div>
							<input type="text" onkeyup="agencyCheck()"
								class="form-control  mb-3" id="collabagency" name="collabagency"
								placeholder="Agency"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="collabagencyprev" name="collabagencyprev"
								style="display: none"> 
								
								<label for="collabparticipant"
								class="font-weight-bold mb-0">Name of the Participant:
							</label>
							<div class="text-danger" id="participantError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="participantError2" style="display: none">Invalid
								Participant Name</div>
							<input type="text" onkeyup="participantCheck()"
								class="form-control  mb-3" id="collabparticipant" name="collabparticipant"
								placeholder="Name of the Participant"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="collabparticipantprev" name="collabparticipantprev"
								style="display: none">
								
								 <!--label for="collabyear"
								class="font-weight-bold mb-0">Year of Collaboration: </label>
							<div class="text-danger" id="yearError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="yearError2" style="display: none">Invalid
								Year</div>
							<input type="text" onkeyup="yearCheck()"
								class="form-control  mb-3" id="collabyear"
								name="collabyear" placeholder="Year of collaboration"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="collabyearprev"
								name="nameOfJournalprev" style="display: none"--> 
								
								<label
								for="collabyear" class="font-weight-bold mb-0">Year
								Of Collaboration: </label>
							<div class="text-danger" id="dateError1" style="display: none">This
								field is mandatory.</div>
							<div class="text-danger" id="dateError2" style="display: none">Invalid
								Date</div>
							<!--select  class="form-control mb-3" id="collabyear"
								name="collabyear" onfocus="selectYear()"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
								<option value="Select year" selected >Select Year</option>
							</select--> 
							<input type="date"class="form-control mb-3" onkeyup="yearcheck()" id="collabyear"
								name="collabyear" placeholder="Year"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid black;">
							<input type="text" id="collabyearprev"
								name="collabyearprev" style="display:none"> 
								
								
							<label for="collabduration" class="font-weight-bold mb-0">Duration: </label>
							<div class="text-danger" id="durationError" style="display: none">Invalid
							</div>
							<!--input type="text" id="collabduration" name="collabduration" 
							style="display:none"-->
							<!--div class="row"-->
							<div class="col-md-3">
							<input type="text" class="form-control" id="collabduration"
								name="collabduration" placeholder="Duration (eg: 2hr/3days)"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid black;">
								</div>
							<!--<div class="col-md-4">
								<select class="form-select" aria-label="Default select example" id="unitDuration"
								style="border-radius: 30px; width: 100px; margin-right:50px ; border: 2px solid black;">
  									<option selected id="unitDuration">Unit</option>
  									<option value="1" id="">Hours</option>
  									<option value="2" id="">Days</option>
  									<option value="3" id="">Months</option>
  									<option value="4" id="">Years</option>
								</select></div>
							</div-->
							<input type="text" id="collabdurationprev" name="collabdurationprev"
								style="display: none"> 


							<label for="collablink" class="font-weight-bold mb-0">Link to
								the relevant document: </label>
							<div class="text-danger" id="linkError1" style="display: none">This
								field is mandatory.</div>
							<div class="text-danger" id="linkError2" style="display: none">Invalid
								Link.</div>
							<input type="text" onkeyup="linkCheck()"
								class="form-control mb-3" id="collablink" name="collablink"
								placeholder="Link to the activity report on the website"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="collablinkprev" name="collablinkprev"
								style="display: none">
						</div>

					</div>
					<div class="modal-footer mx-auto">
						<span><button type="submit" id="submit" class="btn btn-primary">Submit</button></span>
						<span><button type="reset" id="reset" value="reset" class="btn btn-primary">Reset</button></span>
						<!--span><button type="submit" id="edit" class="btn btn-primary" 
											style="display:none">Edit</button></span-->
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
	
	<script>
	    //const email=document.querySelectorAll(".conductingYear");
	    //const error= document.querySelector(".error-text");
	    //const btn=document.querySelector("button");
	    //let regExp=/^[12][0-9]{3}$;
	    //function check(){
	        //if(email.value.match(regExp)){
	            //email.style.borderColor="#27ae60";
	            //error.style.display="none";
	            //btn.style.display="block";
	        //}else{
	            //email.style.borderColor="#e74c3c";
	            //error.style.display="block";
	            //btn.style.display="none";
	            
	        //}
	        //if(email.value==""){
	            //email.style.borderColor="rgb(32, 18, 93)";
	            //error.style.display="none";
	            //btn.style.display="block";
	        //}
	    //}
	</script>

	<script type="text/javascript">
	
	//function selectOption(){
        //var selectedValue= unitDuration.value;
        //var selectElement = document.querySelector('#unitDuration');
        //var options = "";

        //selectElement.innerHTML = options;
    //}
	//selectOption();
	
		
	const collabactivity=document.getElementById("collabactivity");
	const collabactivityprev=document.getElementById("collabactivityprev");
	
	const collabagency=document.getElementById("collabagency");
	const collabagencyprev=document.getElementById("collabagencyprev");
	
	const collabparticipant=document.getElementById("collabparticipant");
	const collabparticipantprev=document.getElementById("collabparticipantprev");
	
	const collabyear=document.getElementById("collabyear");
	const collabyearprev=document.getElementById("collabyearprev");
	
	const collabduration=document.getElementById("collabduration");
	const collabdurationprev=document.getElementById("collabdurationprev");
	
	//const unitDuration=document.getElementById("unitDuration");
	//let selectedValue = null;
	//const selectedValue=document.getElementById('unitDuration');
	//selectedValue.addEventListener('change',function(){
		//const selectedIndex = selectedValue.selectedIndex;
		//const val = selectedValue.options[selectedIndex].value;
	//})
	
	
	const collablink=document.getElementById("collablink");
	const collablinkprev=document.getElementById("collablinkPrev");
	
	const submitButton=document.querySelector("submit");
	const resetButton=document.getElementById("#reset");
	//const editButton=document.getElementById("edit");
	
	const form=document.getElementById("form");
	
	var error = [0,0,0,0,0];
	
		<!-- Constraint for Program name -->
function titleCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(collabactivity.value.match(regex) && collabactivity.value != ""){
				document.getElementById("titleError1").style.display="none";
				document.getElementById("titleError2").style.display="none";
				error[0]=1;
			} else if(collabactivity.value === ""){
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
     function agencyCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(collabagency.value.match(regex) && collabagency.value != ""){
				document.getElementById("agencyError1").style.display="none";
				document.getElementById("agencyError2").style.display="none";
				error[1]=1;
			} else if(collabagency.value === ""){
				document.getElementById("agencyError1").style.display="block";
				document.getElementById("agencyError2").style.display="none";
				error[1]=0;
			} else{
				document.getElementById("agencyError1").style.display="none";
				document.getElementById("agencyError2").style.display="block";
				error[1]=0;
			}
			check();
		}
     
     <!-- Constraint for department -->
     
     function participantCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(collabparticipant.value.match(regex) && collabparticipant.value != ""){
				document.getElementById("participantError1").style.display="none";
				document.getElementById("participantError2").style.display="none";
				error[2]=1;
			} else if(collabparticipant.value === ""){
				document.getElementById("participantError1").style.display="block";
				document.getElementById("participantError2").style.display="none";
				error[2]=0;
			} else{
				document.getElementById("participantError1").style.display="none";
				document.getElementById("participantError2").style.display="block";
				error[2]=0;
			}
			check();
		}
		
     <!-- Constraint for year of collaboration-->
     function yearCheck(){
     const currentDate = new Date().toISOString().split('T')[0];

      collabyear.addEventListener('input', () => {
       const enteredDate = collabyear.value;
       if (enteredDate > currentDate) {
     	  collabyear.style.borderColor="#e74c3c";
           
           dateError1.style.display="block";
       } else {
     	  collabyear.style.borderColor="#27ae60";
           dateError1.style.display="none";
         collabyear.setCustomValidity('');
         
       }
     });
     }
     //function valueCheck(){
    	 //if(one.checked==true||two.checked==true||three.checked==true||four.checked==true){
    		 //error[3]=0;
    	 //}
    	 //check();
     //}
     
     	//unitDuration.addEventListener("change", function () {
    	//selectedValue = unitDuration.options[unitDuration.selectedIndex].value;
    	//check();
		//});



		
		<!-- Constraint for Link -->
		function linkCheck(){
			
			let regex = /^(http(s):\/\/.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$/;
			if(collablink.value.match(regex) && collablink.value != ""){
				document.getElementById("linkError1").style.display="none";
				document.getElementById("linkError2").style.display="none";
				error[3]=1;
			}else if(collablink.value === ""){
				document.getElementById("linkError1").style.display="block";
				document.getElementById("linkError2").style.display="none";
				error[3]=0;
			}else{
				document.getElementById("linkError1").style.display="none";
				document.getElementById("linkError2").style.display="block";
				error[3]=0;
			}
			check();
		}
		
		 function check() {
		        if (error.every(value => value === 1)) {
		            submitButton.disabled = false; // Enable the submit button
		            //editButton.disabled = false;   // Enable the edit button
		        } else {
		            submitButton.disabled = true;  // Disable the submit button
		            //editButton.disabled = true;    // Disable the edit button
		        }
		    }

		
		//Functionality of Add New Field button
		function addNewField(){
			error = [0,0,0,0,0];
			let myModal = new bootstrap.Modal(document.querySelector("#exampleModal"), {});
			myModal.show();
			submitButton.disabled=true;
			collabactivity.value="";
			collabagency.value="";
			collabparticipant.value="";
			collabyear.value="";
			collabduration.value="";
			//val.value="";
			collablink.value="";
			submitButton.style.display="block";
			resetButton.style.display="block";
			editButton.style.display="none";
			form.action="collabServlet";
			
		}
		
		//Functionality of Edit button & populating Edit form with data from table
		//function Edit(titleValue,authorValue,deptValue,nameValue,yearValue,issnValue,linkValue){
			//error = [1,1,1,1,1,1];
			//let myModal = new bootstrap.Modal(document.querySelector("#exampleModal"), {});
			//myModal.show();
			
			
			//titleOfPaper.value=titleValue;
			//titleOfPaperprev.value=titleValue;
			
			//author.value=authorValue;
			//authorprev.value=authorValue;
			
			//dept.value=deptValue;
			//deptprev.value=deptValue;
			
			//nameOfJournal.value=nameValue;
			//nameOfJournalprev.value=nameValue;
			
			//yearOfPublication.value=yearValue;
			//yearOfPublicationprev.value=yearValue;
			
			//issn.value=issnValue;
			//issnprev.value=issnValue;
			
			//link.value=linkValue;
			//linkprev.value=linkValue;
			
			//submitButton.style.display="none";
			//resetButton.style.display="none";
			//editButton.style.display="block";
			//editButton.disabled=false;
			//form.action="journalEditServlet";
		//}
	
		//functionality of Download button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'collabDownloadServlet', true);
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