<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/register.css"> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Crete+Round&family=Inter:wght@200&family=Prata&display=swap" rel="stylesheet"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class="registerNavbar">
			<ul>
			   <li><a href="#">Website name</a></li>
			   <li><a href="/">Dashboard</a></li>
			   <li><a href="/categories">Categories</a></li>
			   <li><a href="#">Portfolio</a></li>
			</ul>
		</div>
		<div class= "registerMain">
			<div class="registerForm">
					<form:form action="/register" method = "post" modelAttribute="newUser">
						<h1 style="color: #fff;">Register</h1>
						<div class="mb-3">
							<form:label style="color: #fff;" class="form-label" path = "firstName">First Name</form:label>
							<form:input class="form-control" type = "text" path = "firstName"/>
							<div>
								<form:errors class= "errors" path = "firstName"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label style="color: #fff;" class="form-label" path = "lastName">Last Name</form:label>
							<form:input class="form-control" type = "text" path = "lastName"/>
							<div>
								<form:errors class= "errors" path = "lastName"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label style="color: #fff;" class="form-label" path = "email">Email</form:label>
							<form:input class="form-control" type = "email" path = "email"/>
							<div>
								<form:errors class= "errors"  path = "email"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label style="color: #fff;" class="form-label" path = "password">Password</form:label>
							<form:input class="form-control" type = "text" path = "password"/>
							<div>
								<form:errors class= "errors" path = "password"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label style="color: #fff;" class="form-label" path = "confirmPassword">Confirm Password</form:label>
							<form:input class="form-control" type = "text" path = "confirmPassword"/>
							<div>
								<form:errors class= "errors" path = "confirmPassword"/>
							</div>
						</div>
						<button id="button" class="btn btn-outline-success" type= "submit">Submit</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>