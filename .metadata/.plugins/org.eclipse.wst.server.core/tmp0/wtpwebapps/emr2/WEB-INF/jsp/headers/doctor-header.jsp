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
<script type='text/javascript' src='http://code.jquery.com/jquery-git2.js'></script>

	<link rel="stylesheet" href="resources/css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css">
	<link rel="stylesheet" href="resources/css/forms.css">
	<link rel="stylesheet" href="resources/css/form-popup.css">
	<link rel="stylesheet" href="resources/css/template-table.css">
	<link rel="stylesheet" href="resources/css/homepage.css">	
	<link rel="stylesheet" href="resources/css/tabs.css">	
	<link rel="stylesheet" href="resources/css/settings.css">
	<link rel="stylesheet" href="resources/css/expandCollapse.css">
	<link rel="stylesheet" href="resources/css/promptmessage.css">
	<link rel="stylesheet" href="resources/css/popup_window.css">
	<link rel="stylesheet" href="resources/css/lightbox.css">
	<link rel="stylesheet" href="resources/css/homepage.css">
	<link rel="stylesheet" href="resources/css/homepage1.css">
	<link rel="stylesheet" href="resources/css/jquery-ui.css">
	
	<script src="resources/js/addDeleteRows.js"></script>
	<script src="resources/js/buttons.js"></script>
	<script src="resources/js/expandCollapse.js"></script>
	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/lightbox.js"></script>
	<script src="resources/js/retypepwd.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
</head>

<body>

	<div id="wrap">
		<header>
			<h1></h1><p class="loginTitle1">University of Santo Tomas Hospital<br>Joint and Bone Center</p>
		
			<div class="toplinks">
		<ul>
			<li><a href="view_doctor_profile.it?id=${doctor.getId() }">My Account</a></li>
		</ul>

		<span class="userInfo"><a href="#">
			<c:choose>
				<c:when test="${doctor.getRelativePath() == null || doctor.getRelativePath().equalsIgnoreCase('null')}">
					<img src="resources/images/img_user.jpg" alt="" style="width:32px; height:40px;">
				</c:when>
				<c:otherwise>
					<img src="${doctor.getRelativePath() }" alt="${doctor.getPersonInfo().getFirstName()}'s profile picture" style="width:32px; height:40px;" />
				</c:otherwise>
			</c:choose>
			
		</a></span>

		<div class="userDetails">
			<figure>
				<c:choose>
					<c:when test="${doctor.getRelativePath() == null || doctor.getRelativePath().equalsIgnoreCase('null')}">
						<img src="resources/images/img_user.jpg" alt="">
					</c:when>
					<c:otherwise>
						<img src="${doctor.getRelativePath() }" alt="${doctor.getPersonInfo().getFirstName()}'s profile picture" />
					</c:otherwise>
				</c:choose>
			</figure>
			<h4>${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName() }</h4>
			<p>${doctor.getPersonInfo().getEmail() }</p>
			<h5>My Account</h5>
			<p>${doctor.getUser().getUsername()}</p>
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
				<c:url var="reportsUrl" value="view_doctor_reports.it?y=now" />
				
				<li class="${param.selected == 'home' ? 'selected' : ''}"><a
					href="${homeUrl}">Home</a></li>
				<li class="${param.selected == 'patients' ? 'selected' : ''}"><a
					href="${patientsUrl}">Patients</a></li>
				<li class="${param.selected == 'appointments' ? 'selected' : ''}"><a
					href="${appointmentsUrl}">Appointments</a></li>
				<li class="${param.selected == 'reports' ? 'selected' : ''}"><a
					href="${reportsUrl}">Reports</a></li>
				<!-- <li class="${param.selected == 'prescriptions' ? 'selected' : ''}"><a
					href="${prescriptionsUrl}">Prescriptions</a></li>-->
			
			</ul>
			
			<!-- <div class="rOptions">
				<span class="moreOpt">
					<a href="" title=""><img src="resources/images/icon_morectrl.png" alt="More Options"></a>
				</span>			
				<div class="moreOptList">
					<ul class="list1">
						<li><a href="">New Patient</a></li>
						<li><a href="">New&nbspAppointment</a></li>
					</ul>	
					<ul class="list2">
						<li><a href="">New Report</a></li>
						<li><a href="">New&nbspTransaction</a></li>
					</ul>		
				</div>
				
				<form class="searchbar">
					<input type="text" value="" placeholder="Search" >	
				</form> 
			</div>-->
			
		</nav>
</body>
