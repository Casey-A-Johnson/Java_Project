<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Workout</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class="createMain">
			<div class="createForm">
				<form:form action="/create/workout" method = "post" modelAttribute="workout" enctype="multipart/form-data">
					<h1>Create new workout</h1>
					<div class="mb-3">
						<form:label class="form-label" path = "image">Image upload:</form:label>
						<input class="form-control" type = "file" name="fileImage" id="fileImage" accept="image/png, image/jpeg"/>
						<div>
							<form:errors class= "errors" path = "image"/>
						</div>
					</div>
					<div class="mb-3">
						<form:label class="form-label" path = "title">Title:</form:label>
						<form:input class="form-control" type = "text" path = "title"/>
						<div>
							<form:errors class= "errors" path = "title"/>
						</div>
					</div>
					<div class="mb-3">
						<form:label class="form-label" path = "description">Description:</form:label>
						<form:input class="form-control" type = "text" path = "description"/>
						<div>
							<form:errors class= "errors" path = "description"/>
						</div>
					</div>
					<div class="mb-3">
						<form:label class="form-label" path = "exercise">Workout:</form:label>
						<form:input class="form-control" type = "text" path = "exercise"/>
						<div>
							<form:errors class= "errors"  path = "exercise"/>
						</div>
					</div>
					<div class="mb-3">
						<form:label class="form-label" path = "category">Category:</form:label>
						<form:select class="form-control" path = "category">
							<form:option value="Chest" path="category">Chest</form:option>
							<form:option value="Arms" path="category">Arms</form:option>
							<form:option value="Back" path="category">Back</form:option>
							<form:option value="Legs" path="category">Legs</form:option>
							<form:option value="Full Body" path="category">Full Body</form:option>
							<form:option value="Yoga" path="category">Yoga</form:option>
							<form:option value="HITT" path="category">HITT</form:option>
							<form:option value="Cardio" path="category">Cardio</form:option>
						</form:select>
						<div>
							<form:errors class= "errors"  path = "category"/>
						</div>
					</div>
					<form:hidden path="user" value="${userId }"/>
						<button class="btn btn-outline-success" type= "submit">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>