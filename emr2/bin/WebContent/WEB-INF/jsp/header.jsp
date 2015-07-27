<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>${param.title}</title>
<meta charset="utf-8">

<c:url var="PROJECT_ROOT" value="resources"/>
<link rel="stylesheet" href="${PROJECT_ROOT}/css/reset.css">
<link rel="stylesheet" href="${PROJECT_ROOT}/css/template.css">
<link rel="stylesheet" href="${PROJECT_ROOT}/css/template-table.css">
<link rel="stylesheet" href="${PROJECT_ROOT}/css/forms.css">
<link rel="stylesheet" href="${PROJECT_ROOT}/css/form-popup.css">
<link rel="stylesheet" href="${PROJECT_ROOT}/css/jquery-ui.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>

<script src="${PROJECT_ROOT}/js/jquery-1.9.1.min.js"></script>
<script src="${PROJECT_ROOT}/js/scripts.js"></script>
<script src="${PROJECT_ROOT}/js/jquery-ui.js"></script>
</head>

<body>

	<div id="wrap">
		<header>
			
			<div class="toplinks">
		<ul>
			<li><a href="">My Account</a></li>
		</ul>

		<span class="userInfo">
			<a href=""><img src="resources/images/icon_user.jpg" alt=""></a>
		</span>

		<div class="userDetails">
			<figure>
				<img src="resources/images/img_user.jpg" alt="" >
			</figure>
			<h4>${loggedInUser.getPersonInfo().getFirstName()} ${loggedInUser.getPersonInfo().getLastName() }</h4>
			<p>${loggedInUser.getPersonInfo().getEmail() }</p>
			<h5>My Account</h5>
			<p>${loggedInUser.getUser().getUsername()}</p>
			<form action="logout.it" method="get">
				<p class="button">
					<span class="btn"><input type="submit" value="Sign Out"
						class="btnExit"></span>
				</p>
			</form>
		</div>
	</div>
		  </header>
		</div>



		<nav>
			<ul class="menu">
			
				<c:url var="homeUrl" value="doctor_homepage.it" />
				<c:url var="patientsUrl" value="view_patients.it" />
				<c:url var="appointmentsUrl" value="view_appointments.it" />
				<c:url var="diagnosisUrl" value="view_diagnosis_and_treatment.it" />
				<c:url var="prescriptionsUrl" value="view_prescriptions.it" />
				
				<li class="${param.selected == 'home' ? 'selected' : ''}"><a
					href="${homeUrl}">Home</a></li>
				<li class="${param.selected == 'patients' ? 'selected' : ''}"><a
					href="${patientsUrl}">Patient</a></li>
				<li class="${param.selected == 'appointments' ? 'selected' : ''}"><a
					href="${appointmentsUrl}">Appointments</a></li>
				<li class="${param.selected == 'diagnosis' ? 'selected' : ''}"><a
					href="${diagnosisUrl}">Diagnosis and Treatment</a></li>
				<li class="${param.selected == 'prescriptions' ? 'selected' : ''}"><a
					href="${prescriptionsUrl}">Prescriptions</a></li>
			
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
			
		</nav>
</body>
