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
	<%@ include file="nav.jsp" %>
    <div class="container-fluid" style="background-color: #D9B08C; text-align: center;">
            <div class="py-2"><h4><b>Awards and Recognitions (NAAC Clause 3.3.2)</b></h4></div>
    </div>
    
    <div id="alert"></div>
    
	<div class="container btn-toolbar justify-content-between">
		<div>
        	<button type="button" class="btn btn-success mt-4 margl" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-radius: 10px">Add New Field  <b>&nbsp;+</b></button>
    	</div>
		<div>
			
			<input type="text" class="mt-4 mb-4 mr-1 margr"
				placeholder="Type to Search"
				style="padding: 4.8px; outline: none; border: none; width: 200px; border-radius: 20px;">
			<button type="submit" class="btn btn-dark mt-4 mb-4" style="border-radius: 10px">Search</button>
		</div>
    
    
        <table class="table table-striped">
            <thead style="background-color:#dbd0b5;">
            <tr style="text-align: center">
                <th>Name of the activity</th>
                <th>Name of the Award/ recognition for Institution</th>
                <th>Name of the Awarding government/ government recognised bodies</th>
                <th>Year of award</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>
            <tbody class="text-center" style="">
            <tr>
                <td>John</td>
                <td>Doe</td>
                <td>john@example.com</td>
                <td>2021</td>
                <td style="width:10px">
                	<a class="btn btn-dark" href="" role="button">Edit</a>
                </td>
                <td style="width:10px">
                	<a class="btn btn-dark" href="" role="button">Delete</a>
                </td>
            </tr>
                        <tr>
                <td>John</td>
                <td>Doe</td>
                <td>john@example.com</td>
                <td>100</td>
                <td style="width:10px">
                	<a class="btn btn-dark" href="" role="button">Edit</a>
                </td>
                <td style="width:10px">
                	<a class="btn btn-dark" href="" role="button">Delete</a>
                </td>
            </tr>
            
            </tbody>
        </table>

    </div>

    
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content text-center">
        <div class="modal-header">
          	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <h5><b>Awards and Recognitions</b></h5>
        <div class="modal-body">
            <input type="type" class="form-control" id="Input1" placeholder="Name of the activity" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            <br>
            <input type="type" class="form-control" id="Input1" placeholder="Name of the Award/ recognition for Institution" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            <br>
            <input type="type" class="form-control" id="Input1" placeholder="Name of the Awarding government/ government recognised bodies" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            <br>
            <input type="date" class="form-control" id="Input1" placeholder="Year of award" name="Year of award" value="Year of award" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
        </div>
        <div class="modal-footer mx-auto">
            <span><button type="submit" class="btn btn-primary">Submit</button></span>
            <span><button type="reset" value="reset" class="btn btn-primary">Reset</button></span>
        </div>
      </div>
    </div>
  </div>
  
  <div class="container my-2">
  		<div class="row justify-content-md-center">
    
    		<div class="col-md-auto">
      			<button type="button" class="btn btn-success" id="download">Download</button>
    		</div>
    
  		</div>
  	</div>
	
	<script type="text/javascript">
		//functionality of Download button
		let download = document.getElementById('download');
		download.addEventListener('click', downloadClickHandler);
		
		function downloadClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'AwardsDownloadServlet', true);
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