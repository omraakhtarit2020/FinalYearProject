<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>TINT Digital Resource Library</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<%@page import="com.marvel.awards.*"%>
	<%@page import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<%
	awardDaw jd = new awardDaw();
	List<awardData> awardData = jd.getAllInfo();
	request.setAttribute("awardData", awardData);
	%>

	
    <div class="container-fluid" style="background-color: #D9B08C; text-align: center;">
            <div class="py-2"><h4><b>Awards and Recognitions (NAAC Clause 3.3.2)</b></h4></div>
    </div>
    
    <div id="alert"></div>
    
	<div class="container btn-toolbar justify-content-between">
		<div>
        	<button type="button" class="btn btn-success mt-4 margl" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-radius: 10px">Add New Field  <b>&nbsp;+</b></button>
    	</div>
		
    
    
        <table class="table table-striped">
            <thead style="background-color:#dbd0b5;">
            <tr style="text-align: center">
                <th>Name of the activity</th>
                <th>Name of the Award/ recognition for Institution</th>
                <th>Name of the Awarding government/ government recognized bodies</th>
                <th>Year of award</th>
                
            </tr>
            </thead>
           <tbody class="text-center" style="">
				<c:forEach items="${awardData}" var="award">
					<tr>
						<td name="awardActivity">${award.getAwardActivity()}</td>
						<td name="awardName">${award.getAwardName()}</td>
						<td name="awardGovBody">${award.getAwardGovBody()}</td>
						<td name="awardYear">${award.getAwardYear()}</td>
						

						
				</c:forEach>
			</tbody>
            
                      
            
           
        </table>

    </div>

    
    
    <form action="awardServlet" id="form" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-center" id="exampleModalLabel">Awards</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Your modal content here -->


						<div class="form-group">

							<label for="awardActivity" class="font-weight-bold mb-0">Name of the 
								Activity: </label>
							<div class="text-danger" id="titleError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="titleError2" style="display: none">Invalid
								Activity</div>
							<input type="text" onkeyup="titleCheck()"
								class="form-control  mb-3" id="awardActivity" name="awardActivity"
								placeholder="Name of the Activity"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
						
								
								<label for="awardName"
								class="font-weight-bold mb-0">Name of the Awards/Recognition: </label>
							<div class="text-danger" id="authorError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="authorError2" style="display: none">Invalid
								Author Name</div>
							<input type="text" onkeyup="authorCheck()"
								class="form-control  mb-3" id="awardName" name="awardName"
								placeholder="Name of the Award"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							
								
								<label for="awardGovBody"
								class="font-weight-bold mb-0">Name of the Awarding Government/Government recognized Bodies:
							</label>
							<div class="text-danger" id="deptError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="deptError2" style="display: none">Invalid
								Author Name</div>
							<input type="text" onkeyup="deptCheck()"
								class="form-control  mb-3" id="awardGovBody" name="awardGovBody"
								placeholder="Government Body"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
							
								 <label for="awardYear"
								class="font-weight-bold mb-0">Award Year </label>
							<div class="text-danger" id="pubError1" style="display: none">This
								field is mandatory</div>
							<div class="text-danger" id="pubError2" style="display: none">Invalid
								Year</div>
							
							<select  class="form-control mb-3" id="awardYear"
								name="awardYear" onfocus="selectYear()"
								style="border-radius: 30px; width: 400px; margin: auto; border: 2px solid;">
								<option value="Select year" selected >Select Year</option>
								
							
							</select> 
							
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
      			<button type="button" class="btn btn-success" id="download">Download</button>
    		</div>
    
  		</div>
  	</div>
	
	<script type="text/javascript">
	function selectYear(){
        var currentYear = new Date().getFullYear();
        var selectElement = document.querySelector('#awardYear');
        var options = "";

        for (var year = currentYear; year >= 1945; year--) {
            options += "<option value='" + year + "'>" + year + "</option>";
        }

        selectElement.innerHTML = options;
    }
	selectYear();
	const awardActivity=document.getElementById("awardActivity");
	
	
	const awardName=document.getElementById("awardName");
	
	const awardGovBody=document.getElementById("awardGovBody");
	
	
	const awardYear=document.getElementById("awardYear");
	
	const submitButton=document.querySelector("#submit");
	const resetButton=document.getElementById("reset");
	const editButton=document.getElementById("edit");
	const form=document.getElementById("form");
	
	
	function addNewField(){
		
		let myModal = new bootstrap.Modal(document.querySelector("#exampleModal"), {});
		myModal.show();
		submitButton.disabled=true;
		awardActivity.value="";
		awardName.value="";
		awardGovBody.value="";
		awardYear.value="";
		submitButton.style.display="block";
		resetButton.style.display="block";
		editButton.style.display="none";
		form.action="awardServlet";
		
	}
	
	
		//functionality of Download button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'awardsDownloadServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	document.getElementById("alert").innerHTML=`
			    		<div class="alert alert-success alert-dismissible fade show" role="alert">
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
		    xhr.send();
		}
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	
</body>
</html>