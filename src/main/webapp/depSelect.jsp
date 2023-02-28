<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>TINT Digital Resource Library</title>
<title>Linear Gradient-css</title>
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
		<img src="photo_6165537970338247538_m.jpg" width="40" height="40"
			alt="">

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
							</ul>
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
					<a id="opt-atag" href="myDetails.jsp">My Details</a>
				</div> <!-- <div class="dropdown-menu"> -->
				<button class=" btn btn-light mx-2 " id="signout" href="#">Sign
					Out</button> <!-- </div> -->
			</span>
		</div>
	</nav>

	<div style="text-align: center; padding-top: 100px;">
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				data-toggle="dropdown" aria-expanded="false">Select
				Department</button>
			<div class="dropdown-menu">
				<a class="dropdown-item"
					href="StaffInfo.jsp?dep=${'computer science engineering (cse)'}">CSE</a>
				<a class="dropdown-item"
					href="StaffInfo.jsp?dep=${'information technology (it)'}">IT</a> <a
					class="dropdown-item"
					href="StaffInfo.jsp?dep=${'electrical engineering (ee)'}">EE</a> <a
					class="dropdown-item"
					href="StaffInfo.jsp?dep=${'mechanical engineering (me)'}">ME</a> <a
					class="dropdown-item"
					href="StaffInfo.jsp?dep=${'civil engineering (ce)'}">CE</a> <a
					class="dropdown-item"
					href="StaffInfo.jsp?dep=${'electronics and communications engineering (ece)'}">ECE</a>
				<a class="dropdown-item"
					href="StaffInfo.jsp?dep=${'applied electronics & instrumentation engineering (aeie)'}">AEIE</a>
				<a class="dropdown-item"
					href="StaffInfo.jsp?dep=${'bachelor of business education (bbe)'}">BBE</a>
				<a class="dropdown-item"
					href="StaffInfo.jsp?dep=${'bachelor of computer application (bca)'}">BCA</a>
				<a class="dropdown-item"
					href="StaffInfo.jsp?dep=${'Masters of Computer Applications'}">MCA</a>
				<a class="dropdown-item" href="StaffInfo.jsp?dep=${'AI-ML'}">AI-ML</a>
				<a class="dropdown-item" href="StaffInfo.jsp?dep=${'CSBS'}">CSBS</a>
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

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->


</body>
</html>