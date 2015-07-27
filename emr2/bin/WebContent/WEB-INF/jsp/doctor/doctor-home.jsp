<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>

<html lang="en">
<head>
	<title>Doctor Home Page</title>
	<meta charset="utf-8">
	
	<link href="resources/css/homepage.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/reset.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/forms.css" type="text/css"/>	
	<link rel="stylesheet" href="resources/css/form-popup.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/template-table.css" type="text/css"/>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
</head>

<body>
<div id="wrap">
<!--<header>
	<h1><a href="#">Doctor Home Page</a></h1>
	  <div class="toplinks">
		<ul>
			<li><a href="">My Account</a></li>
		</ul>

		<span class="userInfo">
			<a href=""><img src="resources/images/icon_user.jpg" alt=""></a>
		</span>

		<div class="userDetails">
			<figure>
				<img src="resources/images/ebony.jpg" alt="" >
			</figure>
			<h4></h4>
			<p></p>
			<h5>My Account</h5>
			<p></p>
			<form action="logout.it" method="get">
				<p class="button">
					<span class="btn"><input type="submit" value="Sign Out"
						class="btnExit"></span>
				</p>
			</form>
		</div>
	</div>
</header>

<!--<nav>
	
	<ul class="menu">
		<li class="selected"><a href="doctor_homepage.it">Home</a></li>
		<li><a href="view_patients.it">Patients</a></li>
		<li><a href="view_appointments.it">Appointments</a></li>
		<li><a href="">Diagnosis and Treatment</a></li>
		<li><a href="">Prescriptions</a></li>
	</ul>
	<div class="rOptions">
		<span class="moreOpt">
			<a href="" title=""><img src="resources/images/icon_morectrl.png" alt="More Options"></a>
		</span>			
		<div class="moreOptList">
			<ul class="list1">
				<li><a href="">New Patient</a></li>
				<li><a href="">New Account</a></li>
			</ul>	
			<ul class="list2">
				<li><a href="new_task.html">New Task</a></li>
				<li><a href="new_event.html">New Appointment</a></li>
			</ul>		
		</div>
		
		<form class="searchbar">
			<input type="text" value="" placeholder="Search" >	
		</form> 
	</div>
</nav>-->
<jsp:include page="../header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="home" />
</jsp:include>
<div class="pageCtrl noContent"><!--no content--></div>

<div class="content-wrap">
	
	<div class="wrapper home">

	<section class="accDetails clrfix">
	<div class="profile">
		<h3>Hello, Dr. ${doctor.getPersonInfo().getFirstName()}!</h3>
		<ul>
			<li class="photo"><img src="resources/images/img_user.jpg" alt="" >	</li>
			<li class="name">${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()}</li>
			<li>${doctor.getPersonInfo().getEmail()}</li>
			<li>${doctor.getSpecialization()}</li>
		</ul>
	</div>
	<div class="quicklinks">
		<ul>
			<li><a href="view_patients.it">
				<span class="blue"><img src="resources/images/icon_potentials.png" alt="" ></span>
				<span class="link">Patients </span></a></li>
			<li><a href="">
				<span class="blue"><img src="resources/images/icon_contacts.png" alt="" ></span>
				<span class="link">Appointments</span></a></li>
			<li><a href="">
				<span class="blue"><img src="resources/images/icon_editprofile.png" alt="" ></span>
				<span class="link">Edit My Profile</span></a></li>
		</ul>
	</div>
	</section>
		
	<section>
		<h1>Latest Appointments</h1>
		<table>
		<tr>
			<th>Patient's Name</th>
			<th>Date of Visit</th>
			<th>Status</th>
		</tr>
		<tr>
			<td>Matt</td>
			<td>Today</td>
			<td>Physical Examination</td>
		</tr>
		<tr>
			<td>Posadas</td>
			<td>Tomorrow</td>
			<td>Monthly Check-up</td>
		</tr>
		</table>
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