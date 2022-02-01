<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>courses</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/logincss.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</head>
<script>
	function validateForm() {
		let coursename = document.forms["course"]["courseName"].value;
		if (coursename == "") {
			document.getElementById("coursenamemust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("coursenamemust").innerHTML = "";
		}

		let duration = document.forms["course"]["duration"].value;
		if (duration == "") {
			document.getElementById("durationmust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("durationmust").innerHTML = "";
		}

		let fees = document.forms["course"]["fees"].value;
		if (fees == "") {
			document.getElementById("feesmust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("feesmust").innerHTML = "";
		}
	}
</script>
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<div class="col-md-12 col-sm-12">
			<c:if test="${courseAdd eq 'add'}">
				<h2 align="center">Add Course</h2>
			</c:if>
			<c:if test="${courseAdd ne 'add'}">
				<h2 align="center">Update Course</h2>
			</c:if>

			<form name='course' action="/course/save" method='POST'
				onsubmit="return validateForm()">
				<div class="form-group">
					<input type="hidden" name="id" value="${course.getId()}" /> <label>Course
						Name</label> <input type="text" class="form-control" id="coursename"
						name="courseName" placeholder="Course Name"
						value="${course.getCourseName()}"><span
						style="color: red;" id="coursenamemust"></span>
				</div>
				<div class="form-group">
					<label>Duration</label> <input type="text" class="form-control"
						id="duration" name="duration" placeholder="Duration"
						value="${course.getDuration()}"><span style="color: red;"
						id="durationmust"></span>
				</div>
				<div class="form-group">
					<label>Fees</label> <input type="text" class="form-control"
						id="fees" name="fees" placeholder="Fees"
						value="${course.getFees()}"><span style="color: red;"
						id="feesmust"></span>
				</div>
				<input type="hidden" id="enrolledStudent" class="form-control"
					name="enrolledStudent" placeholder="">
				<div class="form-group">
					<label>Trainer</label> <select class="form-control" id="trainer"
						name='trainer'>
						<c:forEach items="${trainerlist}" var="trainer">
							<option value="${trainer.getFullname()}"
								${trainer.getFullname() == course.getTrainer() ?"selected" : ""}>${trainer.getFullname()}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit" class="btn btn-success">Save</button>
			</form>
		</div>
	</div>
</body>
</html>