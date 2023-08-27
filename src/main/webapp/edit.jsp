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
  
  
    <style type="text/css">
      
        
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
   <%@ include file="nav.jsp" %>
    	
    	<%@page
		import="java.util.*,ProjMyDetails.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%
	myDetailsDaw mdw = new myDetailsDaw();
	String user=(String)session.getAttribute("user");
	MyDetailsData userInfo = mdw.getAllInfo(user);
	%>
    	
        <div class="container" style="border: 2px solid white;background-color: white;margin-top:20px">
            <span style="text-align: center;"><h3>My Details </h3></span>
                        
                               	<form action="EditServlet" method="post">
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
                                        
                                        <label for="email" class="form-label" ><h4 class='asterik'>Alternate Email : </h4></label>
                                        <div class="row">
                                        <div class="col">
                                            <input type="email"  type="text"  class="form-control" id="mail-value" name="aName" value="<%=userInfo.getaName()%>"/>
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        </div>
                                        
                                        <label for="phn" class="form-label" ><h4 class='asterik'>Phone no. : </h4></label>
                                    <div class="row">
                                        <div class="col">
                                            <div class="input-group-prepend">
											    <span class="input-group-text" id="basic-addon1">+91</span>
											  <input onkeyup="nCheckPhn()"  type="text" class="form-control" placeholder="phone number" value="<%=userInfo.getPhn()%>" aria-describedby="basic-addon1" name="phn" id="phn"> </div>
                                        </div>
                                        <div class="text-danger" id="PhnError" style="display:none">This field is mandatory</div>
                                        <br>
                                        <br>
                                        <br>
                                        </div>
                                        
                                        <label for="dob" class="form-label"><h4 class='asterik'>Date Of Birth : </h4></label>
                                        <div class="row">
                                        <div class="col">
                                          <input onkeyup="nCheckdob()" type="date" id="dob" name="dob" maxlength="20" class="form-control" required value="<%=userInfo.getudob()%>"><br>
                                        </div>
                                        </div>
                                        <div class="text-danger" id="dobError" style="display:none">please enter a valid D.O.B</div>
                                        
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
	                                            <option value="Applied Electronics and Instrumentation Engineering (AEIE)">Applied Electronics & Instrumentation Engineering (AEIE)</option>
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
	                                        <input type="text" class="form-control" name="other" id="anyOther" placeholder="Others..." aria-label="Any Other">
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

                                    <div class="d-grid gap-2 col-4 mx-auto" style="margin-top: 10px;">
                                                  
										<button class="btn btn-primary" id="edit" value="edit" ><b>EDIT</b></button>
                                    </div>

                                </form>
                            </div>
      
        
        <!-- Input field constraints -->
        <script type="text/javascript">
	   		
	   		
	        
	        document.querySelector('#mail-value').value=name;   //getting the Email from login page
	        var edit = "";
	        var check1 = "";
	        var i=0;
           
        	const update=document.querySelector("#update");
        	
        	
        	
        	const TCSionId=document.querySelector("#TCSionId");
        
        	const fName=document.querySelector("#fName");
        	edit = `<%=userInfo.getfName()%>`;
        	fName.value=edit;
        	
        	const mName=document.querySelector("#mName");
        	edit = `<%=userInfo.getmName()%>`;
        	mName.value=edit;
        	
        	const lName=document.querySelector("#lName");
        	edit = `<%=userInfo.getlName()%>`;
        	lName.value=edit;
        	
        	const nError=document.querySelector("#nError");
        	const nError1=document.querySelector("#nError1");
        	
        	const phn=document.querySelector("#phn");
        	edit = `<%=userInfo.getPhn()%>`;
        	phn.value=edit;
        	const PhnError=document.querySelector("#PhnError");
        	
        	const dob=document.querySelector("#dob");
        	edit = `<%=userInfo.getudob()%>`;
        	dob.value=edit;
        	const dobError=document.querySelector("#dobError");
        	
        	
        	const tcsionId=document.querySelector("#TcsionId");
        	edit = `<%=userInfo.getTcsionId()%>`;
        	tcsionId.value=edit;
        	
        	const desg=document.querySelector("#desg");
        	edit = `<%=userInfo.getDesignation()%>`;
        	desg.value=edit;
        	
            const desgError=document.querySelector("#desgError");
            
            const sub=document.querySelector("#sub");
            edit = `<%=userInfo.getSubject()%>`;
        	sub.value=edit;
        	
            const subError=document.querySelector("#subError");
            
            const hq=document.querySelector("#hq");
            edit = `<%=userInfo.getHighestQualification()%>`;
        	hq.value=edit;
        	
            const hqError=document.querySelector("#hqError");
            
            const anyOther=document.querySelector("#anyOther");
        	edit = `<%=userInfo.getAnyOther()%>`;
        	anyOther.value=edit;
        	
        	const exp=document.querySelector("#exp");
        	edit = `<%=userInfo.getTeachingExp()%>`;
        	exp.value=edit;
            
            const oneTM=document.querySelector("#oneTM");
            const twoTM=document.querySelector("#twoTM");
            const threeTM=document.querySelector("#threeTM");
            const fourTM=document.querySelector("#fourTM");
            edit = `<%=userInfo.getTeachingMethods()%>`;
            
            check1=edit.split(",");
            if(check1[i]===oneTM.value){
            	oneTM.checked=true;
            	i++;
            }
            if(check1[i]===twoTM.value){
            	twoTM.checked=true;
            	i++;
            }
            if(check1[i]===threeTM.value){
            	threeTM.checked=true;
            	i++;
            }
            if(check1[i]===fourTM.value){
            	fourTM.checked=true;
            }
            i=0;
            
            const TMError=document.querySelector("#TMError");
            
            const one=document.querySelector("#one");
            const two=document.querySelector("#two");
            const three=document.querySelector("#three");
            edit = `<%=userInfo.getTechnologyUses()%>`;
            check1=edit.split(",");
            if(check1[i]===one.value){
            	one.checked=true;
            	i++;
            }
            if(check1[i]===two.value){
            	two.checked=true;
            	i++;
            }
            if(check1[i]===three.value){
            	three.checked=true;
            }
            i=0;
            
            const TUError=document.querySelector("#TUError");
            
            const SMD=document.querySelector("#SMD");
        	edit = `<%=userInfo.getSmd()%>`;
        	SMD.value=edit;
            
            const SMDError=document.querySelector("#SMDError");
            const one1=document.querySelector("#one1");
            const two1=document.querySelector("#two1");
            const three1=document.querySelector("#three1");
            const four1=document.querySelector("#four1");
            edit = `<%=userInfo.getCeqt()%>`;
            check1=edit.split(",");
            if(check1[i]===one1.value){
            	one1.checked=true;
            	i++;
            }
            if(check1[i]===two1.value){
            	two1.checked=true;
            	i++;
            }
            if(check1[i]===three1.value){
            	three1.checked=true;
            	i++;
            }
            if(check1[i]===four1.value){
            	four1.checked=true;
            }
            i=0;
            
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
            <!-- Constraints for Phone-->
            
            
            let regExpPhn =/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/; 
          	 
               
               function nCheckPhn() {
               	if(phn.value.match(regExpPhn) || phn.value===""){
               		phn.style.borderColor="#27ae60";
                       PhnError.style.display="none";
                       
                       //submit.disabled=false;
                       error[1]=0;
                   }else{
                   	phn.style.borderColor="#e74c3c";
                       
                       PhnError.style.display="block";
                      
                       //submit.disabled=true;
                       error[1]=1;
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
                    error[2]=0;
                }else{
                	TCSionId.style.borderColor="#e74c3c";
                    
                    TCSError.style.display="block";
                   
                    //submit.disabled=true;
                    error[2]=1;
                }
               
                check();
            	
            	
            }
            <!-- Constraint for D.O.B-->
            const currentDate = new Date().toISOString().split('T')[0];

            dob.addEventListener('input', () => {
             const enteredDate = dob.value;
             if (enteredDate > currentDate) {
           	  dob.style.borderColor="#e74c3c";
                 
                 dobError.style.display="block";
             } else {
           	  dob.style.borderColor="#27ae60";
                 dobError.style.display="none";
               dob.setCustomValidity('');
               
             }
           });
      
            
            <!-- Constraint for designation -->
            function desgCheck(){
            	if(desg.value==""){
                	desg.style.borderColor="#e74c3c";
                	desgError.style.display="block";
                    //submit.disabled=true;
                	error[3]=1;
                }
            	else{
            		desg.style.borderColor="#27ae60";
                	desgError.style.display="none";
                    //submit.disabled=false;
                	error[3]=0;
            	}
            	check();
            }
            
            <!-- Constraint for subject -->
            function subCheck(){
            	if(sub.value==""){
                	sub.style.borderColor="#e74c3c";
                	subError.style.display="block";
                    //submit.disabled=true;
                	error[4]=1;
                }
            	else{
            		sub.style.borderColor="#27ae60";
                	subError.style.display="none";
                    //submit.disabled=false;
                	error[4]=0;
            	}
            	check();
            }
            
            <!-- Constraint for Highest Qualification -->
            function hqCheck(){
            	if(hq.value==""){
                	hq.style.borderColor="#e74c3c";
                	hqError.style.display="block";
                    //submit.disabled=true;
                	error[5]=1;
                }
            	else{
            		hq.style.borderColor="#27ae60";
                	hqError.style.display="none";
                    //submit.disabled=false;
                	error[5]=0;
            	}
            	check();
            }
            
            <!-- Constraint for Teachning Methods -->
            function TMcheck() {
            	if(oneTM.checked==true || twoTM.checked==true || threeTM.checked==true || fourTM.checked==true){
            		//submit.disabled=false;
            		error[6]=0;
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
            		error[7]=0;
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
                	error[8]=1;
                    
                }
            	else{
            		SMD.style.borderColor="#27ae60";
                	SMDError.style.display="none";
                    //submit.disabled=false;
                	error[8]=0;
            	}
            	check();
            }
            
            <!-- Constraint for Contribution to Enrich Quality of Teaching -->
            function CEQcheck() {
            	if(one1.checked==true || two1.checked==true || three1.checked==true || four1.checked==true){
            		//submit.disabled=false;
            		error[9]=0;
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
            		update.disabled=true;
            	}
            	else if(oneTM.checked==false && twoTM.checked==false && threeTM.checked==false && fourTM.checked==false){
            		update.disabled=true;
            	}
            	else if(one.checked==false && two.checked==false && three.checked==false){
            		update.disabled=true;
            	}
            	else if(one1.checked==false && two1.checked==false && three1.checked==false && four1.checked==false){
            		update.disabled=true;
            	}
            	else {
            		update.disabled=false;
            		
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
        
     
    
  </body>
</html>