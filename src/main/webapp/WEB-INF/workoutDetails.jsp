<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Workout Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class="detailHeader">
			<h1>This Workout was created by ${oneWorkout.user.firstName} ${oneWorkout.user.lastName}</h1>
		</div>
		<h3 style="text-align:center; margin-top: 10px;"> Here are the details about this workout:</h3>
		<div class="detailMain">
			<div class="detailMainLeft">
				<h4>Title: ${oneWorkout.title }</h4>
				<h4>Description: ${oneWorkout.description }</h4>
				<h4>Exercise: ${oneWorkout.exercise }</h4>
			</div>
			<div class= "detailMainRight">
				<img src="${oneWorkout.workoutImagePath}"/>
				<div class="comments">
					
				</div>
			</div>
		</div>
		<div>
			<a href="/">Go to dashboard</a>
		</div>
	</div>
</body>
</html>