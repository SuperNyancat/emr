<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<p>Patient Number: ${ patient.id }</p>
	<h4 class="name">${patient.getPersonInfo().getFirstName() }  ${patient.getPersonInfo().getLastName()}</h4>
	<p>${ patient.getPersonInfo().getEmail() }</p>
	<c:choose>
		<c:when test="${patient.getRelativePath() == null || patient.getRelativePath().equalsIgnoreCase('null')}">
			<img src="resources/images/img_user.jpg" alt="">
		</c:when>
		<c:otherwise>
			<img src="${patient.getRelativePath() }" alt="${patient.getPersonInfo().getFirstName()}'s profile picture" />
		</c:otherwise>
	</c:choose>
			<ul>
			<br></br>
		
			<p><a href="check_up_sessions_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Check-Up Session</a></p>

<c:if test="${nurse == null }">	
			<h2>Functional Abilities</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="pep_assemble.it?id=${patient.id}">New Patient Assessment</a><li>
						<li><a href="ped_assemble.it?id=${patient.id}">New Physician Assessment</a><li>	
						</ul>
				
				</div>			
			<p><a href="laboratory_request_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Laboratory Request</a></p>


			<h2>Rheumatoid Arthritis</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="cdai_assemble.it?id=${patient.id }">New Clinical Disease Activity Index</a><li>
						<li><a href="sdai_assemble.it?id=${patient.id }">New Simple Disease Activity Index</a><li>
						<li><a href="das_assemble.it?id=${patient.id }">New Disease Activity Score in 28 Joints</a><li>
					</ul>
				</div>	
				
				
			<h2>Systemic&nbspLupus&nbspErythematosus</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="damage_index_form_assembler.it?id=${patient.id}">New Damage Index for SLE</a><li>
						<li><a href="MEXSLEDAI_form_assembler.it?id=${patient.id}">New MEX SLEDAI</a><li>	
						<li><a href="SLE_flowsheet_form_assembler.it?id=${patient.id}">New SLE Flow Sheet</a><li>
						<li><a href="sle_flare_form_assembler.it?id=${patient.id}">New SLE Flare</a><li>
						<li><a href="SLEDAI_score_form_assembler.it?id=${patient.id}">New SLEDAI Score</a><li>																		
						<li><a href="SLEDAA_case_report_form_assembler.it?id=${patient.id}">New SLEDAA Case Report</a><li>
						
					</ul>
				
				</div>
				
	
			<h2>Ankylosing Spondylitis</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="BASDAI_form_assembler.it?id=${patient.id}">New BASDAI</a><li>
						<li><a href="BASFI_form_assembler.it?id=${patient.id}">New BASFI</a><li>
						<li><a href="basmi_assemble.it?id=${patient.id }">New BASMI</a><li>
						<li><a href="BASG_form_assembler.it?id=${patient.id}">New BAS-G</a><li>
					</ul>
				
				</div>
				
			<h2>Psoriatic Arthritis</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="pasi_assemble.it?id=${patient.id }">New PASI</a><li>
					</ul>
				</div>
			
			<h2>Systemic Sclerosis</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="rodnan_assemble.it?id=${patient.id}">New Modified Rodnan Score</a><li>
						<li><a href="eustar_assemble.it?id=${patient.id }">New EUSTAR</a><li>
						<li><a href="SS_flowsheet_form_assembler.it?id=${patient.id}">New SS Flow Sheet</a><li>
					</ul>
				
				</div>
				
			<h2>Inflammatory Myopathy</h2>
				<div class="section">
					<ul id="ecc">
						<li><a href="inflammatory_myopath_form_assembler.it?id=${patient.id}">New Inflammatory Myopathy Flow Sheet</a><li>
					</ul>
				</div>
			
			<p><a href="create_medications_and_prescriptions_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Prescription & Medication</a></p>
			<p><a href="transaction_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Transaction</a></p>
			<p><a href="appointments_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Appointment</a></p>
			<p><a href="archives_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">Upload Archive</a></p>
			<p><a href="diagnosis_view.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">Edit Diagnosis</a></p>
			
			<h2></h2>
				<div class="section">
					<ul id="ecc">
						
					</ul>
				</div>
</c:if>
<c:if test="${nurse != null }">
	<p><a href="transaction_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Transaction</a></p>
			<p><a href="appointments_assembler.it?id=${patient.id}" style="color:goldenrod; font-weight:bold; padding-left:18px">New Appointment</a></p>
			
</c:if>

</body>
</html>