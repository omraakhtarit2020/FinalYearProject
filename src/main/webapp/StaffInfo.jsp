<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<title>Staff Information</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	background: rgb(238, 226, 220);
}

.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px;
	border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
	display: block;
}

.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #ccc;
	margin-top: 5px;
	margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
	border-left-color: #fff;
}

.dropdown-submenu.pull-left {
	float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}

#options {
	visibility: hidden;
	position: absolute;
	background-color: #384047;
	box-shadow: 0px 10px 10px 0px rgba(0, 0, 0, 0.4);
	margin-top: 100px;
	margin-left: 13em;
	padding: 10px
}

#options a {
	visibility: hidden;
	color: #fff;
	padding: 10px;
	text-decoration: none;
	padding: 20px 40px;
}

button {
	border: none;
	cursor: pointer;
}

.user-btn {
	border-radius: 50%;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<div class="mx-2alert alert-light" role="alert"
		style="background: rgb(217, 176, 140)">
		<h1 class="text-center" style="color: black">TINT DIGITAL
			RESOURCE LIBRARY</h1>
	</div>
	<nav class="navbar navbar-expand-lg navbar-white bg-dark">
		<img src="1627456522phpRGmWLX.jpeg" width="40" height="40" alt="">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a
					class="nav-link text-white bg-dark" href="index.jsp">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a
					class="nav-link text-white bg-dark" href="help.jsp">Help <span
						class="sr-only">(current)</span></a></li>

				<!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="dropdown-toggle btn text-light" role="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Naac </a>
					<ul class="dropdown-menu multi-level" role="menu"
						aria-labelledby="dropdownMenu">
						<li class="dropdown-submenu"><a class="dropdown-item"
							tabindex="-1" href="#">Reports</a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a href="depSelect.jsp">Staff
										Information</a></li>
							</ul></li>
					</ul></li>
			</ul>


			<span class="form-inline my-2 my-lg-0 px-5 ">
				<p class="my-0 py-0 text-white bg-dark" id="uname"></p>
				&nbsp;&nbsp;&nbsp;
				<button class="user-btn" onmouseover="myFuncHover(event)">
					<img class="rounded-circle mx-2 user-btn" src="user.jpg" width="15"
						height="15" alt="">
				</button>

				<div id="options" onmouseout="myFunHoverOff(event)">
					<a id="opt-atag" role="button">My Details</a>
				</div>
				<button class=" btn btn-light mx-2 " id="signout" href="#">Sign
					Out</button>
			</span>
		</div>
	</nav>

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

	<script>
    const name = `<%=session.getAttribute("user")%>
   		`;
   		let uname = document.getElementById('uname');
   		let welcome = "Welcome " + name;
   		uname.innerHTML += welcome;

   		if (sessionStorage.getItem('user') === null) {
   			window.location = 'login.jsp';
   		}
   		
   		//functionality of signout button
   		let signout = document.getElementById('signout');
   		signout.addEventListener('click', signoutClickHandler)

   		function signoutClickHandler() {
   			sessionStorage.clear();
   			
   			// Instantiate an xhr object
		    let xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('GET', 'LogoutServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	window.location = 'login.jsp';
			    }
			    else{
			    	alert("Some Error Occured");
			    }
		 	}
		 	
		 	// send the request
		    xhr.send();
   			}
   		
   		//functionality of mydetails button
   		let myDetails = document.getElementById('opt-atag');
   		myDetails.addEventListener('click', myDetailsClickHandler)

   		function myDetailsClickHandler() {
   			// Instantiate an xhr object
		    let xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('GET', 'EditServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	if(this.responseText==="1"){
			    		window.location="edit.jsp"
			    	}else
			    		{
			    		window.location = "myDetails.jsp";
			    		}
			    		
			    }
			    else{
			    	alert("Some Error Occured");
			    }
		 	}
		 	
		 	// send the request
		    xhr.send();
   			}

   		
   		function myFuncHover(event){

			let obj=document.querySelector('#options');
			let obj2=obj.querySelector("#opt-atag");
				obj.style.visibility = 'visible';
				obj2.style.visibility = 'visible';
		}
		function myFunHoverOff(evemt){
				let obj=document.querySelector('#options');
				let obj2=obj.querySelector("#opt-atag");
				obj.style.visibility = 'hidden';
				obj2.style.visibility = 'hidden';
		}
</script>

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

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>