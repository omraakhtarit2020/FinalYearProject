<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>TINT Digital Resource Library</title>
    <title> Linear Gradient-css</title>
    <style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background:rgb(238,226,220);
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
    </style>
  </head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>
 <div class="mx-2alert alert-light" role="alert" style="background:rgb(217,176,140)">
        <h1 class="text-center" style="color:black">TINT DIGITAL RESOURCE LIBRARY</h1>
      </div>
    <nav class="navbar navbar-expand-lg navbar-white bg-dark">
        <!-- <a class="navbar-brand" href="#">Navbar</a> -->
        <img src="1627456522phpRGmWLX.jpeg" width="40" height="40" alt="">
        <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button> -->
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <!-- <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="#">Welcome <span class="sr-only">(current)</span></a>
              </li> -->
            <li class="nav-item active">
              <a class="nav-link text-white bg-dark" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <!--  <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="naac.jsp">NAAC <span class="sr-only">(current)</span></a>
              </li>-->
              <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="help.jsp">Help <span class="sr-only">(current)</span></a>
              </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li> -->
            
            
            <!--   <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-white bg dark" href="#" role="button" data-toggle="dropdown" aria-expanded="false">Dropdown</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item href="" role="button" data-toggle="dropdown" aria-expanded="false"" >Item</a></li>
                <li><a class="dropdown-item href="" role="button" data-toggle="dropdown" aria-expanded="false"">Reports &raquo;</a></li>
                	<ul class="dropdown-menu submenu">
                	<li><a href="#" class="dropdown-item">Other Information</a></li>
                	<li><a href="#" class="dropdown-item" href="#" role="button" data-toggle="dropdown" aria-expanded="false">Staff Information &raquo;</a></li>
                		<ul class="dropdown-menu submenu">
                			<li><a href="" class="dropdown-item">CSE</a></li>
                			<li><a href="" class="dropdown-item">IT</a></li>
                			<li><a href="" class="dropdown-item">CIVIL</a></li>
                			<li><a href="" class="dropdown-item">EE</a></li>
                			<li><a href="" class="dropdown-item">AEIE</a></li>
                			<li><a href="" class="dropdown-item">BBA</a></li>
                			<li><a href="" class="dropdown-item">BCA</a></li>
                		</ul>		
              		</ul>
              </ul>
            </li>--> 
   <!-- Dropdown -->
        <li class="nav-item dropdown">
          <a class="dropdown-toggle btn text-light" role="button" id="dropdownMenu1" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            Naac
          </a>
          <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
            <!-- <li class="dropdown-item"><a href="#">Some action</a></li>
              <li class="dropdown-item"><a href="#">Some other action</a></li> -->
            <!-- <li class="dropdown-divider"></li> -->
            <li class="dropdown-submenu">
              <a class="dropdown-item" tabindex="-1" href="#">Reports</a>
              <ul class="dropdown-menu">
                <!-- <li class="dropdown-item"><a tabindex="-1" href="#">Second level</a></li> -->
                <li class="dropdown-submenu">
                  <a class="dropdown-item" href="#">Staff Information</a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="#">CSE</a></li>
                    <li class="dropdown-item"><a href="#">IT</a></li>
                    <li class="dropdown-item"><a href="#">EE</a></li>
                    <li class="dropdown-item"><a href="#">ME</a></li>
                    <li class="dropdown-item"><a href="#">CE</a></li>
                  </ul>
                </li>
                <!-- <li class="dropdown-item"><a href="#">Second level</a></li>
                  <li class="dropdown-item"><a href="#">Second level</a></li> -->
              </ul>
            </li>
          </ul>
        </li>
            </ul>
            
            
            <span class="form-inline my-2 my-lg-0 px-5 ">
            <!-- <div class="dropdown"> -->
             <!-- <a class="btn btn-secondary dropdown-toogle"  type="button" data-toggle="dropdown" aria-expanded="false">  -->
              <p class="my-0 py-0 text-white bg-dark" id="uname"></p>
            <img class="rounded-circle mx-2" src="pngtree-user-vector-icon-with-white-background-png-image_1849343.jpg" width="15" height="15" alt=""></a>
            <!-- <div class="dropdown-menu"> -->
                <button class=" btn btn-light mx-2 " id="signout" href="#">Sign Out</button>
              <!-- </div> -->
            </span>
          
          <!-- <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form> -->
        </div>
      </nav>
      <p>
        welcome to home page
      </p>

<script>
const name = `<%=session.getAttribute("user")%>`;
let uname = document.getElementById('uname');
let welcome="Welcome "+name;
uname.innerHTML += welcome;

if(sessionStorage.getItem('user')===null){
	window.location='login.jsp';
}

let signout = document.getElementById('signout');
signout.addEventListener('click', signoutClickHandler)

function signoutClickHandler(){
	sessionStorage.clear();
	window.location='login.jsp';
}
</script>


<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    
</body>
</html>