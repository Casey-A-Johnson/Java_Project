<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/login.css"> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Crete+Round&family=Inter:wght@200&family=Prata&display=swap" rel="stylesheet"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "loginContainer">
		<div class="loginNavbar">
			<ul>
			   <li><a href="#">Website name</a></li>
			   <li><a href="/">Dashboard</a></li>
			   <li><a href="/categories">Categories</a></li>
			   <li><a href="#">Portfolio</a></li>
			</ul>
		</div>
		<div class="loginMain">
			<div class="loginForm">
				<form:form action = "/login" method = "post" modelAttribute="newLogin">
					<h1 style="color: #fff;">Login</h1>
					<div class="mb-3">
						<form:label  style="color: #fff;" class="form-label" path = "email">Email</form:label>
						<form:input class="form-control" type = "email" path = "email"/>
						<div>
							<form:errors class= "errors" path = "email"/>
						</div>
					</div>
					<div class="mb-3">
						<form:label  style="color: #fff;" class="form-label" path = "password">Password</form:label>
						<form:input class="form-control" type = "password" path = "password"/>
						<div>
							<form:errors class= "errors" path = "password"/>
						</div>
					</div>
					<button id ="button" class="btn btn-outline-success" type= "submit">Login</button>
				</form:form>
			</div>
		</div>
		<div style="display: flex; justify-content: center; margin-top: 100px;">
			<a style="color: #fff;" href="/register"><p>Don't have an account? Click her to register new account</p></a>
		</div>
	</div>
</body>
</html>