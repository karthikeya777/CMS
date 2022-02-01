<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<div class="col-md-12 col-sm-12">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="/"> <img
				src="/img/coursemanagement.png" alt="course" height="36"> CMS
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="<%=request.getContextPath()%>/">Home <span
							class="sr-only">(current)</span>
					</a></li>

					<!-- if loggedin user has role admin -->
					<c:if test="${loggedrole eq 'ADMIN' }">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/student">Students</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/trainer">Trainers</a></li>
					</c:if>

					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/course">Courses</a></li>

					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/">About us</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/">Contact us</a></li>
				</ul>

				<ul class="navbar-nav my-2 my-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">${loggedinUser}<br>${loggedrole}
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/myprofile">Edit Profile</a>
							<a class="dropdown-item" href="/logout-success">Sign out</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>