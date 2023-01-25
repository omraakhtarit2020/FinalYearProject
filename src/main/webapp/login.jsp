 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .error-text{
            margin: -21px 0px 15px 552px;
            background: #e74c3c;
            color: #fceae8;
            font-size: 10px;
            padding: 8px;
            border-radius: 5px;
            width: 200px;
            text-align: center;
            display: none;
        }
        .error-pass{
            margin: -21px 0px 15px 552px;
            background: #e74c3c;
            color: #fceae8;
            font-size: 10px;
            padding: 8px;
            border-radius: 5px;
            width: 200px;
            text-align: center;
            display: none;
        }
    </style>
<title>SignupLogin</title>
</head>
<body>
    <div class="container my-5">
        <div class="row" style="min-height: 500px; min-width: 509px;">
            <div class="col" style="outline: 2px solid rgb(32, 18, 93);margin-top: 25px;">
                <div class="container" style="width:800px;margin-top:55px">

                    <div style="text-align: left;"> <h2>Welcome to Digital Resource Library</h2></div>
                    <br>
                    <div style="text-align: left;"><h3>Please signup/login to continue</h3></div>
                    
                    <form>
                        <div style="text-align: left; margin-top:30px">
                            <div class="mb-3 row">
                                
                                <label for="inputEmail" class="col-sm-2 col-form-label"> <b><h4>Email</h4></b></label>
                                <div class="col-sm-10">
                                    <input onkeyup="check()" type="text" name="txtName"class="form-control" id="inputEmail" style="background-color: rgb(180, 180, 172);" required>
                                </div>
                            </div>
                            <div class="error-text" >please enter valid Email Address</div>
                            <div class="mb-3 row">
                                <label for="inputPassword" class="col-sm-2 col-form-label"> <b> <h4>Password</h4></b></label>
                                <div class="col-sm-10">
                                    <input onkeyup="check1()" type="password" name="txtPwd" class="form-control" id="inputPassword" maxlength="16" style="background-color: rgb(180, 180, 172);"required>
                                </div>
                            </div>
                        
                       
                        <div class="error-pass" >Must contain at least one number and one uppercase and one lowercase letter, and at least 8 or at most 16 characters and must not contain any special character</div>
                        <!-- <div class="error-text">please enter valid Email Address</div> -->
						<div class="account" id="result" style="width: 562px;margin-left:188px; display:none">
						
							<svg xmlns="http://www.w3.org/2000/svg">
							    <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
							        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
							    </symbol>
							</svg>
							<div class="alert alert-primary d-flex align-items-center" role="alert" style="margin-top: -160px;margin-bottom: -30px;">
						    	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>
						    	<div>
						        	You have no Account.... Do you want to create....
						        	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="height: 36px;width: 74px;margin-left: 420px;margin-top: -30px;margin-bottom: -10px;">
							            <table>
											<tr>
												<td><input type=button id=yes value=YES></td>
												<td><input type=button id=no value=NO></td>
											</tr>
										</table>
						            </div>
						        </div>
						    </div> 
						</div>
                        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 50px;">
                            <button class="btn btn-primary" type="button" id="login" value="login"><b>Signup/Login</b></button>
                        </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    
		var n="nothing";
		var p="nothing";
		
		let login = document.getElementById('login');
		login.addEventListener('click', buttonClickHandler)
		
		function buttonClickHandler() {
			console.log('You have clicked the fetchBtn');
			
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'LoginServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		 	
		 	// What to do when response is ready
		    xhr.onload = function () {
		        if(this.status === 200){
		            if(this.responseText==="1")
		            {
		            	console.log("successful");
		            	sessionStorage.setItem('user',"1");
		            	window.location='index.jsp';
		            }
		            else if(this.responseText==="-1")
		            {
		            	console.log("does not exist");
		            	document.getElementById('result').style.display='block';
		            	document.getElementById('login').style.display='none';
		            }
		            else
		            {
		            	console.log("failed")
		            	alert("Wrong password");
		            	window.location='login.jsp';
		            }
		        }
		        else{
		            console.log("Some error occured");
		        }
		    }
		 	
		 	// send the request
		 	n=document.getElementById("inputEmail").value;
		 	p=document.getElementById("inputPassword").value;
		 	
		 	
		    
		    params="name="+n+"&pwd="+p;
		    
		    xhr.send(params);
		}
		
		let yes = document.getElementById('yes');
		yes.addEventListener('click', yesClickHandler)
		
		function yesClickHandler(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'Register', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    consol.log(params);
			    window.location='login.jsp';
		 	}
		 	
		 	// send the request
		    params="name="+n+"&pwd="+p;
		    
		    xhr.send(params);
		    
		    alert("Account created please login");
        	window.location='login.jsp';
		}
		
		let no = document.getElementById('no');
		no.addEventListener('click', noClickHandler)
		
		function noClickHandler(){
			console.log("inside no")
			window.location='login.jsp';
		}
	</script>
    
    <script>
        const email=document.querySelector("#inputEmail");
        const error= document.querySelector(".error-text");
        const btn=document.querySelector("button");
        let regExp=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        function check(){
            if(email.value.match(regExp)){
                email.style.borderColor="#27ae60";
                error.style.display="none";
                btn.style.display="block";
            }else{
                email.style.borderColor="#e74c3c";
                error.style.display="block";
                btn.style.display="none";
                
            }
            if(email.value==""){
                email.style.borderColor="rgb(32, 18, 93)";
                error.style.display="none";
                btn.style.display="block";
            }
        }
        
        const password=document.querySelector("#inputPassword");
        const error1= document.querySelector(".error-pass");
      	let regExp1= /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}/;
        function check1(){
            if(password.value.match(regExp1)){
                password.style.borderColor="#27ae60";
                error1.style.display="none";
                btn.style.display="block";
            }else{
                password.style.borderColor="#e74c3c";
                error1.style.display="block";
                btn.style.display="none";
                
            }
            if(password.value==""){
                password.style.borderColor="rgb(32, 18, 93)";
                error1.style.display="none";
                btn.style.display="block";
            }
        }
    </script>
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
</html>
 