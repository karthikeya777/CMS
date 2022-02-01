<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/logincss.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="sidenav">
		<div class="login-main-text">
			<h2>
				Course Management<br> Login Page
			</h2>
			<p>Login or register from here to access.</p>
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<p style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
			<div class="login-form">
				<form name='User' action="login" method='POST'>
					<div class="form-group">
						<label>User Name</label> <input type="text" class="form-control"
							name="username" placeholder="User Name">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password" name='password'
							class="form-control" placeholder="Password">
					</div>
					<button type="submit" class="btn btn-success">Login</button>
				</form>
				<a href="<%=request.getContextPath()%>/registration"
					style="text-decoration: none; float: right;">
					<button type="submit" class="btn btn-success">Register</button>
				</a>
			</div>
		</div>
	</div>

	<%-- <h1 class="mb-5">Login</h1>
	<div class=" col-md-12 mt-5 d-flex justify-content-center">
		<p style="color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
		<form name='UserLogin' action="login" method='POST'>
			<table>
				<tr>
					<td>User:</td>
					<td><input type='text' name='username' value=''
						class="form-control"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='password' name='password'
						class="form-control" /></td>
				</tr>
				<tr>
					<td><input name="submit" type="submit" value="Login"
						style="float: right;" /></td>
				</tr>
			</table>
		</form>

		<div style="float: right;">
			<a href="<%=request.getContextPath()%>/register"
				style="text-decoration: none; float: right;">SignUp</a>
		</div>
	</div> --%>
</body>
</html>