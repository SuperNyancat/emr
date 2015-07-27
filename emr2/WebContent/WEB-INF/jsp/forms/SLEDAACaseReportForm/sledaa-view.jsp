<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View SLEDAA Form</title>
	<meta charset="utf-8">
	
</head>

<body>

<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="form" action="SLEDAA_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnEdit" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_sledaa.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	
	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to delete?</p><br>
		<span class="btn">
			<form:form commandName="form" action="delete_sledaa.it" method="GET">
				<form:hidden path="patient.id" value="${patient.id }" />
				<form:hidden path="id" value="${form.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>
</div>



<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
					
			<div class="right">
				<div>

				<p class="titles">Systematic Lupus Erythematosus Disease Activity Assessments Case Report Form</p><br><br>
				</div>

				<h4>Baseline SLE data</h4>	
				
			<ul>
			<li>Age at SLE diagnosis: <span> ${form.getAgeAtSLEDiagnosis() } </span> &nbsp&nbsp&nbsp&nbsp&nbsp Date SLE diagnosis (mm/yyyy): <span name="monthSLEdiagnosis"> 02 </span> / <span name="yearSLEdiagnosis"> 2014 </span>  &nbsp&nbsp&nbsp&nbsp&nbsp SLE duration: <span name="SLE duration"> ${form.getSLEDuration() }</span> &nbsp years </li><br>

			<li><label class="bigfont">ACR criteria at SLE diagnosis:</label></li><br>
			<li> 
				<c:forEach items="${form.getACRCriteria() }" var="acr">
					<li><label>${acr }</label></li>		
				</c:forEach>
			 </li> <br></ul><br>

			
<ul>

<li>Current SLE data: <label>${form.getCurrentSLEData() } </label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp OR flare: <span>${form.getORFlare() }</span> </li><br>

<li><label class="bigfont">SLE activity involvement:</label> <label style="width:400px;"> ${form.getSLEActivityInvolvement()} </label></li><br>

<li>		
			<c:forEach items="${form.getSLEActivity() }" var="acr">
					<li><label>${acr }
					<c:if test="${acr.equalsIgnoreCase('other') }">
						: ${form.getOther() }
					</c:if>
					</label></li>
				</c:forEach>
</li><br><br>					

			<li>Hgb: <span> ${form.getHgb() } g/L </span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp WBC: <span name="WBC"> ${form.getWBC() } </span> x10^9/L &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Lympho: <span name="Lympho"> ${form.getLympho() } </span> x10^9/L &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
			Platelet:  <span> ${form.getPlatelet()} </span> x10^9/L </li><br><br>

			<li><u>Urine:</u> alb: <span> ${form.getUrine_alb() } </span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp wbc: <span name="wbc"> ${form.getUrine_wbc() } </span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp rbc: <span name="rbc"> ${form.getUrine_rbc() } </span> 
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp casts:  <span name="casts"> ${form.getUrine_casts() } </span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp UProt:  <span name="uprot"> ${form.getUProt() } </span> mg/dl &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp UCr:  <span name="ucr"> ${form.getUCR() } </span> mg/dl &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			 UPCR:  <span name="upcr"> ${form.getUPCR() } </span></li><br><br>

<li>Other labs if abnormal eg creatinine, ALT, CK: <label name="otherlabs" style="width:450px;"> ${form.getOtherLabs() } </span></li><br><br>



<li><label class="bigfontline">Physician's Global Assessment (PGA):</label> <span> ${form.getPGA() } </span> mm &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Rating: <span name="alb"> ${form.getPGA_rating() } </span> </li><br><br>

<li><u>SLEDAI S-S score:</u> <b><span name="SLEDAIS-SS" style="color:blue;"> ${form.getSSscore() } </span> </b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
<u>Max SLEDAI score:</u> <b> <span name="maxsledai" style="color:orange;"> ${form.getMEXSLEDAIScore() } </span> </b> </li><br><br>

<li>Anti-dsDNA: <span> ${form.getAntiDsDNA_status()} </span> &nbsp&nbsp&nbsp
<c:if test=" ${form.getAntiDsDNA_status().equalsIgnoreCase('positive')}">
	, Titer: <span>${form.getAntiDsDNA_positive_titer()}</span> 
</c:if>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Status: <span name="cbc"> ${form.getMEXSLEDAI_status() } </li><br><br>

<li><u>C3:</u> <span name="c3"> ${form.getC3() } </span> g/l &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <span> ${form.getC3_status() } </span> </li><br><br>

<li><u>SLICC Damage score:</u> <b><span name="SliccScore"> ${form.getSLICCDamageScore() } </span></b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
Involvement: <span name="SliccScore"> ${form.getInvolvement() } </span> </li><br><br>

<li>Treatment of current lupus activity: <span name="lupustreatment"> ${form.getTreatment() } </span></li><br><br>

<li>

<table class="tablecontent">
						<tr>
							
							<th class="pro"><a href="">SLE medications</a></th>
							<c:if test="${previousDose != null }">
								<th class="phn"><a href="">Previous Dose</a></th>
							</c:if>	
							
							<th class="ind"><a href="">Current Dose</a></th>
						</tr>	
			<tr>
				<td class="pro">Prednisone/Methylprednisolone</td>
				<c:if test="${previousDose != null }">
					<td class="phn"><label >${previousDose.getPrednisoneOrMethylprednisolone() }</label></td>
				</c:if>				
				<td class="ind"><label>${form.getPrednisoneOrMethylprednisolone() }</label></td>		
			</tr>
	
			<tr>
				<td class="pro">Hydroxycholoroquine</td>
				<c:if test="${previousDose != null }">
					<td class="phn"><label >${previousDose.getHydroxychloroquine() }</label></td>
				</c:if>
				<td class="ind"><label>${form.getHydroxychloroquine() }</label></td>
			</tr>	
			
			<tr>
				<td class="pro">IV cyclophosphamide induction</td>
				<c:if test="${previousDose != null }">
					<td class="phn"><label >${previousDose.getIv_cyclophosphamideInduction() }</label></td>
				</c:if>
				<td class="ind"><label>${form.getIv_cyclophosphamideInduction() }</label></td>
			</tr>	
			
			<tr>
				<td class="pro">IV cyclophosphamide maintenance</td>
				<c:if test="${previousDose != null }">
					<td class="phn"><label >${previousDose.getIv_cyclophosphamideMaintenance() }</label></td>
				</c:if>
				<td class="ind"><label>${form.getIv_cyclophosphamideMaintenance() }</label></td>
			</tr>	
			
			<tr>
				<td class="pro">Other eg pulse steroid, biologic</td>
				<c:if test="${previousDose != null }">
					<td class="phn"><label >${previousDose.getMedications_other() }</label></td>
				</c:if>
				<td class="ind"><label>${form.getMedications_other() }</label></td>
			</tr>			
		</table>

</li>
<br><br><br>

<li>Notes:<br> <label style="width:700px;" name="notes">${form.getNotes() }</LABEL></li>

</ul>
			
			</div>
			
					</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li>|
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li>|
								<li><label>Created By</label>:  <span>${ form.getRevisionHistory().getCreatedBy().getUsername() }</span></li>
							</ul>
						</section>
					</div>		
				</div>
			</div>
		</form>
		
	</div>
	
		
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
<script>
	function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
	}

	function hideDiv() {
   document.getElementById('welcomeDiv').style.display = "none";
	}
</script>
</body>
</html>