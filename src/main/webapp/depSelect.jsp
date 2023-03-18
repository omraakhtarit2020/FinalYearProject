<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TINT Digital Resource Library</title>
</head>

<body>
	<%@ include file="nav.jsp" %>

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
					href="StaffInfo.jsp?dep=${'applied electronics and instrumentation engineering (aeie)'}">AEIE</a>
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
</body>
</html>