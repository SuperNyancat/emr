<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
	<title>${patient.getPersonInfo().getFirstName()} ${patient.getPersonInfo().getLastName()}'s Information</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="resources/css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css">
	<link rel="stylesheet" href="resources/css/forms.css">
	<link rel="stylesheet" href="resources/css/form-popup.css">
	<link rel="stylesheet" href="resources/css/template-table.css">
	<link rel="stylesheet" href="resources/css/homepage.css">	
	<link rel="stylesheet" href="resources/css/tabs.css">	
	<link rel="stylesheet" href="resources/css/settings.css">	
	<!--[if lt IE 9]>
	<script src="resources/js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>
<div id="wrap">
<jsp:include page="../header.jsp">
	<jsp:param name="title" value="Create Patient" />
	<jsp:param name="selected" value="patients" />
</jsp:include>
<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn"><a href="view_patients.it"><input type="button" value="Patients List" class="btnReturn"></a></span></li>
</ul>
<ul class="ctrlBtn listSpace">
	<li><span class="btn"><input type="button" value="Edit" class="btnEdit"></span></li>
	<li><span class="btn"><input type="button" value="Delete" class="btnDel"></span></li>
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	


<div class="tabs">
    <ul class="tab-links">
        <li class="active"><a href="view_patient_profile.it?id=${patient.getId()}">Profile</a></li>
		<li><a href="view_patient_history.it?id=${patient.getId()}">History</a></li>
		<li><a href="view_checkup_sessions.it?id=${patient.getId()}">Check-up Sessions</a></li>
        <li><a href="view_diagnosis_and_treatment.it?id=${patient.getId()}">Diagnosis and Treatment</a></li>
        <li><a href="view_medications_and_prescriptions.it?id=${patient.getId()}">Medications and Prescriptions</a></li>
        <li><a href="view_transactions.it?id=${patient.getId()}">Transactions</a></li>
    </ul>
 
    <div class="tab-content">
	   <div id="Profile" class="tab active">
		
		<section class="settingBody clrfix">		
			<div class = "left">
				<h4 class="name">${patient.getPersonInfo().getFirstName() }  ${patient.getPersonInfo().getLastName()}</h4>
				<p>${ patient.getPersonInfo().getEmail() }</p>
				<img src="resources/images/img_user.jpg" alt="">
				<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> 
				<label><i>Record created by ${ patient.getCreatedByFirstName() } ${ patient.getCreatedByLastName() } </i></label><br>
				<label>Date Created</label> :  <span>${ patient.getPersonInfo().getDateCreated() }</span> <br /> 
				<label>Date Modified</label> :  <span>${ patient.getPersonInfo().getDateModified() }</span> <br /> 
			</div>
		
			<div class="right">
				<h4>Personal Information</h4>				
				<form class="settingForm">
					<label>Name</label>:  <span> ${patient.getPersonInfo().getFirstName() }  ${patient.getPersonInfo().getLastName()}</span> <br /> 
					<label>Date of Birth</label>:  <span> ${patient.getPersonInfo().getDateOfBirth() }</span> <br/> 
					<label>Age</label>:  <span>20</span> <br/> 
					<label>Gender</label>:  <span> ${ patient.getPersonInfo().getSex() }</span> <br /> 
					<label>Address</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getAddress() }</span> <br/> 
					<label>City</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getCity() }</span> <br /> 
					<label>State/Province</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getProvince() }</span> <br /> 
					<label>Zip/Postal Code</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getZipCode() }</span> <br /> 
					<label>Phone</label>:  <span>${ patient.getPersonInfo().getContacts().get(0).getPhoneNumber() }</span> <br /> 
					<label>Mobile</label>:  <span>${ patient.getPersonInfo().getContacts().get(0).getMobileNumber() }</span> <br /> 
					<label>Email Address</label>:  <span>${ patient.getPersonInfo().getEmail() }</span> <br /> 
					<label>Referring Physician</label>:  <span>Dr. Quakquak</span> <br /> 
					<label>Attending Physician</label>:  <span>${ patient.getDoctor().getPersonInfo().getFirstName() } ${ patient.getDoctor().getPersonInfo().getLastName() }</span> <br /> 
					
					<!-- <span class="errormsg quota">You are not allowed to edit this value</span> -->
			
				</form>
				
				<br><br><br>
				<form class="settingForm">
				<h4>Work Information</h4>	
					<label>Occupation</label>:  <span>${ patient.getPersonInfo().getOccupation() }</span> <br /> 
					<label>Address</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getAddress() }</span> <br /> 
					<label>City</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getCity() }</span> <br /> 
					<label>State/Province</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getProvince() }</span> <br /> 
					<label>Zip/Postal Code</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getZipCode() }</span> <br /> 
					<label>Phone</label>:  <span>${ patient.getPersonInfo().getContacts().get(1).getPhoneNumber() }</span> <br /> 
					<label>Mobile</label>:  <span>${ patient.getPersonInfo().getContacts().get(1).getMobileNumber() }</span> <br /> 
				</form>
				
			</div>
		</section>
		
            
        </div>

		
    </div>
	</div> 	
	

	
</div>
	</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>

	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>