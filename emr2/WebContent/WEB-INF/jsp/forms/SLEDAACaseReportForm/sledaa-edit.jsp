<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit SLEDAA Case Report Form</title>
	<meta charset="utf-8">
	
				<link rel="stylesheet" media="all" href="resources/css/jsDatePick_ltr.min.css" type="text/css">
<script type="text/javascript">
window.onload = function(){
	new JsDatePick({
		useMode:2,
		target:"inputField",
		dateFormat:"%Y-%m-%d"
	});
};
	</script>
</head>

<body>

<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">

</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper prospects">
		<div class="tabs">
		<jsp:include page="../../headers/patient-header.jsp">
			<jsp:param name="selected" value="forms" />
		</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
				<div class = "left">
<jsp:include page="../../headers/patient-left.jsp" />
				</div>
			
			
			
			<div class="right">

								<p class="titles">Systematic Lupus Erythematosus Disease Activity Assessments Case Report Form</p><br><br>
				<form:form commandName="form" method="post" action="update_sledaa.it?pid=${patient.getId()}&fid=${form.getId()} ">
					<form:hidden path="id" value="${form.getId() }"/>
					<form:hidden path="patient.id" value="${patient.getId()}"/>
					<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
					<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
					<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
							
								<h4>Baseline SLE data</h4>	
								Date SLE diagnosis (mm/yyyy): <input type="text" class="bodd" value="${ form.dateSLEDiagnosis}" name="dateSLEDiagnosis" id="inputField" readonly/> <ul>
							<ul>
							<li>Age at SLE diagnosis: <input type="text" class="bodd" path="ageAtSLEDiagnosis" pattern="\\d+(\\.\\d+)?" value="${form.getAgeAtSLEDiagnosis()}"  required="true" /> &nbsp&nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp&nbsp SLE duration: <form:input type="text" pattern="\\d+(\\.\\d+)?" class="bodd" path="SLEDuration" value="${form.getSLEDuration()}"  required="true" /> &nbsp years </li><br>
				
							<li><label class="bigfont">ACR criteria at SLE diagnosis:</label></li><br>
							<li><form:checkbox path="ACRCriteria" value="Malar Rash" />Malar Rash 
							<form:checkbox path="ACRCriteria" value="Oral Ulcers" />Oral Ulcers 
							<form:checkbox path="ACRCriteria" value="Discoid Rash" />Discoid Rash 
							<form:checkbox path="ACRCriteria" value="Arthritis" />Arthritis 
							<form:checkbox path="ACRCriteria" value="Serositis" />Serositis 
							<form:checkbox path="ACRCriteria" value="Renal" />Renal 
							<form:checkbox path="ACRCriteria" value="Neurologic" />Neurologic </li><br>
				<li><form:checkbox path="ACRCriteria" value="Hematologic"/>Hematologic 
				<form:checkbox path="ACRCriteria" value="Photosensitivity" />Photosensitivity 
				<form:checkbox path="ACRCriteria" value="Immunologic eg dsDNA " />Immunologic eg dsDNA 
				<form:checkbox path="ACRCriteria" value="ANA positive" />ANA positive </li> <br></ul><br>
				
				<h4>Current SLE data</h4>  
				<ul>
				<li><form:radiobutton path="currentSLEData" value="No flare"  required="true" />No flare <form:radiobutton path="currentSLEData" value="Mild-mod S-S flare"  required="true" />Mild-mod S-S flare <form:radiobutton path="currentSLEData" value="Severe S-S flare"  required="true" />Severe S-S flare</li><br>
				
				<li> OR flare: <form:radiobutton class="except" path="ORFlare" value="Mild"  required="true" />Mild <form:radiobutton path="ORFlare" value="Moderate"  required="true" />Moderate <form:radiobutton path="ORFlare" value="Severe"  required="true" />Severe <form:radiobutton path="ORFlare" value="Very Severe"  required="true" />Very Severe</li><br><br>
				
				<li><label class="bigfont">SLE activity involvement:</label><form:input type="text" class="boddmore" path="SLEActivityInvolvement" value="${form.getSLEActivityInvolvement()}"/></li><br>
				
				<li><form:checkbox path="SLEActivity" value="Constitutional" />Constitutional 
				<form:checkbox path="SLEActivity" value="Muco-cutaneous " />Muco-cutaneous 
				<form:checkbox path="SLEActivity" value="Neuro-psych " />Neuro-psych 
				<form:checkbox path="SLEActivity" value="Musculo-skeletal" /> Musculo-skeletal</li><br>
				
				<li> <form:checkbox path="SLEActivity" value="Cardio-respiratory" />Cardio-respiratory
				<form:checkbox path="SLEActivity" value="Gastrointestinal" />Gastrointestinal 
				<form:checkbox path="SLEActivity" value="Ophthalmic" />Ophthalmic 
				<form:checkbox path="SLEActivity" value="Renal" />Renal 
				<form:checkbox path="SLEActivity" value="Hematologic" />Hematologic </li><br>
				<li><form:checkbox path="SLEActivity" value="Other" /> Other: <form:input type="text" class="boddmore" path="other"/> </li> <br><br>					
				<!--checkbox path="Other:" value="1" />-->
							<li>Hgb: <form:input type="text" pattern="\\d+(\\.\\d+)?" class="bodd" path="hgb" value="${form.getHgb()}" /> g/L &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp WBC: <form:input type="text" class="bodd" path="WBC" pattern="\\d+(\\.\\d+)?" value="${form.getWBC()}" /> x10^9/L &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Lympho: <form:input type="text" class="bodd" path="lympho" value="${form.getLympho()}" pattern="\\d+(\\.\\d+)?" /> x10^9/L &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Platelet:  <form:input type="text" class="bodd" path="platelet" value="${form.getPlatelet()}" pattern="\\d+(\\.\\d+)?"  /> x10^9/L </li><br><br>
				
							<li>Urine: alb: <form:input type="text" class="bodd" path="urine_alb" value="${form.getUrine_alb()}" /> &nbsp&nbsp wbc: <form:input type="text" class="bodd" path="urine_wbc" value="${form.getUrine_wbc()}" /> &nbsp&nbsp rbc: <form:input type="text" class="bodd" path="urine_rbc" value="${form.getUrine_rbc()}" /> &nbsp&nbsp casts:  <form:input type="text" class="bodd" path="urine_casts" value="${form.getUrine_casts()}" />&nbsp&nbsp UProt:  <form:input type="text" class="bodd" path="UProt" value="${form.getUProt()}" /> mg/dl &nbsp&nbsp&nbsp UCr:  <form:input type="text" class="bodd" path="UCR" value="${form.getUCR()}" /> mg/dl &nbsp&nbsp&nbsp&nbsp UPCR:  <form:input type="text" class="bodd" path="UPCR" value="${form.getUPCR()}" /></li><br><br>
				
				<li>Other labs if abnormal eg creatinine, ALT, CK: <form:input type="text" class="boddmore" path="otherLabs" value="${form.getOtherLabs()}" /></li><br><br>
				
				
				
				<li><label class="bigfontline">Physician's Global Assessment (PGA):</label> <form:input type="text" class="bodd" path="PGA" value="${form.getPGA()}"  required="true" /> mm &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton class="except2" path="PGA_rating" value="0-None" required="true" />0-None <form:radiobutton path="PGA_rating" class="except2" value="1-Mild"  required="true" />1-Mild <form:radiobutton path="PGA_rating" class="except2" value="2-Moderate"  required="true" />2-Moderate <form:radiobutton path="PGA_rating" class="except2" value="3-Severe"  required="true" />3-Severe </li><br><br>
				
				<li><u>SLEDAI S-S score:</u><form:input type="text" pattern="\\d+(\\.\\d+)?" class="bodd" path="SSscore" value="${form.getSSscore()}"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Anti-dsDNA <form:radiobutton class="except" path="antiDsDNA_status" value="Positive" />Positive, Titer<form:input type="text" class="bodd" path="antiDsDNA_positive_titer" value="${form.getAntiDsDNA_positive_titer()}"/> &nbsp&nbsp&nbsp <form:radiobutton path="antiDsDNA_status" value="Negative"/>Negative &nbsp&nbsp&nbsp <form:radiobutton path="antiDsDNA_status" value="Not Done" />Not Done </li><br><br>
				
				<li><u>C3</u> <form:input type="text" class="bodd" pattern="\\d+(\\.\\d+)?" path="C3" value="${form.getC3()}" /> g/l &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton path="C3_status" value="Low" />Low <form:radiobutton path="C3_status" value="Normal" />Normal <form:radiobutton path="C3_status" value="Not Done" />Not Done </li><br><br>
				
				<li><u>Max SLEDAI score:</u> <form:input type="text" pattern="\\d+(\\.\\d+)?" class="bodd" path="MEXSLEDAIScore" value="${form.getMEXSLEDAIScore()}" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton path="MEXSLEDAI_status" value="Complete+labs" />Complete+labs <form:radiobutton path="MEXSLEDAI_status" value="CBC only" />CBC only <form:radiobutton path="MEXSLEDAI_status" value="Urinalysis only" />Urinalysis only <form:radiobutton path="MEXSLEDAI_status"  value="No Labs"/>No Labs </li><br><br>
				
				<li><u>SLICC Damage score:</u> <form:input type="text" pattern="\\d+(\\.\\d+)?" class="bodd" path="SLICCDamageScore" value="${form.getSLICCDamageScore()}"/> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Involvement: <form:input type="text" class="bodd" path="involvement" value="${form.getInvolvement()}" /> </li><br><br>
				
				<li>Treatment of current lupus activity: <form:radiobutton path="treatment" value="Hospitalization" />Hospitalization <form:radiobutton path="treatment" value="Emergency" />Emergency <form:radiobutton path="treatment" value="Infusion out-patient" />Infusion out-patient</li><br><br>
				
				<li>
					<table>
						<tr>
							
							<th style="width:60%;">SLE medications</a></td>
							<c:if test="${previousDose != null }">
								<th class="phn"><a href="">Previous Dose</a></td>
							</c:if>
							
							<th class="ind"><a href="">Current Dose</a></td>
						</tr>

	<tr>
		<td class="pro">Prednisone/Methylprednisolone</a></td>
		<c:if test="${previousDose != null }">
			<td class="phn">${previousDose.prednisoneOrMethylprednisolone }</td>
		</c:if>
		<td class="ind"><form:input type="text" path="prednisoneOrMethylprednisolone" value="${form.getPrednisoneOrMethylprednisolone()}" /></td>		
	</tr>

	<tr>
		<td class="pro">Hydroxycholoroquine</a></td>
		<c:if test="${previousDose != null }">
			<td class="phn">${previousDose.hydroxychloroquine }</td>
		</c:if>
		<td class="ind"><form:input type="text" path="hydroxychloroquine" value="${form.getHydroxychloroquine()}" /></td>
	</tr>	
	
	<tr class="selected">
		<td class="pro">IV cyclophosphamide induction</a></td>
		<c:if test="${previousDose != null }">
			<td class="phn">${previousDose.iv_cyclophosphamideInduction }</td>
		</c:if>
		<td class="ind"><form:input type="text" path="iv_cyclophosphamideInduction" value="${form.getIv_cyclophosphamideInduction()}" /></td>
	</tr>	
	
	<tr>
		<td class="pro">IV cyclophosphamide maintenance</a></td>
		<c:if test="${previousDose != null }">
			<td class="phn">${previousDose.iv_cyclophosphamideMaintenance }</td>
		</c:if>
		<td class="ind"><form:input type="text" path="iv_cyclophosphamideMaintenance" value="${form.getIv_cyclophosphamideMaintenance()}" /></td>
	</tr>	
	
	<tr>
		<td class="pro">Other eg pulse steroid, biologic</a></td>
		<c:if test="${previousDose != null }">
			<td class="phn">${previousDose.medications_other }</td>
		</c:if>
		<td class="ind"><form:input path="medications_other" value="${form.getMedications_other()}" /></td>
	</tr>			
</table>

</li>

<li>Notes: <form:textarea class="boddmoretext" path="notes"  value="${form.getNotes()}" /> </li>

</ul><br><br><br><br>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="view_sledaa.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
				<font style="padding-left:360px"></font>	
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</ul>
			</section>
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

	<script type="text/javascript" src="resources/js/jquery.1.4.2.js"></script>
	<script type="text/javascript" src="resources/js/jsDatePick.jquery.min.1.3.js"></script>

</body>
</html>