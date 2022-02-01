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
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<div class="col-md-12 col-sm-12">
			<div class="col-sm-12" align="center">
				<div class="panel-body" align="center">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
								<th>Student</th>
								<th>Username</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="student" items="${studentlist}">
								<tr>
									<td>${student.getId()}</td>
									<td>${student.getFullname()}</td>
									<td>${student.getUsername()}</td>
									<td><a
										href="<%=request.getContextPath()%>/student/delete/${student.getId()}">
											<button type="submit" class="btn btn-danger">Delete</button>
									</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</body>
</html>