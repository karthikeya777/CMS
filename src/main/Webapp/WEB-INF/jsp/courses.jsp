<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>courses</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>

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
			<c:if test="${loggedrole eq 'ADMIN'}">
				<div class="mr-2" align="right">
					<h6>
						<a href="<%=request.getContextPath()%>/course/addcourse">
							<button type="submit" class="btn btn-success">Add Course</button>
						</a>
					</h6>
				</div>
			</c:if>
			<div class="col-sm-12" align="center">
				<div class="panel-body" align="center">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th style="display: none;">ID</th>
								<th>Course Name</th>
								<th>Duration</th>
								<th>Trainer</th>
								<th>Action</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="course" items="${listcourse}">
								<tr>
									<td style="display: none;">${course.getId()}</td>
									<td>${course.getCourseName()}</td>
									<td>${course.getDuration()}</td>
									<td>${course.getTrainer()}</td>
									<td><c:if test="${loggedrole eq 'STUDENT'}">
											<c:if test="${empty course.getEnrolledStudent()}">
												<a
													href="<%=request.getContextPath()%>/course/enroll/${course.id}">
													<button type="submit" class="btn btn-success">Enroll</button>
												</a>
											</c:if>
										</c:if> <c:if
											test="${loggedrole eq 'ADMIN' || loggedrole eq 'TRAINER'}">
											<a
												href="<%=request.getContextPath()%>/course/edit/${course.id}">
												<button type="submit" class="btn btn-success">Edit</button>
											</a>
											<a
												href="<%=request.getContextPath()%>/course/delete/${course.id}">
												<button type="submit" class="btn btn-danger">Delete</button>
											</a>
										</c:if></td>

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