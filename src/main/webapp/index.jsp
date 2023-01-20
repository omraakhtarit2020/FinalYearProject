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
        <img src="photo_6165537970338247538_m.jpg" width="40" height="40" alt="">
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
            <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="naac.html">NAAC <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="help.html">Help <span class="sr-only">(current)</span></a>
              </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li> -->
            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li> -->
            </ul>
            <span class="form-inline my-2 my-lg-0 px-5 ">
            <!-- <div class="dropdown"> -->
             <!-- <a class="btn btn-secondary dropdown-toogle"  type="button" data-toggle="dropdown" aria-expanded="false">  -->
              <p class="my-0 py-0 text-white bg-dark" id="uname"></p>
            <img class="rounded-circle mx-2" src="photo_6165537970338247540_x.jpg" width="15" height="15" alt=""></a>
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

var allCookies = document.cookie.split(';');
if(sessionStorage.getItem('user')===null){
	window.location='login.jsp';
}

let signout = document.getElementById('signout');
signout.addEventListener('click', signoutClickHandler)

function signoutClickHandler()
{
	console.log("yes");
	var xhttp;
    xhttp = new XMLHttpRequest();
    
    xhttp.open("GET", 'LogoutServlet', true);
    
    xhttp.onload = function ()
    {
    	//var allCookies = document.cookie.split(';');
        
        // The "expire" attribute of every cookie is 
        // Set to "Thu, 01 Jan 1970 00:00:00 GMT"
        for (var i = 0; i < allCookies.length; i++)
            document.cookie = allCookies[i] + "=;expires="
            + new Date(0).toUTCString();
    	sessionStorage.clear();
    	window.location='login.jsp';
    }
    xhttp.send();
}
</script>

</body>
</html>