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
	
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<![endif]-->
</head>
<body>
	<ul class="tab-links">
		<c:url var="profileUrl" value="view_patient_profile.it?id=${patient.id}" />
		<c:url var="historyUrl" value="uh_table.it?id=${patient.id}" />
		<c:url var="checkUpSessionUrl" value="view_checkup_sessions.it?id=${patient.id}" />
		<c:url var="physicalUrl" value="view_pe.it?id=${patient.id}" />
		<c:url var="formsUrl" value="view_forms.it?id=${patient.id}" />
		<c:url var="medicationsAndPrescriptionsUrl" value="view_medications_and_prescriptions.it?id=${patient.id}" />
		<c:url var="transactionsUrl" value="transactions_table.it?id=${patient.id}" />
		<c:url var="appointmentsUrl" value="appointments_table.it?id=${patient.id}" />
		<c:url var="archivesUrl" value="archives_table.it?id=${patient.id}" />
		<c:url var="diagnosisUrl" value="diagnosis_view.it?id=${patient.id}" />
		<c:url var="reportsUrl" value="view_reports.it?id=${patient.id}&y=" />
		

		<li class="${param.selected == 'profile' ? 'selected' : ''}"><a
			href="${profileUrl}">Profile</a></li>
		
	
		<li class="${param.selected == 'history' ? 'selected' : ''}"><a
			href="${historyUrl}">History</a></li>
		
		<li class="${param.selected == 'checkup' ? 'selected' : ''}"><a
		href="${checkUpSessionUrl}">Check-up&nbspSessions</a></li>
			

<c:if test="${nurse == null }">		
		
		
		<ul class="cssMenu">
			<li class="${param.selected == 'forms' ? 'selected' : ''}">
			<a href="${formsUrl}">Forms</a>           
			<ul>	
				<li><a href="#">Functional Abilities</a>
					<ul>
						<li><a href="pep_table.it?id=${patient.id }">Patient Assessment</a></li>	
						<li><a href="ped_table.it?id=${patient.id }">Physician Assessment</a></li>										
					</ul>	
				</li>	

				<li><a href="lab_request_table.it?id=${patient.id }">Laboratory Request</a></li>				
				
				<li><a href="#">Rheumatoid Arthritis</a>
					<ul>
						<li><a href="cdai_table.it?id=${patient.id }">CDAI</a></li>
						<li><a href="sdai_table.it?id=${patient.id }">SDAI</a></li>												
						<li><a href="das_table.it?id=${patient.id }">DAS28</a></li>												
					</ul>	
				</li>	
				
				
				<li><a href="#">Systemic&nbspLupus&nbspErythematosus</a>
					<ul>
						<li><a href="damage_index_SLE_table.it?id=${patient.id }">Damage Index</a></li>
						<li><a href="MEXSLEDAI_table.it?id=${patient.id }">MEX SLEDAI</a></li>					
						<li><a href="SLE_flowsheet_table.it?id=${patient.id }">SLE Flow Sheet</a></li>
						<li><a href="SLE_flare_table.it?id=${patient.id }">SLE FLARE</a></li>						
						<li><a href="SLEDAI_score_table.it?id=${patient.id }">SLEDAI Score</a></li>						
						<li><a href="SLEDAA_table.it?id=${patient.id }">SLEDAA Case Report</a></li>							
					</ul>	
				</li>
							
				<li><a href="#">Ankylosing Spondylitis</a>
					<ul>
						<li><a href="BASFI_table.it?id=${patient.id }">BASFI</a></li>	
						<li><a href="BASDAI_table.it?id=${patient.id }">BASDAI</a></li>	
						<li><a href="basmi_table.it?id=${patient.id }">BASMI</a></li>	
						<li><a href="BASG_table.it?id=${patient.id }">BAS-G</a></li>
					</ul>					
				</li>
				
				<li><a href="pasi_table.it?id=${patient.id }">Psoriatic Arthritis</a></li>				
	
				<li><a href="#">Systemic Sclerosis</a>
					<ul>
						<li><a href="rodnan_table.it?id=${patient.id }">Modified Rodnan Score</a></li>
						<li><a href="eustar_table.it?id=${patient.id }">EUSTAR</a></li>
						<li><a href="SS_flowsheet_table.it?id=${patient.id }">SS Flow Sheet</a></li>
					</ul>					
				</li>
				
				<li><a href="#">Inflammatory Myopathy</a>
					<ul>
						<li><a href="inflammatory_myopath_table.it?id=${patient.id }">Inflammatory Myopathy Flow Sheet</a></li>
					</ul>
				</li>	
			</ul>
			</li>
		</ul>
			
		<li class="${param.selected == 'medicationsAndPrescriptions' ? 'selected' : ''}"><a
			href="${medicationsAndPrescriptionsUrl}">Medications</a></li>
		
		<li class="${param.selected == 'transactions' ? 'selected' : ''}"><a
			href="${transactionsUrl}">Transactions</a></li>
		
		<li class="${param.selected == 'appointments' ? 'selected' : ''}"><a
			href="${appointmentsUrl}">Appointments</a></li>
			
		<li class="${param.selected == 'diagnosis' ? 'selected' : ''}"><a
			href="${diagnosisUrl}">Diagnosis</a></li>
			
		<li class="${param.selected == 'archives' ? 'selected' : ''}"><a
			href="${archivesUrl}">Archives</a></li>
			
		<li class="${param.selected == 'reports' ? 'selected' : ''}"><a
			href="${reportsUrl}">Reports</a></li>
</c:if>

<c:if test="${nurse != null }">
	<li class="${param.selected == 'transactions' ? 'selected' : ''}"><a
			href="${transactionsUrl}">Transactions</a></li>
		
		<li class="${param.selected == 'appointments' ? 'selected' : ''}"><a
			href="${appointmentsUrl}">Appointments</a></li>
</c:if>
	</ul>

</body>
</html>