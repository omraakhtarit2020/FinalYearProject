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
	<%@page import="ProjProgram.*"%>
	<%@page import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<%
	ProgramDaw pd = new ProgramDaw();
	List<ProgramData> progData = pd.getAllInfo(0);
	request.setAttribute("progData", progData);
	%>


	<div class="container-fluid"
		style="background-color: #D9B08C; text-align: center;">
		<div class="py-2">
			<h4>
				<b>Journals of Faculty  (NAAC Clause 3.2.1)</b>
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
		<div>

			<input type="text" class="mt-4 mb-4 mr-1 margr"
				placeholder="Type to Search"
				style="padding: 4.8px; outline: none; border: none; width: 200px; border-radius: 20px;">
			<button type="submit" class="btn btn-dark mt-4 mb-4"
				style="border-radius: 10px">Search</button>
		</div>

		<table class="table table-striped">
			<thead style="background-color: #dbd0b5;">
				<tr style="text-align: center">
					<th>Title of the Paper</th>
					<th>Name of the Author/s</th>
					<th>Dept. of the Teacher</th>
					<th>Name of the Journal</th>
					<th>Year of publication</th>
					<th>ISSN no.</th>
					<th colspan=3>Link to the recognition in UGC enlistment of journal/Digital object identifier(doi)no.
					</th>
					<th colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody class="text-center" style="">
				<c:forEach items="${progData}" var="prog">
					<tr>
						<td name="ConductingYear">${prog.getConductingYear()}</td>
						<td name="ProgramName">${prog.getProgramName()}</td>
						<td name="ParticipantsNumber">${prog.getParticipantsNumber()}</td>
						<td name="ConductingDate">${prog.getStartDate()} To ${prog.getEndDate()}</td>
						<c:set var="shortLink" value="${fn:substring(prog.getLink(), 0, 40)}" />
						<td name="Link">${shortLink}</td>
						<td style="width: 10px"><button class="btn btn-dark" href=""
							role="button" onclick="Edit(`${prog.getConductingYear()}`,`${prog.getProgramName()}`,${prog.getParticipantsNumber()},`${prog.getStartDate()}`,`${prog.getEndDate()}`,`${prog.getLink()}`)">Edit</button></td>
						<td style="width: 10px"><a class="btn btn-dark" href="ProgDelete.jsp?pname=${prog.getLink()}"
							role="button">Delete</a></td>
				</c:forEach>
			</tbody>
		</table>

	</div>


	<form action="programServlet" id="form" method="post">
		<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content text-center">
					<div class="modal-header">
						<h5 style:"text-aline=center;">
							<b>Seminars / Workshops / Conferences</b>
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="conductingYear" id="conductingYearLabel" class="font-weight-bold mb-0" style="display: none">Conducting Year: </label>
							<input type="text" class="form-control mb-3" id="conductingYear"
							name="conductingYear" placeholder="Conducting Year"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid; display:none;" readonly>
						
							<label for="programName" class="font-weight-bold mb-0">Name of The Program: </label>
							<div class="text-danger" id="programNameError1" style="display:none">This field is mandatory</div>
							<div class="text-danger" id="programNameError2" style="display:none">Invalid Program Name</div>
							<input type="text" onkeyup="programNameCheck()" class="form-control  mb-3" id="programName"
							name="programName"
							placeholder="Name of the Seminars / Workshops / Conferences"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="programNamePrev" name="programNamePrev" style="display:none">
							
						
							<label for="participantsNumber" class="font-weight-bold mb-0">Number of Participants: </label>
							<div class="text-danger" id="participantsNumberError" style="display:none">This field is mandatory</div>
							<input type="number" onkeyup="participantsNumberCheck()" class="form-control mb-3"
							id="participantsNumber" name="participantsNumber"
							placeholder="Number of participants"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="number" id="participantsNumberPrev" name="participantsNumberPrev" style="display:none">
						
							<label for="conductingDate" class="font-weight-bold mb-0 mx-1">Conducting Dates: </label>
							<div class="text-danger" id="dateError1" style="display:none">This fields are mandatory.</div>
							<div class="text-danger" id="dateError2" style="display:none">End date can not be smaller than Start date.</div>
							<span class="row">
								<label for="" class="font-weight-bold mb-0 ml-5 mr-0 col-2">From:</label>
								<input type="date" onchange="dateCheck()" class="form-control mb-3 ml-0 col-6"
								id="startDate" name="startDate"
								style="border-radius: 30px; width: 200px; margin: auto; border: 2px solid;">
								<input type="date" id="startDatePrev" name="startDatePrev" style="display:none">
							</span>
							<span class="row">
								<label for="" class="font-weight-bold mb-0 ml-5 mr-0 col-2">To:</label>
								<input type="date" onchange="dateCheck()" class="form-control mb-3 ml-0 col-6"
								id="endDate" name="endDate"
								style="border-radius: 30px; width: 200px; margin: auto; border: 2px solid;">
								<input type="date" id="endDatePrev" name="endDatePrev" style="display:none">
							</span>

						
							<label for="link" class="font-weight-bold mb-0">Link to the Activity Report on The Website: </label>
							<div class="text-danger" id="linkError1" style="display:none">This field is mandatory.</div>
							<div class="text-danger" id="linkError2" style="display:none">Invalid Link.</div>
							<input type="text" onkeyup="linkCheck()" class="form-control mb-3" id="link"
							name="link"
							placeholder="Link to the activity report on the website"
							style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							<input type="text" id="linkPrev" name="linkPrev" style="display:none">
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
		
		const conductingYear=document.getElementById("conductingYear");
		const conductingYearLabel=document.getElementById("conductingYearLabel");
		
		const programName=document.getElementById("programName");
		const programNamePrev=document.getElementById("programNamePrev");
		
		const participantsNumber=document.getElementById("participantsNumber");
		const participantsNumberPrev=document.getElementById("participantsNumberPrev");
		
		const startDate=document.getElementById("startDate");
		const startDatePrev=document.getElementById("startDatePrev");
		
		const endDate=document.getElementById("endDate");
		const endDatePrev=document.getElementById("endDatePrev");
		
		const link=document.getElementById("link");
		const linkPrev=document.getElementById("linkPrev");
		
		const submitButton=document.getElementById("submit");
		const resetButton=document.getElementById("reset");
		const editButton=document.getElementById("edit");
		
		const form=document.getElementById("form");
		
		var error = [0,0,0,0,0];
		
		<!-- Constraint for Program name -->
		function programNameCheck(){
			
			let regex = /^[a-zA-Z ]*$/;
			if(programName.value.match(regex) && programName.value != ""){
				document.getElementById("programNameError1").style.display="none";
				document.getElementById("programNameError2").style.display="none";
				error[0]=1;
			} else if(programName.value === ""){
				document.getElementById("programNameError1").style.display="block";
				document.getElementById("programNameError2").style.display="none";
				error[0]=0;
			} else{
				document.getElementById("programNameError1").style.display="none";
				document.getElementById("programNameError2").style.display="block";
				error[0]=0;
			}
			check();
		}
		
		<!-- Constraint for Participants Number -->
		function participantsNumberCheck(){
			
			if(participantsNumber.value === ""){
				document.getElementById("participantsNumberError").style.display="block";
				error[1]=0;
			}else{
				document.getElementById("participantsNumberError").style.display="none";
				error[1]=1;
			}
			check();
		}
		
		<!-- Constraint for Dates -->
		function dateCheck(){
			
			if(startDate.value === "" || endDate.value === ""){
				document.getElementById("dateError1").style.display="block";
				document.getElementById("dateError2").style.display="none";
				error[2]=0;
				error[3]=0;
			}else if(startDate.value>endDate.value && startDate.value != "" && endDate.value != ""){
				document.getElementById("dateError1").style.display="none";
				document.getElementById("dateError2").style.display="block";
				error[2]=0;
				error[3]=0;
			}else{
				document.getElementById("dateError1").style.display="none";
				document.getElementById("dateError2").style.display="none";
				error[2]=1;
				error[3]=1;
			}
			check();
		}
		function endDateCheck(){
			
			if(endDate.value === ""){
				document.getElementById("dateError1").style.display="block";
				document.getElementById("dateError2").style.display="none";
				error[3]=0;
			}else if(startDate.value>endDate.value){
				document.getElementById("dateError1").style.display="none";
				document.getElementById("dateError2").style.display="block";
				error[3]=0;
			}
			else{
				document.getElementById("dateError1").style.display="none";
				document.getElementById("dateError2").style.display="none";
				error[3]=1;
			}
			check();
		}
		
		<!-- Constraint for Link -->
		function linkCheck(){
			
			let regex = /^(http(s):\/\/.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$/;
			if(link.value.match(regex) && link.value != ""){
				document.getElementById("linkError1").style.display="none";
				document.getElementById("linkError2").style.display="none";
				error[4]=1;
			}else if(link.value === ""){
				document.getElementById("linkError1").style.display="block";
				document.getElementById("linkError2").style.display="none";
				error[4]=0;
			}else{
				document.getElementById("linkError1").style.display="none";
				document.getElementById("linkError2").style.display="block";
				error[4]=0;
			}
			check();
		}
		
		function check(){
			if(error.includes(0)){
				submitButton.disabled=true;
				editButton.disabled=true;
			} else{
				submitButton.disabled=false;
				editButton.disabled=false;
			}
		}
		
		//Functionality of Add New Field button
		function addNewField(){
			error = [0,0,0,0,0];
			let myModal = new bootstrap.Modal(document.getElementById('Modal'), {});
			myModal.show();
			submitButton.disabled=true;
			conductingYear.style.display="none";
			conductingYearLabel.style.display="none";
			programName.value="";
			participantsNumber.value="";
			startDate.value="";
			endDate.value="";
			link.value="";
			submitButton.style.display="block";
			resetButton.style.display="block";
			editButton.style.display="none";
			form.action="programServlet";
		}
		
		//Functionality of Edit button & populating Edit form with data from table
		function Edit(conductingYearValue,programNameValue,participantsNumberValue,startDateValue,endDateValue,linkValue){
			error = [1,1,1,1,1];
			let myModal = new bootstrap.Modal(document.getElementById('Modal'), {});
			myModal.show();
			conductingYear.style.display="block";
			conductingYearLabel.style.display="block";
			
			conductingYear.value=conductingYearValue;
			
			programName.value=programNameValue;
			programNamePrev.value=programNameValue;
			
			participantsNumber.value=participantsNumberValue;
			participantsNumberPrev.value=participantsNumberValue;
			
			startDate.value=startDateValue;
			startDatePrev.value=startDateValue;
			
			endDate.value=endDateValue;
			endDatePrev.value=endDateValue;
			
			link.value=linkValue;
			linkPrev.value=linkValue;
			
			submitButton.style.display="none";
			resetButton.style.display="none";
			editButton.style.display="block";
			editButton.disabled=false;
			form.action="ProgramEditServlet";
		}
		//function edit(ConductingYear,ProgramName,ParticipantsNumber,ConductingDate,Link){
		//	console.log(ConductingYear+' '+ProgramName+' '+ParticipantsNumber+' '+ConductingDate+' '+Link);
		//	console.log(1);
			
		//	let myModal = new bootstrap.Modal(document.getElementById('Modal'), {});
		//	myModal.show();
			
		//	document.querySelector("input.conductingYear").value=ConductingYear;
		//	document.querySelector("input.conductingYearPrev").value=ConductingYear;
		//	document.querySelector("input.programName").value=ProgramName;
		//	document.querySelector("input.programNamePrev").value=ProgramName;
		//	document.querySelector("input.participantsNumber").value=ParticipantsNumber;
		//	document.querySelector("input.participantsNumberPrev").value=ParticipantsNumber;
		//	document.querySelector("input.conductingDate").value=ConductingDate;
		//	document.querySelector("input.conductingDatePrev").value=ConductingDate;
		//	document.querySelector("input.link").value=Link;
		//	document.querySelector("input.linkPrev").value=Link;
		//}
	
		//functionality of Download button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'ProgramDownloadServlet', true);
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