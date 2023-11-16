<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>TINT Digital Resource Library</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	background: #ececec;
}

.menu-options {
	color: #fff;
	!
	important
}

.menu-options:hover {
	color: #fff;
}

.nav-back {
	background: #5da2d5;
}

.nav-link:hover {
	color: black;
}

.sideways-dropdown {
	position: absolute;
	top: 10px;
	left: 100%;
	display: none;
	float: none;
	min-width: 130px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-top: none;
}

.sideways-dropdown li {
	display: block;
}

.sideways-dropdown li a {
	padding: 5px;
	color: #333;
	text-decoration: none;
	display: block;
}

.sideways-dropdown li:hover {
	background-color: #f5f5f5;
}

.chnage.dropdown-toggle::after {
	display: inline-block;
	transform: rotate(-90deg);
	margin-left: 5px;
	transition: transform 0.3s ease;
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>

	<nav class="navbar navbar-expand-lg nav-back">

		<img src="collegelogo.png" width="40" height="40" alt="">


		<div class="collapse navbar-collapse container-fluid"
			id="navbarNavDropdown">
			<ul class="navbar-nav ">
				<li class="nav-item active"><a class="nav-link menu-options"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle menu-options" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Reports </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="reports.jsp">NACC</a> <a
							class=" dropdown-item dropdown-toggle" role="button"
							data-toggle="dropdown" href="#">Staff Information</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="userInfo.jsp">Basic
									Information</a></li>
							<li><a class="dropdown-item" href="depSelect.jsp">Detailed
									Information</a></li>
						</ul>
					</div></li>

				<!-- <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle menu-options" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
				          Faculty Corner
				        </a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="#">Professional</a>
				          <a class="dropdown-item dropdown-toggle" role="button" data-toggle="dropdown" href="#">Educational</a>
				          <ul class="dropdown-menu">
							  <li><a class="dropdown-item" href="publishBooksInput.jsp">Published Books</a></li>
							  <li><a class="dropdown-item"href="journals.jsp">Journals</a></li>
							</ul>
				          <a class="dropdown-item" href="#">Personal</a>
				        </div>
				      </li> -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle menu-options" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Faculty Corner </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Professional</a> <a
							class="dropdown-item dropdown-toggle chnage" role="button"
							data-toggle="dropdown" href="#">Educational</a>
						<ul class="dropdown-menu sideways-dropdown">
							<li><a class="" href="publishBooksInput.jsp">Published
									Books</a></li>
							<li><a class="" href="journals.jsp">Journals</a></li>
						</ul>
						<a class="dropdown-item" href="#">Personal</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle menu-options" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Institute Corner </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Awards</a> <a
							class="dropdown-item" href="extension.jsp">Extension/Outreach
							Program</a> <a class="dropdown-item" href="#">Collaboration</a> <a
							class="dropdown-item" href="Program">Tech Program</a>
					</div></li>
				<li class="nav-item"><a class="nav-link menu-options" href="">Making
						Committee<span class="sr-only">(current)</span>
				</a></li>
			</ul>

			<div
				class="nav navbar-nav navbar-right d-flex align-items-center justify-content-evenly" style="position:relative;">
				<svg id="notification-bell" class="mx-2" style="cursor: pointer;" width="25px"
					height="25px" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg" stroke="#ffffff">
					<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
					<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
						stroke-linejoin="round"></g>
					<g id="SVGRepo_iconCarrier"> <path
						d="M11.713 7.14977C12.1271 7.13953 12.4545 6.79555 12.4443 6.38146C12.434 5.96738 12.0901 5.63999 11.676 5.65023L11.713 7.14977ZM6.30665 12.193H7.05665C7.05665 12.1874 7.05659 12.1818 7.05646 12.1761L6.30665 12.193ZM6.30665 14.51L6.34575 15.259C6.74423 15.2382 7.05665 14.909 7.05665 14.51H6.30665ZM6.30665 17.6L6.26755 18.349C6.28057 18.3497 6.29361 18.35 6.30665 18.35L6.30665 17.6ZM9.41983 18.35C9.83404 18.35 10.1698 18.0142 10.1698 17.6C10.1698 17.1858 9.83404 16.85 9.41983 16.85V18.35ZM10.9445 6.4C10.9445 6.81421 11.2803 7.15 11.6945 7.15C12.1087 7.15 12.4445 6.81421 12.4445 6.4H10.9445ZM12.4445 4C12.4445 3.58579 12.1087 3.25 11.6945 3.25C11.2803 3.25 10.9445 3.58579 10.9445 4H12.4445ZM11.713 5.65023C11.299 5.63999 10.955 5.96738 10.9447 6.38146C10.9345 6.79555 11.2619 7.13953 11.676 7.14977L11.713 5.65023ZM17.0824 12.193L16.3325 12.1761C16.3324 12.1818 16.3324 12.1874 16.3324 12.193H17.0824ZM17.0824 14.51H16.3324C16.3324 14.909 16.6448 15.2382 17.0433 15.259L17.0824 14.51ZM17.0824 17.6V18.35C17.0954 18.35 17.1084 18.3497 17.1215 18.349L17.0824 17.6ZM13.9692 16.85C13.555 16.85 13.2192 17.1858 13.2192 17.6C13.2192 18.0142 13.555 18.35 13.9692 18.35V16.85ZM10.1688 17.6027C10.1703 17.1885 9.83574 16.8515 9.42153 16.85C9.00732 16.8485 8.67034 17.1831 8.66886 17.5973L10.1688 17.6027ZM10.0848 19.3L10.6322 18.7873L10.6309 18.786L10.0848 19.3ZM13.3023 19.3L12.7561 18.786L12.7549 18.7873L13.3023 19.3ZM14.7182 17.5973C14.7167 17.1831 14.3797 16.8485 13.9655 16.85C13.5513 16.8515 13.2167 17.1885 13.2182 17.6027L14.7182 17.5973ZM9.41788 16.85C9.00366 16.85 8.66788 17.1858 8.66788 17.6C8.66788 18.0142 9.00366 18.35 9.41788 18.35V16.85ZM13.9692 18.35C14.3834 18.35 14.7192 18.0142 14.7192 17.6C14.7192 17.1858 14.3834 16.85 13.9692 16.85V18.35ZM11.676 5.65023C8.198 5.73622 5.47765 8.68931 5.55684 12.2099L7.05646 12.1761C6.99506 9.44664 9.09735 7.21444 11.713 7.14977L11.676 5.65023ZM5.55665 12.193V14.51H7.05665V12.193H5.55665ZM6.26755 13.761C5.0505 13.8246 4.125 14.8488 4.125 16.055H5.625C5.625 15.6136 5.95844 15.2792 6.34575 15.259L6.26755 13.761ZM4.125 16.055C4.125 17.2612 5.0505 18.2854 6.26755 18.349L6.34575 16.851C5.95843 16.8308 5.625 16.4964 5.625 16.055H4.125ZM6.30665 18.35H9.41983V16.85H6.30665V18.35ZM12.4445 6.4V4H10.9445V6.4H12.4445ZM11.676 7.14977C14.2917 7.21444 16.3939 9.44664 16.3325 12.1761L17.8322 12.2099C17.9114 8.68931 15.191 5.73622 11.713 5.65023L11.676 7.14977ZM16.3324 12.193V14.51H17.8324V12.193H16.3324ZM17.0433 15.259C17.4306 15.2792 17.764 15.6136 17.764 16.055H19.264C19.264 14.8488 18.3385 13.8246 17.1215 13.761L17.0433 15.259ZM17.764 16.055C17.764 16.4964 17.4306 16.8308 17.0433 16.851L17.1215 18.349C18.3385 18.2854 19.264 17.2612 19.264 16.055H17.764ZM17.0824 16.85H13.9692V18.35H17.0824V16.85ZM8.66886 17.5973C8.66592 18.4207 8.976 19.2162 9.53861 19.814L10.6309 18.786C10.335 18.4715 10.1673 18.0473 10.1688 17.6027L8.66886 17.5973ZM9.53739 19.8127C10.0977 20.4109 10.8758 20.7529 11.6935 20.7529V19.2529C11.2969 19.2529 10.9132 19.0873 10.6322 18.7873L9.53739 19.8127ZM11.6935 20.7529C12.5113 20.7529 13.2894 20.4109 13.8497 19.8127L12.7549 18.7873C12.4739 19.0873 12.0901 19.2529 11.6935 19.2529V20.7529ZM13.8484 19.814C14.4111 19.2162 14.7211 18.4207 14.7182 17.5973L13.2182 17.6027C13.2198 18.0473 13.0521 18.4715 12.7561 18.786L13.8484 19.814ZM9.41788 18.35H13.9692V16.85H9.41788V18.35Z"
						fill="#ffffff"></path> </g></svg>
				<div id="notification" style="display:none;position:absolute;width:20vw;min-height:100px;border-radius:8px;top:calc(100% + 0px); left:0; z-index:10; background:white;">
				
				</div>
				<p class="text-white mr-3 mt-3" id="uname"></p>
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"> <img
						src="profile_photo.png" width="40" height="40">
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" id="opt-atag" href="myDetails.jsp">My
							Details</a> <a class="dropdown-item" id="signout" href="#">Sign
							Out</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<div class="mx-2alert alert-light" role="alert"
		style="background: #f3d250">
		<h1 class="text-center" style="color: black">MARVEL</h1>
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

		//functionality for signout
		let signout = document.getElementById('signout');
		signout.addEventListener('click', signoutClickHandler)
		function signoutClickHandler() {
			sessionStorage.clear();

			// Instantiate an xhr object
			let xhr = new XMLHttpRequest();

			// USE THIS FOR POST REQUEST
			xhr.open('GET', 'LogoutServlet', true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// What to do when response is ready
			xhr.onload = function() {
				if (this.status === 200) {
					window.location = 'login.jsp';
				} else {
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
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// What to do when response is ready
			xhr.onload = function() {
				if (this.status === 200) {
					if (this.responseText === "1") {
						window.location = "edit.jsp"
					} else {
						window.location = "myDetails.jsp";
					}

				} else {
					alert("Some Error Occured");
				}
			}

			// send the request
			xhr.send();
		}
	</script>
	
	<script type="text/javascript">
		const bell = document.getElementById("notification-bell");
		const newNotification = document.getElementById("notification");
		
		bell.addEventListener('click', ()=>{
			const display = newNotification.style.display=='block'?'none':'block';
			newNotification.style.display=display
		})
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
