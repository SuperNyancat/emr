<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
<head>
<title>Create Doctor</title>
<meta charset="utf-8">

<link rel="stylesheet" href="resources/css/reset.css" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css" type="text/css">
	<link rel="stylesheet" href="resources/css/forms.css" type="text/css">	
	<link rel="stylesheet" href="resources/css/form-popup.css" type="text/css">
	<link rel="stylesheet" href="resources/css/template-table.css" type="text/css">
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
	
</head>
	
<body>

<div id="wrap">
<header>
	<h1><a href="#">Doctor Home Page</a></h1>
</header>


<div class="content-wrap">
	
<div class="wrapper">
	<!-- class="crmForm" -->
	<form:form method="post" commandName="doctorForm" action="create_doctor.it" >
		<section>
			<header>
			<p>Create Doctor</p>
				<h3>Doctor Information</h3>
			</header>
		
		<ul class="fields">
			<li><label>First Name</label>:<form:input path="firstName" /></li>
			<li><label>Last Name</label>:<form:input path="lastName"  /></li>
			<li><label>Suffix</label>:<form:input path="suffix" /></li>
			<li><label>License Number</label>:<form:input path="licenseNumber" /></li>
			<li><label>Occupation</label>:<form:input path="occupation"  /></li>
			<li><label>Specialization</label>:<form:input path="specialization" /></li>
			<li><label>Date of Birth</label>:<form:input path="dateOfBirth"  /></li>
			<li><label>Gender</label>:
				   <label>Male</label><form:radiobutton path="sex" value="male"/>
					<label>Female</Label><form:radiobutton path="sex" value="female"/>
			</li>
			<li><label>Phone Number</label>:<form:input path="homePhoneNumber"/></li>
			<li><label>Mobile Number</label>:<form:input path="mobileNumber"/></li>
			<li><label>E-mail Address</label>:<form:input path="email" /></li>
		</ul>
		</section>
		
		<section>
		<header><h3>Address</h3></header>
		<ul class="fields">
			<li><label>Address</label>:<form:input path="homeAddress"/></li>
			<li><label>City</label>:<form:input path="homeCity"/></li>
			<li><label>Province</label>:<form:input path="homeProvince"/></li>
			<li><label>Zip Code</label>:<form:input path="homeZipcode" /></li>
		</ul>
		
	</section>
	
	<section>
		<header><h3>Account Details</h3></header>
		<ul class="fields">
			<li><label>Username</label>:<form:input path="username" /></li>
			<li><label>Password</label>:<form:password path="password"/></li>
		</ul>
	</section>
	
	<section>
		<header>
			<h3>Hospital Details</h3>
		</header>
		<ul class="fields">
			<li><label>Name</label>:<form:input path="companyName"/></li>
			<li><label>Employment Status</label>:
				 <label>Full-time</label><form:radiobutton path="employmentStatus" value="full-time"/>
				 <label>Part-time</Label><form:radiobutton path="employmentStatus" value="part-time"/>
			</li>
			<li><label>Phone Number</label>:<form:input path="workPhoneNumber"/></li>
			<li><label>Work Mobile Number</label>:<form:input path="workNumber" /></li>
			<li><label>Address</label>:<form:input path="workAddress" /></li>
			<li><label>City</label>:<form:input path="workCity"/></li>
			<li><label>Province</label>:<form:input path="workProvince" /></li>		
			<li><label>Zip Code</label>:<form:input path="workZipcode" />
			
			
		</ul>
	</section>	
		
		
			<section>
				<ul class="btnForm">
					<li><span class="btn"><input type="submit"
							value="Create Account" class="btnSave"></span></li>
					<li><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></li>
				</ul>
				<div class="backontop">
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</div>
			</section>
					
	</form:form>
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>


	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>