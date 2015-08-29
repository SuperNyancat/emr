<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Reset Password</title>
	<meta charset="utf-8">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template1.css">	
	<link rel="stylesheet" href="resources/css/expandCollapse.css">
	<script src="resources/js/lightbox.js"></script>
</head>

<body>

<p class="loginTitle">University of Santo Tomas Hospital<br>Joint and Bone Center</p>

<div class="rightHome">
	<form method="post" action="pass_retrieve.it">
		<br><br><br>
			
				<span style="color:goldenrod;font-size:20px;">Reset Password</span>
			
		<br><br>
			<p><font color="red" size="2px">${errorMessage}</font></p>
			<c:remove var="errorMessage" scope="session" /> 
		<input class="textbox" name="username" type="text" required placeholder="Username"><br>
		<input class="textbox" name="email" type="text" required placeholder="Email Address">
		
		<br><br>
		<input class="textbox" name="question" type="text" required  placeholder="Question"><br> 
		<input class="textbox" name="answer" type="text"  required placeholder="Answer">
		
		<br><br>
		<span class="btn"><a href="homepage.html"><input type="submit" value="Submit" class="btnNew"></a></span>
		
	</form>
	
	
</div>
Image by &copy; Paul Quiambao

   

	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>

</body>
</html>