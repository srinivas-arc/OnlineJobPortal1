<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao. JobDAO" import = "com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User: View Jobs</title>
		<%@include file="all_component/all_css.jsp"%>
	</head>
	
	<body style="background-color: #f0f1f2;">
		<%@include file="all_component/navbar.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h5 class="text-center text-primary">All Jobs</h5>
					
					<div class="card">
						<div class="card-body">
							<form class="form-inline" action="more_view.jsp" method="get">
								<div class="form-group col-md-5 mt-1">
									<h5>Location</h5>
								</div>
								<div class="form-group col-md-4 mt-1">
									<h5>Category</h5>
								</div>
								<div class="form-group col-md-5">
									<select name="Loc" class="custom-select "
										id="inlineFormCustomSelectPref">
									<option selected value="Lo">Choose...</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujurat">Gujurat</option>
									<option value="Bhubaneswar">Bhubaneswar</option>
									<option value="Delhi">Delhi</option>
									<option value="Bang Lore">Banglore</option>
									<option value="Chennai ">Chennai</option>
									<option value="Hydrabad">Hydrabad</option>
									</select>
								</div>
								<div class="form-group col-md-5">
									<select class="custom-select " id="inline FormCustomSelectPref"
										name="cat">
									<option value="ca" selected > Choose...</option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
									</select>
								</div>
								<button class="btn btn-success">Submit</button>
							</form>
						</div>
					</div>
					
					<%
					String loc = request.getParameter("Loc");
					String cat = request.getParameter("cat");
					JobDAO dao = new JobDAO(DBConnect.getConnect());
					List<Jobs> list = dao.getSelectedJobs(loc, cat);
					for (Jobs j: list) {%>
						<div class="card mt-2">
							<div class="card-body">
								<div class="text-center text-primary"><i class="far fa-clipboard fa-2x"></i></div>
								<h6><%=j.getTitle()%></h6>
								<%if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {%>
									<p><%=j.getDescription()%>.</p>
								<%} else {%>
									<p><%=j.getDescription().substring(0, 120 ) %>...</p>
								<%}%>
								<br>
								<div class="form-row">
									<div class="form-group col-md-3"><input type="text" class="form-control form-control-sm"value="Location: <%=j.getLocation () %>" readonly></div>
									<div class="form-group col-md-3"><input type="text" class="form-control form-control-sm"value="Category: <%=j.getCategory () %>" readonly></div>
								</div>
								<h6>Publish Date:2022-11-05 </h6>
								<div class="text-center">
									<a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View More</a>
								</div>
							</div>
						</div>
						<%}%>
					</div>
				</div>
			</div>
		</body>
</html>