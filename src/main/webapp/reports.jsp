<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="nav.jsp" %>
	
	<h2 class="text-center my-2">REPORTS</h2>
	<div id="alert"></div>
	
	<div class="row m-3">
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause 3.2.2</p>
        			<h5 class="card-title"> Published Books</h5>
        			<p class="card-text">Click the below button to download last 5 years data.</p>
        			<div class="text-center">
        				<a href="PublishBook.jsp" class="btn btn-outline-primary mr-2">View</a>
        				<a onclick="publishedBooksDownload()" class="btn btn-outline-success">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause 3.2.1</p>
        			<h5 class="card-title">Journals of Faculty</h5>
        			<p class="card-text">Click the below button to download last 5 years data.</p>
        			<div class="text-center">
        				<a href="#" class="btn btn-outline-primary mr-2">View</a>
        				<a href="#" class="btn btn-outline-success">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause</p>
        			<h5 class="card-title">Staff Information</h5>
        			<p class="card-text mb-0">Click the below button to download staff info.</p>
        			<div class="text-center">
	                    <div class="w-100 p-3 mt-0">
	                        <select class="form-select btn border border-info text-info pt-0" name="dept" id="dept">
	                            <option selected value="">Select dept.</option>
	                            <option value="">CSE</option>
	                            <option value="">IT</option>
	                            <option value="">EE</option>
	                            <option value="">ME</option>
	                            <option value="">CE</option>
	                            <option value="">ECE</option>
	                            <option value="">AEIE</option>
	                            <option value="">BBE</option>
	                            <option value="">BCA</option>
	                            <option value="">MCA</option>
	                            <option value="">AI-ML</option>
	                            <option value="">CSBS</option>
	                    	</select>
	                    </div>
        				<a href="#" class="btn btn-outline-primary mr-2 pt-0">View</a>
        				<a href="#" class="btn btn-outline-success pt-0">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause 3.3.2</p>
        			<h5 class="card-title">Awards</h5>
        			<p class="card-text">Click the below button to download last 5 years data.</p>
        			<div class="text-center">
        				<a href="#" class="btn btn-outline-primary mr-2">View</a>
        				<a href="#" class="btn btn-outline-success">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause 3.4.1</p>
        			<h5 class="card-title">Collaboration</h5>
        			<p class="card-text">Click the below button to download last 5 years data.</p>
        			<div class="text-center">
        				<a href="#" class="btn btn-outline-primary mr-2">View</a>
        				<a href="#" class="btn btn-outline-success">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause 3.3.4</p>
        			<h5 class="card-title">Extension/Outreach Program</h5>
        			<p class="card-text">Click the below button to download last 5 years data.</p>
        			<div class="text-center">
        				<a href="#" class="btn btn-outline-primary mr-2">View</a>
        				<a href="#" class="btn btn-outline-success">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card" style="border-radius: 10px; height:240px;">
      			<div class="card-body">
      				<p class="mb-0">NAAC Clause 3.1.3</p>
        			<h5 class="card-title">Tech Programs</h5>
        			<p class="card-text">Click the below button to download last 5 years data.</p>
        			<div class="text-center">
        				<a href="Program.jsp" class="btn btn-outline-primary mr-2">View</a>
        				<a onclick="programDownload()" class="btn btn-outline-success">Download</a>
        			</div>
      			</div>
    		</div>
  		</div>
	</div>
	
	<script type="text/javascript">
	const alert=document.getElementById("alert");
	function programDownload(){
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
		    		alert.innerHTML=`
			    		<div class="alert alert-success alert-dismissible fade show" role="alert">
			      			The details of Tech Programs has been saved in Downloads folder.
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
	
	function publishedBooksDownload(){
		// Instantiate an xhr object
	    const xhr = new XMLHttpRequest();
		
	 	// USE THIS FOR POST REQUEST
	    xhr.open('POST', 'PublishedBooksDownloadServlet', true);
	    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	    
	 	// What to do when response is ready
	    xhr.onload = function (){
		    if(this.status === 200){
		    	if(this.responseText==="0"){
		    		alert("Some Error Occured");
		    	}else{
		    		alert.innerHTML=`
			    		<div class="alert alert-success alert-dismissible fade show" role="alert">
			      			The details of Published Books has been saved in Downloads folder.
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
	
</body>
</html>