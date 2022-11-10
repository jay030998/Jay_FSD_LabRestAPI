<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Student directory</title>
</head>
<body>

<div class="container">
		<h3>Students Directory</h3>
		<hr>
	
	
	<form action="/StudentManagement/student/list" class="form-inline">
		<!-- Add a button -->
		<a href="/StudentManagement/student/showFormForAdd"
			class="btn btn-primary btn-sm mb-3">Add Student</a>
			
	</form>
	
	<table class="table table-bordered table-striped">
		<thead class="thead-dark">
			<tr>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Course</th>
				<th>Country</th>
				<th>Action</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${Students}" var="tempStudent">
				<tr>
					<td><c:out value="${tempStudent.firstName}" /></td>
					<td><c:out value="${tempStudent.lastName}" /></td>
					<td><c:out value="${tempStudent.course}" /></td>
					<td><c:out value="${tempStudent.country}" /></td>
					
					<td>
						<!-- Add update button/link -->
						<a href="/StudentManagement/student/showFormForUpdate?studentId=${tempStudent.id}"
						class="btn btn-info btn-sm">Update</a>
						
						<!-- Add delete button/link -->
						<a href="/StudentManagement/student/delete?studentId=${tempStudent.id}"
						class="btn btn-danger btn-sm" 
						onclick="if (!(confirm('Are you sure you want to delete this Student?'))) return false">
						Delete</a>
						
					</td>
				</tr>
			</c:forEach>
		</tbody>	
			
	</table>
	</div>
	
</body>
</html>