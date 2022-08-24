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
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Crete+Round&family=Inter:wght@200&family=Prata&display=swap" rel="stylesheet"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body style="background-color: #d9d9d9;">
	<div class = "container" style="background-color: #d9d9d9">
		<div class="navbar">
			<div id= "navbar" class="navbar navbar-expand-lg" >
			  <div class="container-fluid">
			    <a class="navbar-brand" href="#">Website name</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">Home</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Categories
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="/category/Chest/workouts">Chest</a></li>
			            <li><a class="dropdown-item" href="/category/Arms/workouts">Arms</a></li>
			            <li><a class="dropdown-item" href="/category/Back/workouts">Back</a></li>
			            <li><a class="dropdown-item" href="/category/Legs/workouts">Legs</a></li>
			            <li><a class="dropdown-item" href="/category/Full Body/workouts">Full Body</a></li>
			            <li><a class="dropdown-item" href="/category/Yoga/workouts">Yoga</a></li>
			            <li><a class="dropdown-item" href="/category/HITT/workouts">HITT</a></li>
			            <li><a class="dropdown-item" href="/category/Cardio/workouts">Cardio</a></li>
			          </ul>
			        </li>
			        <c:if test="${userId!= null }">
		        		<li class="nav-item dropdown">
				          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            ${firstName }
				          </a>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="/${firstName }/workouts">Workouts</a></li>
				            <li><a class="dropdown-item" href="#">Tracker</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="/logout">Logout</a></li>
				          </ul>
		        		</li>
			        </c:if>
			      </ul>
			      <form class="d-flex" role="search">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
			</div>
		</div>
		<div class= "main">
			<div class="mainLeft">
				<a href="/categories"><p>Workouts</p></a>
				<c:if test="${userId != null }">
					<a href="/create/workout"><p>Add Workout</p></a>
				</c:if>
				<a href=""><p>Dashboard</p></a>
				<c:choose>
					<c:when test="${userId== null }">
						<a href="/login"><p>Login</p></a>
					</c:when>
					<c:otherwise>
						<a href="/logout"><p>Logout</p></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="mainRight">
				<div class="banner">
					<img src="<c:url value='/resources/images/banner.png'/>"/>
				</div>
				<div class="subbanner">
					<h3>Featured Workouts</h3>
				</div>
				<div class="featuredIMG">
					<c:forEach var="workout" items="${workoutList }">
						
							<div id="card2">
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