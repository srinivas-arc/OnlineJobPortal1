<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.back-img {
	background: url("img/admin.webp");
	width: 100%;
	height: 87vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<%@include file = "all_component/all_css.jsp" %>
</head>
<body>
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url = "login.jsp"></c:redirect>
	</c:if>
	<%@include file = "all_component/navbar.jsp" %>
	<div class="container-fluid back-img"> <center><h1 style= "color: white">Welcome Admin</h1></center></div>
	<%@include file = "all_component/footer.jsp" %>
</body>
</html>