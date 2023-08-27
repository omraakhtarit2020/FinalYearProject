<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <style type="text/css">
 
     .cardhov:hover{
      box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
     }
     .link:hover{
        text-decoration:none;
     }
     .pb:hover{
       background: #fda0a0;
     }
     .jf:hover{
       background: #DFCCFB;
     }
     .aw:hover{
       background: #ade7f3;
     }
     .co:hover{
       background: #A8DF8E;
     }
     .ex:hover{
       background: #FBFFDC;
     }
     .te:hover{
       background: #C4C1A4;
     }
 </style>
</head>
<body>
	<%@ include file="nav.jsp" %>
	
	<h2 class="text-center my-2">REPORTS</h2>
	<div id="alert"></div>
	
	<div class="row m-3">
  		<div class="col-sm-3 mb-3">
    		<div class="card cardhov text-center" style="border-radius: 10px; height:240px;">
      			<div class="card-body pb ">
      				<p class="mt-5"><h4>NAAC Clause 3.2.2</h4></p>
        			<a href="PublishBook.jsp" class="link" style="cursor:pointer"><h5 class="card-title"> Published Books</h5></a>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card cardhov text-center" style="border-radius: 10px; height:240px;">
      			<div class="card-body jf ">
      				<p class="mt-5"><h4>NAAC Clause 3.2.1</h4></p>
        			<a href="journals.jsp" class="link" style="cursor:pointer"><h5 class="card-title">Journals of Faculty</h5></a>
      			</div>
    		</div>
  		</div>
  		
  		<div class="col-sm-3 mb-3">
    		<div class="card cardhov text-center" style="border-radius: 10px; height:240px;">
      			<div class="card-body aw">
      				<p class="mt-5"><h4>NAAC Clause 3.3.2</h4></p>
        			<a href="awards.jsp" class="link" style="cursor:pointer"><h5 class="card-title">Awards</h5></a>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card cardhov text-center" style="border-radius: 10px; height:240px;">
      			<div class="card-body co">
      				<p class="mt-5"><h4>NAAC Clause 3.4.1</h4></p>
        			<a href="collaboration.jsp" class="link" style="cursor:pointer"><h5 class="card-title">Collaboration</h5></a>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card cardhov text-center" style="border-radius: 10px; height:240px;">
      			<div class="card-body ex">
      				<p class="mt-5"><h4>NAAC Clause 3.3.4</h4></p>
        			<a href="extension.jsp" class="link" style="cursor:pointer"><h5 class="card-title">Extension/Outreach Program</h5></a>
      			</div>
    		</div>
  		</div>
  		<div class="col-sm-3 mb-3">
    		<div class="card cardhov text-center" style="border-radius: 10px; height:240px;">
      			<div class="card-body te">
      				<p class="mt-5"><h4>NAAC Clause 3.1.3</h4></p>
        			<a href="Program.jsp" class="link" style="cursor:pointer"><h5 class="card-title">Tech Programs</h5></a>
      			</div>
    		</div>
  		</div>
  		
  		
	
	<script type="text/javascript">

	}
	</script>
	
	
</body>
</html>