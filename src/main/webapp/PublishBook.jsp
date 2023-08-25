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
	<%@page import="com.marvel.publishedbooks.*"%>
	<%@page import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<%
	PublishedBooksDaw pbd = new PublishedBooksDaw();
	List<PublishedBooksData> booksData = pbd.getAllInfo();
	request.setAttribute("booksData", booksData);
	%>
    <div class="container-fluid" style="background-color: #D9B08C; text-align: center;">
            <div class="py-2"><h4><b>Details Of Published Books(NAAC Clause 3.2.2)</b></h4></div>
    </div>
    
    <div id="alert"></div>
    
	<div class="container btn-toolbar justify-content-between">
		<div class="mb-5 mt-5">
        	<button type="button" class="btn btn-success" id="download" onclick="downloadClickHandler()">Download</button>
    	</div>
		<!--  <div>
			
			<input type="text" class="mt-4 mb-4 mr-1 margr"
				placeholder="Type to Search"
				style="padding: 4.8px; outline: none; border: none; width: 200px; border-radius: 20px;">
			<button type="submit" class="btn btn-dark mt-4 mb-4" style="border-radius: 10px">Search</button>
		</div> -->
    
    
        <table class="table table-striped">
            <thead style="background-color:#dbd0b5;">
            <tr style="text-align: center">
                <th>Name Of The Teacher</th>
                <th>Title Of The Book/Chapter Published</th>
                <th>Title Of The Paper</th>
                <th>Title Of The Proceedings Of The Conference</th>
                <th>Year Of Publication</th>
                <th>ISBN/ISSN Number Of The Proceeding</th>
                <th>Whether at The Time Of Publication Affiliating Institution Was Same</th>
                <th> Name Of The Publisher</th>
                <!-- <th colspan="2">Actions</th> -->
            </tr>
            </thead>
            <tbody class="text-center" style="">
            <c:forEach items="${booksData}" var="book">
            	 <tr>
                	<td>${book.getTeacherName()}</td>
                	<td>${book.getBookTitle()}</td>
                	<td>${book.getPaperTitle()}</td>
                	<td>${book.getTitleOfProceedingsOfTheConference()}</td>
                	<td>${book.getPublicationYear()}</td>
                	<td>${book.getISBN_ISSN()}</td>
                	<td>${book.getSameAffilatingInstitution()}</td>
                	<td>${book.getPublisherName()}</td>
                	<!-- <td style="width:10px">
                		<a class="btn btn-dark" onclick="edit(`${book.getTeacherName()}`,`${book.getBookTitle()}`,`${book.getPaperTitle()}`,`${book.getTitleOfProceedingsOfTheConference()}`,`${book.getPublicationYear()}`,`${book.getISBN_ISSN()}`,`${book.getSameAffilatingInstitution()}`,`${book.getPublisherName()}`)" role="button">Edit</a>
                	</td>
                	<td style="width:10px">
                		<form action="PublishedBooksDeleteServlet" method="POST">
                			<input type="text" id="ISBN" name="ISBN" value="${book.getISBN_ISSN()}" style="display:none">
                			<input type="text" id="TeacherName" name="TeacherName" value="${book.getTeacherName()}" style="display:none">
                			<button class="btn btn-dark" role="button" type="submit">Delete</button>
                		</form>
                		
                	</td> -->
            </tr>
            </c:forEach>
                        
            
            </tbody>
        </table>

    </div>
    <!--<div class="container my-2">
  		<div class="row justify-content-md-center">
    
    		<div class="col-md-auto">
      			
    		</div>
    
  		</div>
  	</div>  -->

    
    
	<form action="" id="form" method="post">
    <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content text-center">
        <div class="modal-header">
          	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <h5><b>Details Of Published Books</b></h5>
        <div class="modal-body">
        	<label for="ISBN_ISSN" id="ISBN_ISSNlabel" class="font-weight-bold mb-0">ISBN/ISSN Number Of The Proceeding: </label>
        	<div class="text-danger" id="ISBN_ISSNError" style="display:none">Invalid Input</div>
        	<input type="text" id="ISBN_ISSNprev" name="ISBN_ISSNprev" style="display:none">
        	<input type="text" class="form-control mb-3" onkeyup="ISBN_ISSNcheck()" id="ISBN_ISSN" name="ISBN_ISSN" placeholder="ISBN/ISSN Number Of The Proceeding" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            
            <label for="bookTitle" id="bookTitleLabel" class="font-weight-bold mb-0">Title Of The Book/Chapter Published: </label>
            <div class="text-danger" id="bookTitleError" style="display:none">Invalid Input</div>
            <input type="text" id="bookTitlePrev" name="bookTitlePrev" style="display:none">
            <input type="type" class="form-control mb-3" onkeyup="bookTitleCheck()" id="bookTitle" name="bookTitle" placeholder="Title Of The Book/Chapter Published" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            
            <label for="paperTitle" id="paperTitleLabel" class="font-weight-bold mb-0">Title Of The Paper: </label>
            <div class="text-danger" id="paperTitleError" style="display:none">Invalid Input</div>
            <input type="text" id="paperTitlePrev" name="paperTitlePrev" style="display:none">
            <input type="type" class="form-control mb-3" onkeyup="paperTitleCheck()" id="paperTitle" name="paperTitle" placeholder="Title Of The Paper" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            
            <label for="titlePC" id="titlePClabel" class="font-weight-bold mb-0">Title Of The Proceedings Of The Conference: </label>
            <div class="text-danger" id="titlePCError" style="display:none">Invalid Input</div>
            <input type="text" id="titlePCprev" name="titlePCprev" style="display:none">
            <input type="type" class="form-control mb-3" onkeyup="titlePCcheck()" id="titlePC" name="titlePC" placeholder="Title Of The Proceedings Of The Conference" name="Title Of The Proceedings Of The Conference" value="Title Of The Proceedings Of The Conference" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            
            <label for="year" id="yearLabel" class="font-weight-bold mb-0">Year Of Publication: </label>
            <div class="text-danger" id="yearError" style="display:none">Invalid Input</div>
            <input type="text" id="yearPrev" name="yearPrev" style="display:none">
            <input type="date" class="form-control mb-3" onchange="yearCheck()" id="year" name="year" placeholder="Year Of Publication" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            
            <label for="WTPAIS" id="WTPAISlabel" class="font-weight-bold mb-0">Whether at The Time Of Publication Affiliating Institution Was Same?: </label>
            <div class="text-danger" id="WTPAISError" style="display:none">Invalid Input</div>
            <input type="text" id="WTPAISprev" name="WTPAISprev" style="display:none">
            <select class="form-select mb-3" onchange="WTPAIScheck()" id="WTPAIS" name="WTPAIS" aria-label="Default select example " style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
                                            <option selected value="" >Whether at The Time Of Publication Affiliating Institution Was Same?</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>
                                        </select>
            
            <label for="publisherName" id="publisherNameLabel" class="font-weight-bold mb-0">Name Of The Publisher: </label>
            <div class="text-danger" id="publisherNameError" style="display:none">Invalid Input</div>
            <input type="text" id="publisherNamePrev" name="publisherNamePrev" style="display:none">
            <input type="type" class="form-control mb-3" onkeyup="publisherNameCheck()" id="publisherName" name="publisherName" placeholder="Name Of The Publisher" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
            
            <label for="teacherName" id="teacherNameLabel" class="font-weight-bold mb-0">Name Of The Teacher: </label>
            <div class="text-danger" id="teacherNameError" style="display:none">Invalid Input</div>
            <input type="text" id="teacherNamePrev" name="teacherNamePrev" style="display:none">
            <input type="type" class="form-control" onkeyup="teacherNameCheck()" id="teacherName" name="teacherName" placeholder="Name Of The Teacher" style="border-radius: 30px;width: 400px;margin: auto;border: 2px solid black;">
        </div>
        <div class="modal-footer mx-auto">
            <span><button type="button" onclick="searchISBN()" id="search" class="btn btn-primary btn btn-dark">Search</button></span>
            <span><button type="submit" id="submit" class="btn btn-primary btn btn-dark">Submit</button></span>
            <span><button type="submit" id="edit" class="btn btn-primary btn btn-dark">Edit</button></span>
            <!-- <span><button type="reset" id="reset" value="reset" class="btn btn-primary btn btn-dark">Reset</button></span>  -->
        </div>
      </div>
    </div>
  </div>
  </form>
	
	<script>
		const ISBN_ISSN=document.getElementById("ISBN_ISSN");
		const ISBN_ISSNlabel=document.getElementById("ISBN_ISSNlabel");
		const ISBN_ISSNprev=document.getElementById("ISBN_ISSNprev");
		const ISBN_ISSNError=document.getElementById("ISBN_ISSNError");
		
		const bookTitle=document.getElementById("bookTitle");
		const bookTitleLabel=document.getElementById("bookTitleLabel");
		const bookTitlePrev=document.getElementById("bookTitlePrev");
		const bookTitleError=document.getElementById("bookTitleError");
		
		const paperTitle=document.getElementById("paperTitle");
		const paperTitleLabel=document.getElementById("paperTitleLabel");
		const paperTitlePrev=document.getElementById("paperTitlePrev");
		const paperTitleError=document.getElementById("paperTitleError");
		
		const titlePC=document.getElementById("titlePC");
		const titlePClabel=document.getElementById("titlePClabel");
		const titlePCprev=document.getElementById("titlePCprev");
		const titlePCError=document.getElementById("titlePCError");
		
		const year=document.getElementById("year");
		const yearLabel=document.getElementById("yearLabel");
		const yearPrev=document.getElementById("yearPrev");
		const yearError=document.getElementById("yearError");
		
		const WTPAIS=document.getElementById("WTPAIS");
		const WTPAISlabel=document.getElementById("WTPAISlabel");
		const WTPAISprev=document.getElementById("WTPAISprev");
		const WTPAISError=document.getElementById("WTPAISError");
		
		const publisherName=document.getElementById("publisherName");
		const publisherNameLabel=document.getElementById("publisherNameLabel");
		const publisherNamePrev=document.getElementById("publisherNamePrev");
		const publisherNameError=document.getElementById("publisherNameError");
		
		const teacherName=document.getElementById("teacherName");
		const teacherNameLabel=document.getElementById("teacherNameLabel");
		const teacherNamePrev=document.getElementById("teacherNamePrev");
		const teacherNameError=document.getElementById("teacherNameError");
		
		const searchBtn=document.getElementById("search");
		const submitBtn=document.getElementById("submit");
		const editBtn=document.getElementById("edit");
		//const resetBtn=document.getElementById("reset");
		const form=document.getElementById("form");
		
		var error= [0,0,0,0,0,0,0,0];
		let regex="";
		
		//Constraints for input fields
		function ISBN_ISSNcheck(){
			regex = new RegExp(/^(?=(?:[^0-9]*[0-9]){10}(?:(?:[^0-9]*[0-9]){3})?$)[\d-]+$/);
			if(regex.test(ISBN_ISSN.value) & ISBN_ISSN.value!=""){
				error[0]=1;
				ISBN_ISSNError.style.display="none";
			}else{
				error[0]=0;
				ISBN_ISSNError.style.display="block";
			}
			check();
		}
		
		function bookTitleCheck(){
			regex = new RegExp(/^[a-zA-Z ]*$/);
			if(regex.test(bookTitle.value) & bookTitle.value!=""){
				error[1]=1;
				bookTitleError.style.display="none";
			}else{
				error[1]=0;
				bookTitleError.style.display="block";
			}
			check();
		}
		
		function paperTitleCheck(){
			regex = new RegExp(/^[a-zA-Z ]*$/);
			if(regex.test(paperTitle.value) & paperTitle.value!=""){
				error[2]=1;
				paperTitleError.style.display="none";
			}else{
				error[2]=0;
				paperTitleError.style.display="block";
			}
			check();
		}
		
		function titlePCcheck(){
			regex = new RegExp(/^[a-zA-Z ]*$/);
			if(regex.test(titlePC.value) & titlePC.value!=""){
				error[3]=1;
				titlePCError.style.display="none";
			}else{
				error[3]=0;
				titlePCError.style.display="block";
			}
			check();
		}
		
		function yearCheck(){
			if(year.value===""){
				error[4]=0;
				yearError.style.display="block";
			}else{
				error[4]=1;
				yearError.style.display="none";
			}
			check();
		}
		
		function WTPAIScheck(){
			if(WTPAIS.value===""){
				error[5]=0;
				WTPAISError.style.display="block";
			}else{
				error[5]=1;
				WTPAISError.style.display="none";
			}
			check();
		}
		
		function publisherNameCheck(){
			regex = new RegExp(/^[a-zA-Z ]*$/);
			if(regex.test(publisherName.value) & publisherName.value!=""){
				error[6]=1;
				publisherNameError.style.display="none";
			}else{
				error[6]=0;
				publisherNameError.style.display="block";
			}
			check();
		}
		
		function teacherNameCheck(){
			regex = new RegExp(/^[a-zA-Z ]*$/);
			if(regex.test(teacherName.value) & teacherName.value!=""){
				error[7]=1;
				teacherNameError.style.display="none";
			}else{
				error[7]=0;
				teacherNameError.style.display="block";
			}
			check();
		}
		
		function check(){
			if(error.includes(0)){
				submitBtn.disabled=true;
				editBtn.disabled=true;
				searchBtn.disabled=true;
			} else{
				submitBtn.disabled=false;
				editBtn.disabled=false;
				searchBtn.disabled=false;
			}
		}
		
		//Functionality of Add New Field button
		function addNewField(){
			error = [0,1,1,1,1,1,1,1];
			let myModal = new bootstrap.Modal(document.getElementById('Modal'), {});
			myModal.show();
			form.action="SearchServlet";
			
			ISBN_ISSNError.style.display="none";
			bookTitleError.style.display="none";
			paperTitleError.style.display="none";
			titlePCError.style.display="none";
			yearError.style.display="none";
			WTPAISError.style.display="none";
			publisherNameError.style.display="none";
			teacherNameError.style.display="none";
			
			ISBN_ISSN.style.display="block";
			ISBN_ISSNlabel.style.display="block";
			ISBN_ISSN.value="";
			ISBN_ISSNprev.value="";
			ISBN_ISSN.readOnly=false;
			
			bookTitle.style.display="none";
			bookTitleLabel.style.display="none";
			bookTitle.value="";
			bookTitlePrev.value="";
			bookTitle.readOnly=false;
			
			paperTitle.style.display="none";
			paperTitleLabel.style.display="none";
			paperTitle.value="";
			paperTitlePrev.value="";
			paperTitle.readOnly=false;
			
			titlePC.style.display="none";
			titlePClabel.style.display="none";
			titlePC.value="";
			titlePCprev.value="";
			titlePC.readOnly=false;
			
			year.style.display="none";
			yearLabel.style.display="none";
			year.value="";
			yearPrev.value="";
			year.readOnly=false;
			
			WTPAIS.style.display="none";
			WTPAISlabel.style.display="none";
			WTPAIS.value="";
			WTPAISprev.value="";
			WTPAIS.disabled=false;
			
			publisherName.style.display="none";
			publisherNameLabel.style.display="none";
			publisherName.value="";
			publisherNamePrev.value="";
			publisherName.readOnly=false;
			
			teacherName.style.display="none";
			teacherNameLabel.style.display="none";
			teacherName.value="";
			teacherNamePrev.value="";
			teacherName.readOnly=false;
			
			searchBtn.style.display="block";
			searchBtn.disabled=true;
			submitBtn.style.display="none";
			editBtn.style.display="none";
			check();
		}
		
		//Search Button Functionality
		function searchISBN(){
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'SearchServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	error = [1,0,0,0,0,0,0,0];
			    	form.action="PublishedBooksServlet";
			    	
					ISBN_ISSN.style.display="block";
					ISBN_ISSN.readOnly=true;
					
					bookTitle.style.display="block";
					bookTitleLabel.style.display="block";
					
					paperTitle.style.display="block";
					paperTitleLabel.style.display="block";
					
					titlePC.style.display="block";
					titlePClabel.style.display="block";
					
					year.style.display="block";
					yearLabel.style.display="block";
					
					WTPAIS.style.display="block";
					WTPAISlabel.style.display="block";
					
					publisherName.style.display="block";
					publisherNameLabel.style.display="block";
					
					teacherName.style.display="block";
					teacherNameLabel.style.display="block";
					
					searchBtn.style.display="none";
					submitBtn.style.display="block";
					submitBtn.disabled=true;
			    	if(this.responseText===""){
			    		console.log(0);	
			    	}else{
			    		error = [1,1,1,1,1,1,1,0];
			    		let data=this.responseText.split(" ");
			    		
			    		bookTitle.value=data[0];
			    		bookTitlePrev.value=data[0];
			    		bookTitle.readOnly=true;
			    		
			    		paperTitle.value=data[1];
			    		paperTitlePrev.value=data[1];
			    		paperTitle.readOnly=true;
			    		
			    		titlePC.value=data[2];
			    		titlePCprev.value=data[2];
			    		titlePC.readOnly=true;
			    		
			    		year.value=data[3];
			    		yearPrev.value=data[3];
			    		year.readOnly=true;
			    		
			    		WTPAIS.value=data[4];
			    		WTPAISprev.value=data[4];
			    		WTPAIS.disabled=true;
			    		
			    		publisherName.value=data[5];
			    		publisherNamePrev.value=data[5];
			    		publisherName.readOnly=true;
			    	}
		 		check();
			    }
			    else{
			    	alert("Some Error Occured");
			    }
		 	}
		 	
		 	// send the request
		    xhr.send("ISBN="+ISBN_ISSN.value);
		}
		
		//Edit button Functionality
		function edit(teacherNameV,bookTitleV,paperTitleV,titlePCV,yearV,ISBN_ISSNV,WTPAISV,publisherNameV){
			let myModal = new bootstrap.Modal(document.getElementById('Modal'), {});
			myModal.show();
			form.action="PublishedBooksEditServlet";
			error = [1,1,1,1,1,1,1,1];
			
			ISBN_ISSNError.style.display="none";
			bookTitleError.style.display="none";
			paperTitleError.style.display="none";
			titlePCError.style.display="none";
			yearError.style.display="none";
			WTPAISError.style.display="none";
			publisherNameError.style.display="none";
			teacherNameError.style.display="none";
			
			ISBN_ISSN.readOnly=false;
			ISBN_ISSN.value=ISBN_ISSNV;
			ISBN_ISSNprev.value=ISBN_ISSNV;
			
			bookTitle.style.display="block";
			bookTitle.readOnly=false;
			bookTitle.value=bookTitleV;
			bookTitlePrev.value=bookTitleV;
			bookTitleLabel.style.display="block";
			
			paperTitle.style.display="block";
			paperTitle.readOnly=false;
			paperTitle.value=paperTitleV;
			paperTitlePrev.value=paperTitleV;
			paperTitleLabel.style.display="block";
			
			titlePC.style.display="block";
			titlePC.readOnly=false;
			titlePC.value=titlePCV;
			titlePCprev.value=titlePCV;
			titlePClabel.style.display="block";
			
			year.style.display="block";
			year.readOnly=false;
			year.value=yearV;
			yearPrev.value=yearV;
			yearLabel.style.display="block";
			
			WTPAIS.style.display="block";
			WTPAIS.disabled=false;
			WTPAIS.value=WTPAISV;
			WTPAISprev.value=WTPAISV;
			WTPAISlabel.style.display="block";
			
			publisherName.style.display="block";
			publisherName.readOnly=false;
			publisherName.value=publisherNameV;
			publisherNamePrev.value=publisherNameV;
			publisherNameLabel.style.display="block";
			
			teacherName.style.display="block";
			teacherName.readOnly=false;
			teacherName.value=teacherNameV;
			teacherNamePrev.value=teacherNameV;
			teacherNameLabel.style.display="block";
			
			searchBtn.style.display="none";
			submitBtn.style.display="none";
			editBtn.style.display="block";
			editBtn.disabled=false;
		}
		
		function downloadClickHandler(){
			console.log("ok");
			// Instantiate an xhr object
		    const xhr = new XMLHttpRequest();
			
		 	// USE THIS FOR POST REQUEST
		    xhr.open('POST', 'PublishedBooksDownloadServlet', true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    
		 	// What to do when response is ready
		    xhr.onload = function (){
			    if(this.status === 200){
			    	if(this.responseText==="0"){
			    		alert("Some Error Occured");
			    	}else{
			    		document.getElementById("alert").innerHTML=`
				    		<div class="alert alert-success alert-dismissible fade show" role="alert">
				      			The file has been saved in Downloads folder.
				  				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    				<span aria-hidden="true">&times;</span>
				  				</button>
							</div>`;
			    	}
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