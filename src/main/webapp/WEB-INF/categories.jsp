<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Workout Categories</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/category.css"> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Crete+Round&family=Inter:wght@200&family=Prata&display=swap" rel="stylesheet"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class="categoryMain">
			<div class="categoryMainLeft">
				<ul>
					<li><a href='/'>Dashboard</a></li>
					<li><a>Add Workout</a></li>
					<li><a href="/logout">Logout</a></li>
				</ul>
			</div>
			<div class="categoryMainRight">
				<ul class="categoryNavbar">
						<li><a href="/category/Chest/workouts">Chest</a></li>
						<li><a href="/category/Arms/workouts">Arms</a></li>
						<li><a href="/category/Back/workouts">Back</a></li>
						<li><a href="/category/Legs/workouts">Legs</a></li>
						<li><a href="/category/Full Body/workouts">Full Body</a></li>
						<li><a href="/category/Yoga/workouts">Yoga</a></li>
						<li><a href="/category/HITT/workouts">HITT</a></li>
						<li><a href="/category/Cardio/workouts">Cardio</a></li>
				</ul>
				<div class= "categorySubbanner">
					<h3>Featured Workouts</h3>
				</div>
				<%--For each workout will go here to reduce the code. This is just place holder for now. --%>
				<div class="featuredWorkouts">
					<c:forEach var="workout" items="${workoutList }">
							<div id="card">
								<a href="/workout/${workout.id}"><img src="${workout.workoutImagePath}"/></a>
								<p>${workout.title }</p>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>