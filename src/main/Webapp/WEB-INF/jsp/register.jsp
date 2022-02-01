<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/logincss.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>
	function validateForm() {
		let fullname = document.forms["user"]["fullname"].value;
		if (fullname == "") {
			document.getElementById("fullnamemust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("fullnamemust").innerHTML = "";
		}

		let username = document.forms["user"]["username"].value;
		if (username == "") {
			document.getElementById("usernamemust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("usernamemust").innerHTML = "";
		}

		let password = document.forms["user"]["password"].value;
		if (password == "") {
			document.getElementById("passwordmust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("passwordmust").innerHTML = "";
		}

		let confirmpassword = document.forms["user"]["confirmPassword"].value;
		if (confirmpassword == "") {
			document.getElementById("cpasswordmust").innerHTML = "This field is required";
			return false;
		} else {
			document.getElementById("cpasswordmust").innerHTML = "";
		}

		if (password != confirmpassword) {
			document.getElementById("passwordmust").innerHTML = "Password and Confirm password doesn't match";
			return false;
		}
	}
</script>
</head>
<body>

	<div class="sidenav">
		<div class="login-main-text">
			<h2>
				Course Management<br> Register Page
			</h2>
			<p>Login or register from here to access.</p>
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<p style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
			<div class="register-form">
				<form name='user' action="/registration" method='POST'
					onsubmit="return validateForm()">
					<div class="form-group">
						<label>Full Name</label> <input type="text" class="form-control"
							id="fullname" name="fullname" placeholder="Full Name"><span
							style="color: red;" id="fullnamemust"></span>
					</div>
					<div class="form-group">
						<label>User Name</label> <input type="email" class="form-control"
							id="username" name="username" placeholder="User Name" required><span
							style="color: red;" id="usernamemust"></span>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="text" class="form-control"
							id="password" name="password" placeholder="Password"><span
							style="color: red;" id="passwordmust"></span>
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							id="confirmpassword" class="form-control" name="confirmPassword"
							placeholder="User Name"><span style="color: red;"
							id="cpasswordmust"></span>
					</div>
					<div class="form-group">
						<label>Roles</label> <select class="form-control" id="roles"
							name='roleName'>
							<c:forEach items="${roles}" var="role">
								<option value="${role.getName()}">${role.getName()}</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-success">Register</button>
				</form>
				<a href="<%=request.getContextPath()%>/login"
					style="text-decoration: none; float: right;">already have
					account </a>
			</div>
		</div>
	</div>










	<h1>Register</h1>
	<%-- 	<div class=" col-md-12 mt-5 d-flex justify-content-center">
		<form name='user' action="/registeruser" method='POST'>
			<table>
				<tr>
					<td>Name:</td>
					<td><input type='text' name='fullname' value=''></td>
				</tr>
				<tr>
					<td>User:</td>
					<td><input type='text' name='username' value=''></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='text' name='password' /></td>
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><input id="confirmpassword" type='password'
						name='confirmPassword' /></td>
				</tr>
				<tr>
					<td>Roles:</td>
					<td><select class="form-control" id="roles" name='roleName'>
							<c:forEach items="${roles}" var="role">
								<option value="${role.getName()}">${role.getName()}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><input name="submit" type="submit" value="submit" /></td>
				</tr>
			</table>
		</form>
		<div style="float: right;">
			<p>
				<a href="<%=request.getContextPath()%>/login"
					style="text-decoration: none; float: right;">already have
					account</a>
			</p>
		</div>
	</div> --%>
</body>
</html>