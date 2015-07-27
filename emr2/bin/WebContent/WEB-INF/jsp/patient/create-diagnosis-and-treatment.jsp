<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>New Diagnosis and Treatment</title>
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
	<script src="js/html5shiv.js"></script>
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
	<li><span class="btn"><a href="patients_table.html"><input type="button" value="Patients List" class="btnReturn"></a></span></li>
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
        <li><a href="view_patient_profile.it?id=${patient.getId()}">Profile</a></li>
		<li><a href="view_patient_history.it?id=${patient.getId()}">History</a></li>
		<li><a href="view_checkup_sessions.it?id=${patient.getId()}">Check-up Sessions</a></li>
        <li class="active"><a href="view_diagnosis_and_treatment.it?id=${patient.getId()}">Diagnosis and Treatment</a></li>
        <li><a href="view_medications_and_prescriptions.it?id=${patient.getId()}">Medications and Prescriptions</a></li>
        <li><a href="view_transactions.it?id=${patient.getId()}">Transactions</a></li>
    </ul>
	
    <div class="tab-content">
	
        <div id="Diagnosis and Treatment" class="tab active">
            <section class="settingBody clrfix">		
			<div class = "left">
				<h4 class="name">${patient.getPersonInfo().getFirstName() }  ${patient.getPersonInfo().getLastName()}</h4>
				<p>${ patient.getPersonInfo().getEmail() }</p>
				<img src="resources/images/img_user.jpg" alt="">
				<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> 
				<label><i>Record created by ${ patient.getCreatedByFirstName() } ${ patient.getCreatedByLastName() } </i></label><br>
				<label>Date Created</label> :  <span>${ patient.getPersonInfo().getDateCreated() }</span> <br /> 
				<label>Date Modified</label> :  <span>${ patient.getPersonInfo().getDateModified() }</span> <br /> 
			</div>
			
			<div class="right">
				<form:form method="post" action="create_diagnosis_and_treatment.it?id=${patient.getId()}" commandName="checkUpSessionForm">
				<h4>Diagnosis</h4>				
				
					<div>					
						<form:textarea path="diagnosis"/>
					</div> 
					
				<h5>Treatment</h5>				
					<div>					
						<form:textarea path="treatment"/>
					</div> 
					<section>
						<ul class="btnForm">
							<li><span class="btn"><input type="submit" value="Create" class="btnSave"></span></li>
							<li><span class="btn"><input type="button" value="Cancel" class="btnCancel"></span></li>
						</ul>
					</section>
				
					
							
					<!-- <span class="errormsg quota">You are not allowed to edit this value</span> -->
				</form:form>
			
				
			</div>
			
		</section>
		
		</div>
	
    </div>
	
	
	</div>	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>

	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>