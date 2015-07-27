<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<title>Doctor Home Page</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="resources/css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template1.css">
	<link rel="stylesheet" href="resources/css/forms.css">	
	<link rel="stylesheet" href="resources/css/form-popup.css">
	<link rel="stylesheet" href="resources/css/template-table.css">
	<link rel="stylesheet" href="resources/css/homepage1.css">
	
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

<div id="wrap">
<header>
	<h1>UST Joint and Bone Center</h1>
</header>

<nav>
</nav>

<div class="pageCtrl noContent"><!--no content--></div>

<div class="content-wrap">
	
	<div class="wrapper home">

	<section class="accDetails clrfix">
	<div class="profile">
	
		<form method="post" action="login.it">
		<ul>
			<li><label>username</label>: <input type="text" name="username" style="width:200px"></li>
			<li><label>password</label>: <input type="password" name="password" style="width:200px"></li>
			<li><span class="btn"><input type="submit" value="Login" class="btnNew"></span>
			<span class="forgot"><a href="forgotPassword" title="">Forgot Password</a></span></li>
		</ul>
		
		</form>
		<form method="post" action="create_doctor_assembler.it">	
		<ul>
			<li>
			<span class="btn"><input type="submit" value="Sign up" class="btnNew"></span>
			</li>
		</ul>
		</form>
		
			<p><font color="red" size="1px">${errorMessage}</font></p>
			<c:remove var="errorMessage" scope="session" /> 
			
		<!-- >	<h3>TEMPORARY</h3>
			<form method="post" action="create_patient_assembler.it">
				<span class="btn"><input type="submit" value="Create Patient" class="btnNew"></span>
			</form>-->
		
	
	</div>

	</section>			
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->

<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>


	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>