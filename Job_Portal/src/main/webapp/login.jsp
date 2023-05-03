<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored = "false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">


		<%@include file = "all_component/all_css.jsp" %>
		<link rel="stylesheet" href="all_component/login.css">
		<style>
			.login-page {
			height: 87vh;
			}
		</style>
	</head>
	<body>
		<%@include file = "all_component/navbar.jsp" %>
	    <div class="login-page">
	      <div class="form">
	        <div class="login">
	          <div class="login-header">
	            <h3>LOGIN</h3>
	            <p>Please enter your credentials to login.</p>
	          </div>
	        </div>
	        
			<c:if test="${not empty succMsg }">
				<div class="alert alert-success" role="alert">
				${ succMsg}
				</div>
			<c:remove var="succMsg"/>
			</c:if>
			
	        <form action = "Login" method = "post">
	        	<div class="login-form">
	          <input type="text" placeholder="email" name = "email"/>
	          <input type="password" placeholder="password" name = "password"/>
	          <button>login</button>
	          <p class="message">Not registered? <a href="signup.jsp">Create an account</a></p>
	          </div>
	        </form>
	      </div>
	    </div>
	
	  <%@include file = "all_component/footer.jsp" %>
	</body>
</html>