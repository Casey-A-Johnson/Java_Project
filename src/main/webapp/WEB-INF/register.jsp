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
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Crete+Round&family=Inter:wght@200&family=Prata&display=swap" rel="stylesheet"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class="navbar">
			<nav id= "navbar" class="navbar navbar-expand-lg bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="/">Website name</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">Home</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Link</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Profile
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="#">Workouts</a></li>
			            <li><a class="dropdown-item" href="#">Tracker</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">Something else here</a></li>
			          </ul>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link disabled">Disabled</a>
			        </li>
			      </ul>
			      <form class="d-flex" role="search">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
			</nav>
		</div>
		<div class= "registerMain">
			<div class="registerForm">
					<form:form action="/register" method = "post" modelAttribute="newUser">
						<h1>Register</h1>
						<div class="mb-3">
							<form:label class="form-label" path = "firstName">First Name</form:label>
							<form:input class="form-control" type = "text" path = "firstName"/>
							<div>
								<form:errors class= "errors" path = "firstName"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label class="form-label" path = "lastName">Last Name</form:label>
							<form:input class="form-control" type = "text" path = "lastName"/>
							<div>
								<form:errors class= "errors" path = "lastName"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label class="form-label" path = "email">Email</form:label>
							<form:input class="form-control" type = "email" path = "email"/>
							<div>
								<form:errors class= "errors"  path = "email"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label class="form-label" path = "password">Password</form:label>
							<form:input class="form-control" type = "text" path = "password"/>
							<div>
								<form:errors class= "errors" path = "password"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label class="form-label" path = "confirmPassword">Confirm Password</form:label>
							<form:input class="form-control" type = "text" path = "confirmPassword"/>
							<div>
								<form:errors class= "errors" path = "confirmPassword"/>
							</div>
						</div>
						<button class="btn btn-outline-success" type= "submit">Submit</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>