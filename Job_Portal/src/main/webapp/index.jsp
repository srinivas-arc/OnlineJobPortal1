<%@page import = "com.DB.DBConnect" %>
<%@page import = "java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type = "text/css">
.back-img {
	background: url("img/job.jpg");
	width: 100%;
	height: 87vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<%@include file = "all_component/all_css.jsp" %>
<body>
<% Connection con = DBConnect.getConnect(); 
out.println(con);%>
	<%@include file = "all_component/navbar.jsp" %>
	<div class="container-fluid back-img"></div>
	<%@include file = "all_component/footer.jsp" %>
	
</body>
</html>