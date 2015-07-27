<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Create MEX SLEDAI</title>
	<meta charset="utf-8">
	
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
				<div>
				<p class="titles">MEX SLEDAI</p><br><br>
				</div>
				
				
		<form:form action="create_MEXSLEDAI.it?id=${patient.getId() }" method="POST" commandName="form">		
			<ul>

<li>

		<table class="tablecontent2">

						<tr>
							
							<th class="pro" >Classification</th>
							<th class="phn">Description</th>
							<th class="ind">Definition</th>
							
						</tr>	
	
			<tr>
				<td class="pro1"></td>
				<td class="pro">Psychosis</td>
				<td class="phn2">Impaired ability to function in daily activity due to serious disorders in the perception of reality, including hallucinations, incoherence, marked loss of associtation, poor content to thought, illogical thinking notorious disorganization do. It should exclude the presence of uremia, loxic drugs that can induce psychosis</td>

			</tr>

			<tr>
											<td class="pro1"></td>
<td class="pro">EVC</td>
				<td class="phn2">Recent Syndrome: exclude atherosclerosis</td>

			</tr>

			<tr>
											<td class="pro1"></td>
<td class="pro">Seizure</td>
				<td class="phn2">Recent onset, excluding metaolic, infectious or secondary drug</td>

			</tr>

			<tr>
				<td class="pro1"><select name="neurologicalDisorder">
						<option value="0">0</option>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option></select>Neurologic Disorder(8)</td>
				<td class="pro">Organic brain syndrome</td>
				<td class="phn2">With altered mental function loss in orientation, memory or other intellectual function. Altered consciousness with inability to maintain attention. In addition at least two of the following: perceptual alteration, incoherent speech, insomnia or daytime sleepiness, increse o decrease of psychomotor activity. Metabolic causes should be excluded, and secondary infectious drugs.</td>

			</tr>

			<tr>
		<td class="pro1"></td>
		<td class="pro">Mononeuritis</td>
				<td class="phn2">Sensory or motor deficits of recent onset in one or more peripheral cranial nerves</td>

			</tr>

			<tr>
			<td class="pro1"></td>
			<td class="pro">Myelitis</td>
				<td class="phn2">Paraplegia of recent onset and / or alteration of bladder control and bowl excluding other causes.</td>

			</tr>

			<tr>
				<td class="pro"><select name="renal" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option></select>
				Renal(6)</td>
				<td class="phn2" colspan="2">Erythrocyte or granular casts, hematuria over 5 per field. Exclude other causes starting protelunuria. New 05 g/L increased creatinine > 5 mg/dL</td>

			</tr>

			<tr>
				<td class="pro"><select name="vasculitis" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option></select>
				Vasculitis(4)</td>
				<td class="phn2" colspan="2">Ulcers, gangrene, finger pad vasculitis, myocardial, pericardial, splinter, hemorrhages. Diagnostic biopsy or angiography of vasculitis.</td>

			</tr>

			<tr>
				<td class="pro"><select name="hemolysis" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option></select>
				Hemolysis, Thrombocytopenia (3)</td>
				<td class="phn2" colspan="2">Hb < 12 g/dl and reticulocyte corrected> 3%, >100,000 platelets. Not due to drugs or other causes.</td>

			</tr>	

			<tr>
				<td class="pro"><select name="myositis" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option></select>
				Myositis (3)</td>
				<td class="phn2" colspan="2">Myalgia and proximal muscle weakness associated with elevation of CPK</td>

			</tr>

			<tr>
				<td class="pro"><select name="arthritis" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option></select>
				Arhtritis (2)</td>
				<td class="phn2"colspan="2"> >2 painful joints with swelling or effusion</td>

			</tr>

			<tr>
				<td class="pro"><select name="cutaneous" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option></select>
				Cutaneous (2)</td>
				<td class="phn2" colspan="2">Malar rash of recent onset or recurrence inscreased malar erthema, mucosal ulcers or recent onset of oral ulcers or nasopharyngeal. Diffuse areas of alopecia, or hair fall easily.</td>

			</tr>

			<tr>
				<td class="pro"><select name="serositis" >
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option></select>
				Serositis (2)</td>
				<td class="phn2" colspan="2">Pleurisy: pleuritic pain, pleural rub or pleural effusion on physical examination <br> Pericarditis: History blunt or audible pericadial friction rub. <br> Peritoritis: diffuse abdominal pain with slight rebound (excluding intra-abdominal causes)</td>

			</tr>

			<tr>
				<td class="pro"><select name="fever" >
						<option value="0">0</option>
						<option value="1">1</option></select>
				Fever, Fatigue (1)</td>
				<td class="phn2" colspan="2">PM Temp of 38 degrees celcius after exclusion of infectious process <br> Unexplained Fatigue</td>

			</tr>

			<tr>
				<td class="pro"><select name="leukopenia" >
						<option value="0">0</option>
						<option value="1">1</option></select>
				Leukopenia,Lymphopenia (1) </td>
				<td class="phn2" colspan="2">Leukocytes < 4000 x mm3, not secondary to drug use <br> Lymphocytes < 1200 x mm3 not secondary to drug use.</td>

			</tr>





		</table>

	
</li>

</ul><br><br><br><br>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Add Form" class="btnSave"></span>
					<a href="MEXSLEDAI_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
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

</body>
</html>