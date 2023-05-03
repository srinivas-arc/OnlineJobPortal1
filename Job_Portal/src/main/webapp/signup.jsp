<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "all_component/all_css.jsp" %>
<link rel = "stylesheet" href = "all_component/signup.css">

</head>
<body >
<%@include file = "all_component/navbar.jsp" %>
<div style = "height: 76vh">
	<div id="login-box" >
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">
			${ succMsg}
		</div>
	<c:remove var="succMsg"/>
	</c:if>
	<form action="register" method = "post">
  	<div class="left">
    <h1>Sign up</h1>
    
    
    <input type="text" name="uname" placeholder="Username" />
    <input type="text" name="em" placeholder="E-mail" />
    <input type="text" name="quali" placeholder="Qualification" />
    <input type="password" name="pwd" placeholder="Password" />
    
    <input type="submit" name="signup_submit" value="Sign me up" />
  </div>
  
  <div class="right">
    <span class="loginwith">Sign in with<br />social network</span>
    
    <button class="social-signin facebook">Log in with facebook</button>
    <button class="social-signin twitter">Log in with Twitter</button>
    <button class="social-signin google">Log in with Google+</button>
  </div>
  <div class="or">OR</div>
  </form>
</div>
</div>
<%@include file = "all_component/footer.jsp" %>
</body>
</html>