<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored = "false" %>
<%@page import = "com.dao.JobDAO" import = "com.DB.DBConnect" import = "com.entity.Jobs" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file = "all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url = "login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<c:if test="${not empty succMsg }">
				  			<div class="alert alert-success" role="alert">
  								${ succMsg}
							</div>
							<c:remove var="succMsg"/>
				  		</c:if>
				<%JobDAO j = new JobDAO(DBConnect.getConnect());
						List<Jobs> l = j.getAllJobs();
						for(Jobs j1: l) {
						%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						
						<h6><%=j1.getTitle() %></h6>
						<p><%=j1.getDescription() %></p>
						<br>
							<div class="form-row">
								<div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm"
									value="Location:<%=j1.getLocation() %>" readonly>
								</div>
								<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
								value="Category:<%=j1.getCategory() %>" readonly>
								</div>
								<div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm"
									value="Status:<%=j1.getStatus()%>" readonly>
								</div>
							</div>
						<h6>Publish Date: 22-05-2022</h6>
						<div class="text-center ">
							<a href="edit_jobs.jsp?id=<%=j1.getId()%>" class="btn btn-sm bg-success text-white">Edit</a>
							<a href="delete?id=<%=j1.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
				</div>
			</div>
		<%} %>
	</div>
	</div>
	</div>
</body>
</html>