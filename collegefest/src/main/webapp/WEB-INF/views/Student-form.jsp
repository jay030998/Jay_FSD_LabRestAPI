<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>save student</title>
</head>
<body>

<div class="container">
		<h3>Student Directory</h3>
		<hr>
		
		<p class="h4 mb-4">Student</p>
		
		<form action="/StudentManagement/student/save" method="POST">
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name ="id" value="${Student.id }" />
			
			<div class="form-inline">
			
				<input type="text" name="firstName" value="${Student.firstName }"
					class="form-control mb-4 col-4" placeholder="FirstName">
			
			</div>
			
			<div class="form-inline">
			
				<input type="text" name="lastName" value="${Student.lastName }"
					class="form-control mb-4 col-4" placeholder="LastName">
			
			</div>
			
			<div class="form-inline">
			
				<input type="text" name="course" value="${Student.course }"
					class="form-control mb-4 col-4" placeholder="Course">
			
			</div>
			
			<div class="form-inline">
			
				<input type="text" name="country" value="${Student.country }"
					class="form-control mb-4 col-4" placeholder="Country">
			
			</div>
		
			<button type="submit" class="btn btn-info col-2">Save</button>
			
		</form>
		
		<hr>
		<a href="StudentManagement/student/list">Back to Students list</a>
		
	</div>
	
</body>
</html>