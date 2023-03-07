<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
  
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
        
        
        .multiselect {
  width: 200px;
  margin-left:-12px;
}

.selectBox {
  position: relative;
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}

#checkboxes1 {
  display: none;
  border: 1px #dadada solid;
}

#checkboxes1 label {
  display: block;
}

#checkboxes1 label:hover {
  background-color: #1e90ff;
}


#checkboxesTM {
  display: none;
  border: 1px #dadada solid;
}

#checkboxesTM label {
  display: block;
}

#checkboxesTM label:hover {
  background-color: #1e90ff;
}
 .col-6{
         width:100%;
       }
button{
				      border:none;
				      cursor:pointer;
				    }
				    .user-btn{
				       border-radius:50%;
				    }
#options {
				         
						  visibility:hidden;
						  position: absolute;
						  background-color:#384047;
						  box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.4);
						  margin-top:100px;
						  margin-left:13em;
						  padding:10px
						}
				
				    #options a {
						  visibility:hidden;
						  color: #fff;
						  padding: 10px;
						  text-decoration: none;
						  padding:20px 40px;}
						  
						  .asterik::after{
						  content:" *";
						  color:red;
						  font-size:20px;
						  }
     </style>
    <title>MyDetails</title>
  </head>

    <body>
    	
    	
    	<div class="mx-2alert alert-light" role="alert" style="background:rgb(217,176,140)">
        <h1 class="text-center" style="color:black">TINT DIGITAL RESOURCE LIBRARY</h1>
      </div>
<nav class="navbar navbar-expand-lg navbar-white bg-dark">

		<img src="photo_6165537970338247538_m.jpg" width="40" height="40"
			alt="">


		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item active"><a
					class="nav-link text-white bg-dark" href="#">Home <span
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
				
				
					<a id="opt-atag" role =button>My Details</a>
					
				</div>
				<button class=" btn btn-light mx-2 " id="signout" href="#">Sign
					Out</button>
			</span>
		</div>
	</nav>
    	
    	
    	
        <div class="container" style="border: 2px solid green;margin-top:20px">
            <span style="text-align: center;"><h3>My Details </h3></span>
            <br>
            <div class="container" style="border: 2px solid rgb(238, 226, 220);">
                <div class="container" style="border: 2px solid rgb(238, 226, 220);">
                    <div class="container" style="border: 2px solid rgb(238, 226, 220);">
                        <div class="container" style="border: 2px solid rgb(238, 226, 220);">
                            <div class="container" style="border: 2px solid rgb(238, 226, 220);">
                            
                            
                            
                            
                               	<form action="myDetailsServlet" method="post">
                                    <label for="txtName" class="form-label "><h4 class='asterik'>Name : </h4></label>
                                    <div class="row w-100 p-3">
                                        <div class="col">
                                            <input onkeyup="nCheck()" type="text" maxlength="20" name="fName" class="form-control" id="fName" placeholder="First name" aria-label="First name" required/>
                                        </div>
                                        <div class="col">
                                            <input onkeyup="nCheck()" type="text" maxlength="20" name="mName" class="form-control" id="mName" placeholder="Middle name" aria-label="Middle name">
                                        </div>
                                        <div class="col">
                                            <input onkeyup="nCheck()" type="text" maxlength="20" name="lName" class="form-control" id="lName" placeholder="Last name" aria-label="Last name" required/>
                                        </div>
                                    </div>
                                    <div class="text-danger" id="nError" style="display:none">please enter a valid Name</div>
                                    <div class="text-danger" id="nError1" style="display:none">This field is mandatory</div>
                                    <br>
                                  
                                    <label for="email" class="form-label" ><h4 class='asterik'>Email : </h4></label>
                                    <div class="row">
                                        <div class="col">
                                            <input type="email"  type="text"  name="email" class="form-control" id="mail-value" value='' readonly  />
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        </div>
                                        
                                        
                                       <div class="mb-3 row">
	                                    <label for="TCSion ID" class="form-label "><b><h4>TCSion ID  : </h4></b></label>
	                                    <div class="col w-100 p-3">
	                                        <input onkeyup="nCheckTCSion()" type="text" minlength="10" maxlength="15" class="form-control" name="TCSion ID" id = "TCSionId" placeholder="TCSion ID" aria-label="TCSion ID">
	                                    </div>
	                                   
	                                    
	                                    <div class="text-danger" id="TCSError" style="display:none">please enter a valid TCSion Id</div>	                                    
	                                    
	                                    <br>
	                                     <br>
                                        <br>
                                        <br>
                                       
                                    <div class="mb-3 row">
                                        
                                        <label for="txtName" class="form-label "><h4 class='asterik'>Designation : </h4></label>
                                        <div class="col cow-100 p-3">
                                            <select onchange="desgCheck()" class="form-select" name="designation" id="desg" aria-label="Default select example ">
                                                <option selected value="">Open this select menu</option>
                                                <option value="Professor">Professor</option>
                                                <option value="Associate  Professor">Associate  Professor</option>
                                                <option value="Assistant  Professor">Assistant  Professor</option>
                                                <option value="Technical  Professor">Technical  Professor</option>
                                            </select>
                                        </div>
                                        <div class="text-danger" id="desgError" style="display:none">This field is mandatory</div>
                                        <br>
                                    </div>
                                    <br>
                                    
                                    <div class="mb-3 row">
	                                    <label for="txtName" class="form-label "><h4 class='asterik'>Subject : </h4></label>
	                                    <div class="col w-100 p-3">
	                                        <select onchange="subCheck()" class="form-select" name="subject" id="sub" aria-label="Default select example ">
	                                            <option selected value="">Open this select menu</option>
	                                            <option value="Mechanical Engineering (ME)">Mechanical Engineering (ME)</option>
	                                            <option value="Civil Engineering (CE)">Civil Engineering (CE)</option>
	                                            <option value="Electronics and Communications Engineering (ECE)">Electronics and Communications Engineering (ECE)</option>
	                                            <option value="Computer Science Engineering (CSE)">Computer Science Engineering (CSE)</option>
	                                            <option value="Electrical Engineering (EE)">Electrical Engineering (EE)</option>
	                                            <option value="Information Technology (IT)">Information Technology (IT)</option>
	                                            <option value="Applied Electronics & Instrumentation Engineering (AEIE)">Applied Electronics & Instrumentation Engineering (AEIE)</option>
	                                            <option value="Bachelor of Business Education (BBE)"> Bachelor of Business Education (BBE)</option>
	                                            <option value="Bachelors's of Computer Application (BCA)">Bachelors's of Computer Application (BCA)</option>
	                                            <option value="Masters of Computer Applications">Masters of Computer Applications</option>
	                                            <option value="AI-ML">AI-ML</option>
	                                            <option value="CSBS">CSBS</option>
	                                        </select>
	                                    </div>
	                                    <div class="text-danger" id="subError" style="display:none">This field is mandatory</div>
	                                    <br>
                                    </div>
                                     <br>
                                     
                                    <div class="mb-3 row"> 
	                                    <label for="txtName" class="form-label "><h4 class='asterik'>Highest Qualification : </h4></label>
	                                    <div class="w-100 p-3">
	                                        <select onchange="hqCheck()" class="form-select" name="HQ" id="hq" aria-label="Default select example ">
	                                            <option selected value="">Open this select menu</option>
	                                            <option value="10th">10th</option>
	                                            <option value="12th">12th</option>
	                                            <option value="Diploma">Diploma</option>
	                                            <option value="Bachelor of Technology (B.Tech)">Bachelor of Technology (B.Tech)</option>
	                                            <option value="Master of Technology (M.Tech)">Master of Technology (M.Tech) </option>
	                                        </select>
	                                    </div>
	                                    <div class="text-danger" id="hqError" style="display:none">This field is mandatory</div>
	                                    <br>
	                                </div>
	                                
                                    <br>
                                    
                                    <div class="mb-3 row">
	                                    <label for="txtName" class="form-label "><b><h4>Any Other : </h4></b></label>
	                                    <div class="col w-100 p-3">
	                                        <input type="text" class="form-control" name="other" placeholder="Others..." aria-label="Any Other">
	                                    </div>
	                                    <br>
	                                     <br>
	                                    <label for="txtName" class="form-label col-form-label"><b><h4>Teaching Exp (in years) : </h4></b></label>
	                                    <div class="col w-100 p-3">
	                                        <input onkeyup="checkExp()" type="text" class="form-control" name="tExp" id="exp" placeholder="Exp...." aria-label="Exp" maxlength="4"  pattern="^(?=.)([+-]?([0-9]*)(\.([0-9]+))?)$" title="The Exp contain only number">
	                                    </div>
	                                    <br>
	                                </div>
                                    
                                    
                                    <label for="txtName" class="form-label"><h4 class='asterik'>Teaching Methods : </h4></label>
                                    <div class="col">
                                    	<div class="multiselect w-100 p-3">
										    <div class="selectBox" onclick="showCheckboxesTM()">
										      <select class="form-select" name="TM" aria-label="Default select example ">
										        <option>Open this select menu </option>
										      </select>
										      <div class="overSelect"></div>
										    </div>
										    <div id="checkboxesTM">
										      <label for="oneTM">
										        <input onchange="TMcheck()" type="checkbox" id="oneTM" name="teachingMethods" value="Lecture" />Lecture</label>
										      <label for="twoTM">
										        <input onchange="TMcheck()" type="checkbox" id="twoTM" name="teachingMethods" value="Workshop" />Workshop</label>
										      <label for="threeTM">
										        <input onchange="TMcheck()" type="checkbox" id="threeTM" name="teachingMethods" value="Field Trip" />Field Trip</label>
										      <label for="fourTM">
										        <input onchange="TMcheck()" type="checkbox" id="fourTM" name="teachingMethods" value="Project" />Project</label>
										    </div>
										  </div>
                                    </div>
                                    <div class="text-danger" id="TMError" style="display:none">This field is mandatory</div>
                                    <br>
                                    
                                    <label for="txtName" class="form-label "><h4 class='asterik'>Technology Used : </h4></label>
                                    <div class="w-100 p-3">
	                                    <div class="multiselect w-100 p-3">
										    <div class="selectBox" onclick="showCheckboxes()">
										      <select class="form-select" name="tUsed" aria-label="Default select example ">
										        <option>Open this select menu </option>
										      </select>
										      <div class="overSelect"></div>
										    </div>
										    <div id="checkboxes">
										      <label for="one">
										        <input onchange="TUcheck()" type="checkbox" id="one" name="technologyUsed" value="Chalk Board" />Chalk Board</label>
										      <label for="two">
										        <input onchange="TUcheck()" type="checkbox" id="two" name="technologyUsed" value="White Board" />White Board</label>
										      <label for="three">
										        <input onchange="TUcheck()" type="checkbox" id="three" name="technologyUsed" value="Projector" />Projector</label>
										    </div>
										  </div>
									</div>
									<div class="text-danger" id="TUError" style="display:none">This field is mandatory</div>
                                    <br>

								<div class="mb-3 row">
                                    <label for="txtName" class="form-label "><h4 class='asterik'>Study Material Developed: </h4></label>
                                    <div class="col w-100 p-3">
                                        <select onchange="SMDCheck()" class="form-select" name="SMD" id="SMD" aria-label="Default select example ">
                                            <option selected value="" >Open this select menu</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>
                                        </select>
                                    </div>
                                    <div class="text-danger" id="SMDError" style="display:none">This field is mandatory</div>
                                    <br>
                                    
                                 </div>
									
                                    <label for="txtName" class="form-label"><h4 class='asterik'>Contribution to enrich quality of teaching: </h4></label>
                                    <div class="d-flex p-2">
                                    	<div class="multiselect w-100 p-3">
										    <div class="selectBox" onclick="showCheckboxes1()">
										      <select class="form-select" name="CEQT" aria-label="Default select example ">
										        <option>Open this select menu </option>
										      </select>
										      <div class="overSelect"></div>
										    </div>
										    <div id="checkboxes1">
										      <label for="one1">
										        <input onchange="CEQcheck()" type="checkbox" id="one1" name="contribution" value="Seminars" />Seminars</label>
										      <label for="two1">
										        <input onchange="CEQcheck()" type="checkbox" id="two1" name="contribution" value="Workshop" />Workshop</label>
										      <label for="three1">
										        <input onchange="CEQcheck()" type="checkbox" id="three1" name="contribution" value="Lecture" />Lecture</label>
										      <label for="four1">
										        <input onchange="CEQcheck()" type="checkbox" id="four1" name="contribution" value="Field Visit" />Field Visit</label>
										    </div>
										  </div>
                                    </div>
                                    <div class="text-danger" id="CEQError" style="display:none">This field is mandatory</div>
                                    <br>  
                                    <br>
                                    <br>
                                    <br>

                                    <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 10px;">
	
                                       <button class="btn btn-primary" type="submit" id="Submit" value="Submit"><b>Submit</b></button>
                                                
                                        <button class="btn btn-primary" type="reset" id="reset" value="Reset"><b>Reset</b></button>          

                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>      
        </div>
        
        <!-- Input field constraints -->
        <script type="text/javascript">
        
        
        	
        	
        
        
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
	   		
	   		
	        
	        document.querySelector('#mail-value').value=name;   //getting the Email from login page
           
        	const submit=document.querySelector("#submit");
        	const TCSionId=document.querySelector("#TCSionId");
        
        	const fName=document.querySelector("#fName");
        	const mName=document.querySelector("#mName");
        	const lName=document.querySelector("#lName");
        	const nError=document.querySelector("#nError");
        	const nError1=document.querySelector("#nError1");
        	const desg=document.querySelector("#desg");
            const desgError=document.querySelector("#desgError");
            const sub=document.querySelector("#sub");
            const subError=document.querySelector("#subError");
            const hq=document.querySelector("#hq");
            const hqError=document.querySelector("#hqError");
            const oneTM=document.querySelector("#oneTM");
            const twoTM=document.querySelector("#twoTM");
            const threeTM=document.querySelector("#threeTM");
            const fourTM=document.querySelector("#fourTM");
            const TMError=document.querySelector("#TMError");
            const one=document.querySelector("#one");
            const two=document.querySelector("#two");
            const three=document.querySelector("#three");
            const TUError=document.querySelector("#TUError");
            const SMD=document.querySelector("#SMD");
            const SMDError=document.querySelector("#SMDError");
            const one1=document.querySelector("#one1");
            const two1=document.querySelector("#two1");
            const three1=document.querySelector("#three1");
            const four1=document.querySelector("#four1");
            const CEQError=document.querySelector("#CEQError");
            const error=[];
        	
            <!-- Constraint for name -->
        	let regExp= /^[A-Za-z]+$/;
            function nCheck(){
                if(fName.value.match(regExp) && lName.value.match(regExp)){
                    fName.style.borderColor="#27ae60";
                    lName.style.borderColor="#27ae60";
                    mName.style.borderColor="#27ae60";
                    nError.style.display="none";
                    nError1.style.display="none";
                 //   submit.disabled=false;
                 error[0]=0;
                }else{
                    fName.style.borderColor="#e74c3c";
                    lName.style.borderColor="#e74c3c";
                    mName.style.borderColor="#e74c3c";
                    nError.style.display="block";
                    nError1.style.display="none";
                    //submit.disabled=true;
                    error[0]=1;
                    
                }
                if(fName.value=="" || lName.value==""){
                	fName.style.borderColor="#e74c3c";
                    lName.style.borderColor="#e74c3c";
                    nError1.style.display="block";
                    nError.style.display="none";
                    //submit.disabled=true;
                    error[0]=1;
                }
                if(mName.value!="" && !mName.value.match(regExp)){
                	mName.style.borderColor="#e74c3c";
                    nError.style.display="block";
                   // submit.disabled=true;
                    error[0]=1;
                }
                check();
            }
            
            <!-- Constraint for TCSion ID  -->
            <!-- let regExpTCSion =/^[A-Za-z0-9]*$/; -->
           <!-- let regExpTCSion =/[a-zA-Z]{2}\d{6}/; -->
          let regExpTCSion =/[a-zA-Z]{2}[0-9]{9}/; 
        	 
           
            function nCheckTCSion() {
            	if(TCSionId.value.match(regExpTCSion) || TCSionId.value===""){
            		TCSionId.style.borderColor="#27ae60";
                    TCSError.style.display="none";
                    
                    //submit.disabled=false;
                    error[1]=0;
                }else{
                	TCSionId.style.borderColor="#e74c3c";
                    
                    TCSError.style.display="block";
                   
                    //submit.disabled=true;
                    error[1]=1;
                }
               
                check();
            	
            	
            }
            
      
            
            <!-- Constraint for designation -->
            function desgCheck(){
            	if(desg.value==""){
                	desg.style.borderColor="#e74c3c";
                	desgError.style.display="block";
                    //submit.disabled=true;
                	error[2]=1;
                }
            	else{
            		desg.style.borderColor="#27ae60";
                	desgError.style.display="none";
                    //submit.disabled=false;
                	error[2]=0;
            	}
            	check();
            }
            
            <!-- Constraint for subject -->
            function subCheck(){
            	if(sub.value==""){
                	sub.style.borderColor="#e74c3c";
                	subError.style.display="block";
                    //submit.disabled=true;
                	error[3]=1;
                }
            	else{
            		sub.style.borderColor="#27ae60";
                	subError.style.display="none";
                    //submit.disabled=false;
                	error[3]=0;
            	}
            	check();
            }
            
            <!-- Constraint for Highest Qualification -->
            function hqCheck(){
            	if(hq.value==""){
                	hq.style.borderColor="#e74c3c";
                	hqError.style.display="block";
                    //submit.disabled=true;
                	error[4]=1;
                }
            	else{
            		hq.style.borderColor="#27ae60";
                	hqError.style.display="none";
                    //submit.disabled=false;
                	error[4]=0;
            	}
            	check();
            }
            
            <!-- Constraint for Teachning Methods -->
            function TMcheck() {
            	if(oneTM.checked==true || twoTM.checked==true || threeTM.checked==true || fourTM.checked==true){
            		//submit.disabled=false;
            		error[5]=0;
            		TMError.style.display="none";
            	}
            	else{
            		TMError.style.display="block";
            	}
            	check();
            }
            
            <!-- Constraint for Technology Used -->
            function TUcheck() {
            	if(one.checked==true || two.checked==true || three.checked==true){
            		//submit.disabled=false;
            		error[6]=0;
            		TUError.style.display="none";
            	}
            	else{
            		TUError.style.display="block";
            	}
            	check();
            }
            
            <!-- Constraint for Study Material Devoloped -->
            function SMDCheck(){
            	if(SMD.value==""){
                	SMD.style.borderColor="#e74c3c";
                	SMDError.style.display="block";
                    //submit.disabled=true;
                	error[7]=1;
                    
                }
            	else{
            		SMD.style.borderColor="#27ae60";
                	SMDError.style.display="none";
                    //submit.disabled=false;
                	error[7]=0;
            	}
            	check();
            }
            
            <!-- Constraint for Contribution to Enrich Quality of Teaching -->
            function CEQcheck() {
            	if(one1.checked==true || two1.checked==true || three1.checked==true || four1.checked==true){
            		//submit.disabled=false;
            		error[8]=0;
            		CEQError.style.display="none";
            	}
            	else{
            		CEQError.style.display="block";
            	}
            	check();
            }
            
            <!-- Mandatory field check -->
            function check(){
            	if(fName.value=="" || desg.value=="" || sub.value=="" || hq.value=="" || SMD.value=="" || error.includes(1)){
            		submit.disabled=true;
            	}
            	else if(oneTM.checked==false && twoTM.checked==false && threeTM.checked==false && fourTM.checked==false){
            		submit.disabled=true;
            	}
            	else if(one.checked==false && two.checked==false && three.checked==false){
            		submit.disabled=true;
            	}
            	else if(one1.checked==false && two1.checked==false && three1.checked==false && four1.checked==false){
            		submit.disabled=true;
            	}
            	else {
            		submit.disabled=false;
            		
            	}
            	//console.log(1)
            }
            check();
            
            
            <!-- MultiSelection for Technology Used -->
            var expanded = false;

            function showCheckboxes() {
              var checkboxes = document.getElementById("checkboxes");
              if (!expanded) {
                checkboxes.style.display = "block";
                expanded = true;
              } else {
                checkboxes.style.display = "none";
                expanded = false;
              }
            }
            
            
            <!-- MultiSelection for Contribution to enrich quality of teaching -->
            var expanded = false;

            function showCheckboxes1() {
              var checkboxes1 = document.getElementById("checkboxes1");
              if (!expanded) {
                checkboxes1.style.display = "block";
                expanded = true;
              } else {
                checkboxes1.style.display = "none";
                expanded = false;
              }
            }
            
            <!-- MultiSelection for TeachingMethod -->
            var expanded = false;

            function showCheckboxesTM() {
              var checkboxesTM = document.getElementById("checkboxesTM");
              if (!expanded) {
                checkboxesTM.style.display = "block";
                expanded = true;
              } else {
                checkboxesTM.style.display = "none";
                expanded = false;
              }
            }
        </script>
        
     
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
     integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
     crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
     crossorigin="anonymous"></script>
  </body>
</html>