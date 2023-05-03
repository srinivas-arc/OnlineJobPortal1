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
		<title>User: One View</title>
		<%@include file="all_component/all_css.jsp"%>
	</head>
	
	<body style="background-color: #f0f1f2;">
		<%@include file="all_component/navbar.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBConnect.getConnect());
				Jobs j = dao.getJobById(id);
				{%>
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
						
					</div>
				</div>
				<%}%>
			</div>
		</div>
	</div>
</body>
</html>