 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored = "false" %>
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
				  		<h5> Add Jobs</h5>
					</div>
					<form action = "add_job" method = "post">
						<div class = "form-group">
							<label>Enter Title</label><input type = "text" name = "title" required  class = "form-control">
						</div>
						
						<div class = "form-row">
							<div class = "form-group col-md-4">
								<label>Location</label>
								<select name = "location" class = "custom-select" id = "inlineFormCustomSelectPref">
									<option selected>Choose...</option>
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
									<option selected>Choose...</option>
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
									<option value = "Active">Active</option>
									<option value = "Inactive">Inactive</option>
								
								</select>
							</div>
							</div>
							<div class = "form-group">
								<label>Enter Description</label>
								<textarea required rows = "6" cols = "" name = "desc" class = "form-control"></textarea>
							</div>
							<button class = "btn btn-success"> Publish Job</button>
					</form>
				</div>	
			</div>
		</div>
	</div>
	
		<%@include file = "all_component/footer.jsp" %>
	
</body>
</html>