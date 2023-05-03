 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored = "false" %>
<%@page import = "com.dao.JobDAO" import = "com.DB.DBConnect" import = "com.entity.Jobs" import = "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.c1{
	height: 100vh;
}
</style>
<%@include file = "all_component/all_css.jsp" %>
</head>
<body>
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url = "login.jsp"></c:redirect>
	</c:if>
	<%@include file = "all_component/navbar.jsp" %>
	<div class = "container p-2" style = "height: 87vh; background-color: #f0f1f2;">
		<div class = "col-md-10 offset-md-1">
			<div class = "card">
				<div class = "card-body">
					<div class = "text-center text-success">
				  		<i class = "fas fa-user-friends fa-3x" ></i>
				  		
				  		<c:if test="${not empty succMsg }">
				  			<div class="alert alert-success" role="alert">
  								${ succMsg}
							</div>
							<c:remove var="succMsg"/>
				  		</c:if>
				  		<%int id = Integer.parseInt(request.getParameter("id"));
				  			JobDAO jd = new JobDAO(DBConnect.getConnect());
				  			Jobs j = jd.getJobById(id);
				  		%>
				  		<h5> Edit Jobs</h5>
					</div>
	
					<form action = "edit_job" method = "post">
						<input type="hidden" value ="<%=j.getId()%>" name = "id">
						
						<div class = "form-group">
							<label>Enter Title</label><input type = "text" name = "title" required  class = "form-control" value = "<%=j.getTitle() %>" >
						</div>
						
						<div class = "form-row">
							<div class = "form-group col-md-4">
								<label>Location</label>
								<select name = "location" class = "custom-select" id = "inlineFormCustomSelectPref">
									<option value= "<%=j.getLocation() %>"><%= j.getLocation() %></option>
									<option value = "Odisha">Odisha</option>
									<option value = "Jharkand">Jharkhand</option>
									<option value = "Gujarat">Gujarat</option>
									<option value = "Bhubaneswar">Bhubaneswar</option>
									<option value = "Delhi">Delhi</option>
									<option value = "Banglore">Banglore</option>
									<option value = "Chennai">Chennai</option>
									<option value = "Hyderabad">Hyderabad</option>
								</select>
							</div>
							<div class = "form-group col-md-4">
								<label>Category</label>
								<select  class = "custom-select " id = "inlineFormCustomSelectPref" name = "category">
									<option value= "<%=j.getCategory() %>"><%=j.getCategory() %></option>
									<option value = "IT">IT</option>
									<option value = "Developer">Developer</option>
									<option value = "Banking">Banking</option>
									<option value = "Engineer">Engineer</option>
									<option value = "Teacher">Teacher</option>
								</select>
							</div>
							<div class = "form-group col-md-4">
								<label>Status</label>
								<select class = "form-control" name = "status">
								<option value = "<%=j.getStatus() %>"><%=j.getStatus() %></option>
									<option value = "Active">Active</option>
									<option value = "Inactive">Inactive</option>
								
								</select>
							</div>
							</div>
							<div class = "form-group">
								<label>Enter Description</label>
								<textarea required rows = "6" cols = "" name = "desc" class = "form-control"><%=j.getDescription() %></textarea>
							</div>
							<button class = "btn btn-success"> Update Job</button>
					</form>
				</div>	
			</div>
		</div>
	</div>
	
		<%@include file = "all_component/footer.jsp" %>
	
</body>
</html>