<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
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
			<ul>
			   <li><a href="#">Website name</a></li>
			   <li><a href="/">Dashboard</a></li>
			   <li><a href="/categories">Categories</a></li>
			   <c:choose>
			   		<c:when test="${userId == null }">
			   			<li><a href="/login">Sign in</a></li>
			   		</c:when>
			   		<c:otherwise>
			   			<li><a href="/create/workout">Add Workout</a></li>
			   		</c:otherwise>
			   </c:choose>
			</ul>
			<c:if test="${userId != null }">
				<div class="dropdown">
				  <p class="dropbtn">Profile</p>
				  <div class="dropdown-content">
				    <a href="/${firstName}/workouts">Your workouts</a>
				    <a href="#">Liked Workouts</a>
				    <a href="/logout">Logout</a>
				  </div>
				</div>
			</c:if>
		</div>
		<div class= "main">
			<div class="banner">
				<img src="<c:url value='/resources/images/banner.png'/>"/>
			</div>
			<div class="subbanner">
				<h1>Featured Workouts</h1>
			</div>
			<div class="featuredIMG">
				<c:forEach var="workout" items="${workoutList }">
					<div id="card">
						<a href="/workout/${workout.id}"><img src="${workout.workoutImagePath}"/></a>
						<p>${workout.title }</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>