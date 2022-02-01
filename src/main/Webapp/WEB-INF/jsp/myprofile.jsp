<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/logincss.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</head>
<script>
	function validateForm() {
		let x = document.forms["user"]["fullname"].value;
		if (x == "") {
			document.getElementById("namemust").innerHTML = "This field is required";
			return false;
		}
	}
</script>
<body>

	<%@include file="header.jsp"%>
	<div class="container">
		<div class="col-md-12 col-sm-12" align="center">
			<div class="col-sm-6">
				<div class="panel-body" align="center">
					<form name='user' action="/updateprofile" method='POST'
						onsubmit="return validateForm()">
						<div class="form-group">
							<input type="hidden" value="${userdetails.id}" name="id" /> <label>Full
								Name</label> <input type="text" class="form-control" id="fullname"
								value="${userdetails.fullname}" name="fullname"
								placeholder="Full Name"> <span style="color: red;"
								id="namemust"></span>
						</div>
						<div class="form-group">
							<label>User Name</label> <input type="text" class="form-control"
								id="username" value="${userdetails.username}" readonly
								name="username">
						</div>
						<div class="form-group">
							<label>Roles</label> <input type="text" class="form-control"
								id="password" value="${loggedrole}" name="roleName"
								placeholder="Password">
						</div>
						<button type="submit" class="btn btn-success">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>