<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categories</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class="categoryBanner">
			<h1>${category } Category</h1>
		</div>
		<div class="categoryWorkoutsMain">
			<c:forEach var="workout" items="${workoutList }">
				<c:if test="${workout.category == category }">
					<div id="workoutCard">
						<a href="/workout/${workout.id}"><img src="${workout.workoutImagePath}"/></a>
						<h3>${workout.title }</h3>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div style="display:flex; justify-content: space-between; margin-top:25px;">
			<h1></h1>
			<a href="/categories">Go Back</a>
		</div>
	</div>
</body>
</html>