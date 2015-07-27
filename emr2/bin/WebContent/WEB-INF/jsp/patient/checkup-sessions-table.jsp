<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>${patient.getPersonInfo().getFirstName()} ${patient.getPersonInfo().getLastName()}</title>
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
	
</div>


<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn"><a href="view_patients.it"><input type="button" value="Patients List" class="btnReturn"></a></span></li>
</ul>
<ul class="ctrlBtn listSpace">
	<li><span class="btn"><a href="create_checkup_session_assembler.it?id=${patient.getId()}"><input type="button" value="New Record" class="btnEdit"></a></span></li>
	<li><span class="btn"><a href=""><input type="button" value="Delete" class="btnDel"></a></span></li>
</ul>
</div>

<div class="pageCtrl">
</div>
<div class="content-wrap">
	
	<div class="wrapper prospects">
	
	<div class="tabs">
     <ul class="tab-links">
        <li><a href="view_patient_profile.it?id=${patient.getId()}">Profile</a></li>
		<li><a href="view_patient_history.it?id=${patient.getId()}">History</a></li>
		<li class="active"><a href="view_checkup_sessions.it?id=${patient.getId()}">Check-up Sessions</a></li>
        <li><a href="view_diagnosis_and_treatment.it?id=${patient.getId()}">Diagnosis and Treatment</a></li>
        <li><a href="view_medications_and_prescriptions.it?id=${patient.getId()}">Medications and Prescriptions</a></li>
        <li><a href="view_transactions.it?id=${patient.getId()}">Transactions</a></li>
    </ul>
 
    <div class="tab-content">
	
        <div class="tableHeadertrans clrfix">
			<table border="1" class="navigation">
				<tr>
					<td class="navblank">&nbsp;</td>
					<td class="pro"><a href="">Date</a></td>
					<td class="phn"><a href=""></a>Symptoms</td>
					<td class="ind"><a href=""></a>Treatment</td>
				</tr>
			</table>
		</div>
		

		
		<div class="searchTool">
			<section> 
				<a href=""><img src="resources/images//icon_search2.png" alt="Search"></a>
				<span class="greenArrow">&nbsp;</span>
			</section>
		</div>

		<table class="tableContenttrans">	
			<tr><td><font color="red" size="1px">${errorMessage}</font>
				<c:remove var="errorMessage" scope="session" /></td> 	
			<tr>
			<c:forEach items="${checkUpSessions}" var="session">
			<tr>
				<td><div class="blue"></div>
				</td>
				<td class="pro"><a href="view_checkup_session.it" title="">${session.getDateCreated()}</a></td>
				<td class="phn">${session.getSymptoms()}</td>
				<td class="ind">${session.getTreatment()}</td>
			
			</tr>
			</c:forEach>
			
		</table>
		
		
		
		<div class="lowernav1">
			<section class="paging">
				<ul>
					<li>
						<select class="perpage">
							<option>5 per page</option>
							<option>10 per page</option>
							<option>15 per page</option>
						</select>
					</li>
					<li>
						<p class="counter">Total Count <a href="">&lt;</a><span>1 to ${checkUpSessions.size()}</span><a href="">&gt;</a></p></li>
				</ul>
			</section>
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