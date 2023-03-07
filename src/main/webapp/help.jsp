<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
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
              <a class="nav-link text-white bg-dark" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
             <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="naac.jsp">NAAC <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active">
                <a class="nav-link text-white bg-dark" href="help.jsp">Help <span class="sr-only">(current)</span></a>
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
            <img class="rounded-circle mx-2" src="photo_6165537970338247539_x.jpg" width="15" height="15" alt=""></a>
            <!-- <div class="dropdown-menu"> -->
                <a class=" btn btn-light mx-2 " id="signout" href="#">Sign Out</a>
              <!-- </div> -->
            </span>
          
          <!-- <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form> -->
        </div>
      </nav>
      <p>
        help page...
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
      

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
      
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
  </body>
</html>