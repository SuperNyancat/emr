<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>MEX SLEDAI</title>
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
		<form:form commandName="form" action="MEXSLEDAI_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_mex.it" method="GET">
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
			<form:form commandName="form" action="delete_mex.it" method="GET">
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
				<div>
				<p class="titles">MEX-SLEDAI</p><br><br>
				</div>
				
			<ul>

<li>

<table class="tablecontent2">

						<tr>
							<th class="pro" style="width:15%;">Score</th>
							<th class="pro" style="width:25%;" >Classification</th>
							<th class="phn" style="width:25%;">Description</th>
							<th class="ind" style="width:35%;">Definition</th>
							
						</tr>	
	
			<tr>
				<td class="pro"></td>
				<td class="pro"></td>
				<td class="pro">Psychosis</td>
				<td class="phn2">Impaired ability to function in daily activity due to serious disorders in the perception of reality, including hallucinations, incoherence, marked loss of associtation, poor content to thought, illogical thinking notorious disorganization do. It should exclude the presence of uremia, loxic drugs that can induce psychosis</td>

			</tr>

			<tr>
											<td class="pro"></td>
<td class="pro"></td>
<td class="pro">EVC</td>
				<td class="phn2">Recent Syndrome: exclude atherosclerosis</td>

			</tr>

			<tr>
											<td class="pro"></td>
				<td class="pro"></td>
<td class="pro">Seizure</td>
				<td class="phn2">Recent onset, excluding metaolic, infectious or secondary drug</td>

			</tr>

			<tr>
				<td class="pro">${form.getNeurologicalDisorder()}</td>
				<td class="pro1">Neurologic Disorder(8)</td>
				<td class="pro">Organic brain syndrome</td>
				<td class="phn2">With altered mental function loss in orientation, memory or other intellectual function. Altered consciousness with inability to maintain attention. In addition at least two of the following: perceptual alteration, incoherent speech, insomnia or daytime sleepiness, increse o decrease of psychomotor activity. Metabolic causes should be excluded, and secondary infectious drugs.</td>

			</tr>

			<tr>
			
											<td class="pro"></td>
				<td class="pro"></td>
				<td class="pro">Mononeuritis</td>
				<td class="phn2">Sensory or motor deficits of recent onset in one or more peripheral cranial nerves</td>

			</tr>

			<tr>
			
											<td class="pro"></td>
				<td class="pro"></td>
			<td class="pro">Myelitis</td>
				<td class="phn2">Paraplegia of recent onset and / or alteration of bladder control and bowl excluding other causes.</td>

			</tr>

			<tr>
				<td class="pro">${form.getRenal()}</td>
				<td class="pro">Renal</td>
				<td class="phn2" colspan="2">Erythrocyte or granular casts, hematuria over 5 per field. Exclude other causes starting protelunuria. New 05 g/L increased creatinine > 5 mg/dL</td>

			</tr>

			<tr>
			<td class="pro">${form.getVasculitis()}</td>
				<td class="pro">Vasculitis(4)</td>
				<td class="phn2" colspan="2">Ulcers, gangrene, finger pad vasculitis, myocardial, pericardial, splinter, hemorrhages. Diagnostic biopsy or angiography of vasculitis.</td>

			</tr>

			<tr>
			<td class="pro">${form.getHemolysis()}</td>
				<td class="pro">Hemolysis, Thrombocytopenia (3)</td>
				<td class="phn2" colspan="2">Hb < 12 g/dl and reticulocyte corrected> 3%, >100,000 platelets. Not due to drugs or other causes.</td>

			</tr>	

			<tr>
			<td class="pro">${form.getMyositis()}</td>
				<td class="pro">Myositis (3)</td>
				<td class="phn2" colspan="2">Myalgia and proximal muscle weakness associated with elevation of CPK</td>

			</tr>

			<tr>
			<td class="pro">${form.getArthritis()}</td>
				<td class="pro">Arhtritis (2)</td>
				<td class="phn2"colspan="2"> 2 painful joints with swelling or effusion</td>

			</tr>

			<tr>
			<td class="pro">${form.getCutaneous()}</td>
				<td class="pro">Cutaneous (2)</td>
				<td class="phn2" colspan="2">Malar rash of recent onset or recurrence inscreased malar erthema, mucosal ulcers or recent onset of oral ulcers or nasopharyngeal. Diffuse areas of alopecia, or hair fall easily.</td>

			</tr>

			<tr>
			<td class="pro">${form.getSerositis()}</td>
				<td class="pro">Serositis (2)</td>
				<td class="phn2" colspan="2">Pleurisy: pleuritic pain, pleural rub or pleural effusion on physical examination <br> Pericarditis: History blunt or audible pericadial friction rub. <br> Peritoritis: diffuse abdominal pain with slight rebound (excluding intra-abdominal causes)</td>

			</tr>

			<tr>
			<td class="pro">${form.getFever()}</td>
				<td class="pro">Fever, Fatigue (1)</td>
				<td class="phn2" colspan="2">PM Temp of 38 degrees celcius after exclusion of infectious process <br> Unexplained Fatigue</td>

			</tr>

			<tr>
			<td class="pro">${form.getLeukopenia()}</td>
				<td class="pro">Leukopenia, Lymphopenia (1) </td>
				<td class="phn2" colspan="2">Leukocytes < 4000 x mm3, not secondary to drug use <br> Lymphocytes < 1200 x mm3 not secondary to drug use.</td>

			</tr>
			<tr>
				<td> ${form.getScore()}</td>
				<td colspan="2" class="pro1" style="font-size:16px;"><br>Total MEX-SLEDAI Score </td>
			</tr>
			



		</table>

	
</li>

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
	</div>		
</div>
		
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/expandCollapse.js"></script>
	<script src="js/buttons.js"></script>
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