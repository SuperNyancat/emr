<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!doctype html>
<html lang="en">
<head>
	<title>Initial History Print</title>
	<meta charset="utf-8">
	
			<link rel="stylesheet" href="css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="css/template.css">
	<link rel="stylesheet" href="css/forms.css">
	<link rel="stylesheet" href="css/form-popup.css">
	<link rel="stylesheet" href="css/template-table.css">
	<link rel="stylesheet" href="css/homepage.css">	
	<link rel="stylesheet" href="css/tabs.css">	
	<link rel="stylesheet" href="css/settings.css">	
	<link rel="stylesheet" href="css/expandCollapse.css">
	
		<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<![endif]-->
	
	
</head>

<form>
<h4 style="text-align:center; font-size:13px;">UNIVERSITY OF SANTO TOMAS HOSPITAL<br>Espanya Blvd., Manila 1015<br>Tel. Nos. 731-3001 to 29; http://www.usthospital.com.ph<br>DEPARTMENT OF CLINICAL PATHOLOGY</h4>
<h4 style="text-align:center; font-size:11px;">INITIAL HISTORY</h4><br><br>

							<p class="titles">Patient History</p>

							<h1 style="color:black;">General Information</h1>	
							
							<table>

<tr>							
<td>Referred here by(check one) :</td>
<td> ${form.generalInfo.referredBy_RB}</td>
</tr>
<tr>
<td>Name of person making referral:</td>
<td>${form.generalInfo.referredBy}</td>
</tr>
<tr>
<td>The name of the physician your primary medical care: </td>
<td>${form.generalInfo.physicianName}</td>
</tr>
<tr>
<td>Do you have an orthopedic surgeon? </td>
<td> ${form.generalInfo.orthoSurgeon_RB},
	<c:if test="${!form.generalInfo.orthoSurgeonName.isEmpty()}">
    ${form.generalInfo.orthoSurgeonName}
    </c:if>
</tr>
<tr>
<td>Describe briefly your present symptoms:</td>
<td> ${form.generalInfo.symptoms}
</tr>
<tr>
<td>Date symptoms began(approximate):</td>
<td>${form.generalInfo.dateOfSymptoms}</td>
</tr>
<tr><td>Diagnosis:</td> <td>${form.generalInfo.diagnosis}
</tr>
<tr><td>Previous treatment for this problem(include physical therapy, surgery and injections; medications to be listed later)</td> 
<td>${form.generalInfo.previousTreatment}
</tr>
<tr><td>Please list the names of other practitioners you have seen for this problem:</td> 
<td>${form.generalInfo.otherPractitioners}
</tr>
</table>

&nbspPlease check the locations of your pain over the past week
<table>
<c:forEach items="${form.generalInfo.pain}" var="f">
	<tr><td>${f }</td></tr>
</c:forEach>
<c:if test="${!form.generalInfo.otherPain.isEmpty()}">
	<tr><td>${form.generalInfo.otherPain}</td></tr>
</c:if>
</table>


<br><br><h1 style="color:black;">Rheumatologic (Arthritis) History</h1>

<li>
								<p>At any time have you or a blood relative had any of the following? (Check if "yes")</p><br>
								
<table border="1px" class="navigation" style="margin:0px auto;">
								<tr>
									<td><b>DISEASE</b></td>
									<td colspan=3>PERSONS AFFECTED</td>
								</tr>
								
								<tr>
								<td rowspan=2>Arthritis</td>
								
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.arthritis}" var="f">
									${f}
								</c:forEach>
								
								
								</td>
									
									<td><label>Name: </label>  ${form.rheumaHistory.arthritis_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.arthritis_relationship} 
								</tr>	

								<tr>
								<td rowspan=2>Osteoarthritis</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.osteoArthritis}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.osteoArthritis_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.osteoArthritis_relationship} 
								</tr>
								
								<tr>
								<td rowspan=2>Gout</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.gout}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.gout_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.gout_relationship} 
								</tr>	

								<tr>
								<td rowspan=2>Childhood Arthritis</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.childhoodArthritis}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.childhoodArthritis_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.childhoodArthritis_relationship} 
								</tr>

								<tr>
								<td rowspan=2>Lupus or "SLE"</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.lupus}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.lupus_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.lupus_relationship} 
								</tr>

								<tr>
								<td rowspan=2>Rheumatoid Arthritis</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.rheumatoid}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.rheumatoid_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.rheumatoid_relationship} 
								</tr>	

								<tr>
								<td rowspan=2>Ankylosing Spondylitis</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.ankylosing}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.ankylosing_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.ankylosing_relationship} 
								</tr>	

								<tr>
								<td rowspan=2>Osteoporosis</td>
								<td rowspan=2>
								<c:forEach items="${form.rheumaHistory.osteo}" var="f">
									${f}
								</c:forEach></td>
									<td><label>Name: </label>  ${form.rheumaHistory.osteo_name}
								</tr>

								<tr>
									<td><label>Relationship: </label>  ${form.rheumaHistory.osteo_relationship} 
								</tr>	
								<tr>
									<td rowspan=2>Other Arthritis Conditions:</td>
									<td rowspan=3>${form.rheumaHistory.others}
								</tr>
								</table>
								
								
								<br><h1 style="color:black;">Systems Review</h1>	
								
								<ul>
<li>As you review the following list, please check any of those problem, which have significantly affected you.</li><br>
<table>
<tr>
<td>Date of last mammogram:  ${form.systemsReview.mammogram}<td>Date of last eye exam: ${form.systemsReview.eyeExam}
</td>Date of last chest x-ray: ${form.systemsReview.chestXRay} 
</tr>
<tr>
<td>Date of last Tuberculosis Test: ${form.systemsReview.tuberculosis}</td>Date of last bone densitometry: ${form.systemsReview.boneDensitometry}</li><br>
</tr>
</table>

<c:if test="${fn:length(form.systemsReview.constitutional) > 0}">
	<li><b><u>Constitutional</b></u></li><br>
	<c:forEach items="${form.systemsReview.constitutional}" var="f"> 
	<li>
		${f }
		<c:if test="${f.equalsIgnoreCase('weight gain') }">
			- ${form.systemsReview.weightGain }
		</c:if>
		<c:if test="${f.equalsIgnoreCase('weight loss') }">
			- ${form.systemsReview.weightLoss }
		</c:if>
	</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.eyes) > 0}">
	<li><b><u>Eyes</b></u></li><br>
	<c:forEach items="${form.systemsReview.eyes}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.earsNoseMouthThroat) > 0}">
	<li><b><u>Ears-Nose-Mouth-Throat</b></u></li><br>
	<c:forEach items="${form.systemsReview.earsNoseMouthThroat}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.cardiovascular) > 0}">
	<li><b><u>Cardiovascular</b></u></li><br>
	<c:forEach items="${form.systemsReview.cardiovascular}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.respiratory) > 0}">
	<li><b><u>Respiratory</b></u></li><br>
	<c:forEach items="${form.systemsReview.respiratory}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.gastrointestinal) > 0}">
	<li><b><u>Gastrointestinal</b></u></li><br>
	<c:forEach items="${form.systemsReview.gastrointestinal}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.genitourinary) > 0}">
<li><b><u>Genitourinary</b></u></li><br>
	<c:forEach items="${form.systemsReview.genitourinary}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>


<li>For Women only:</li><br>
<table>

<tr>
<td>Age when periods began: ${form.systemsReview.agePeriod}</td> 
Periods regular? ${form.systemsReview.regular} <td>How many days apart? ${form.systemsReview.daysApart}
</tr>
<tr>
<td>Date of last period? ${form.systemsReview.lastPeriod}</td>Date of last pap? ${form.systemsReview.lastPap}</td>
Bleeding after menopause? ${form.systemsReview.bleedingAfterMenopause}</li><br><br>
</tr>
<tr>
<td>Number of pregnancies? ${form.systemsReview.pregnancies}</td>Number of miscarriages? ${form.systemsReview.miscarriages}</li><br>
</tr>
</table>

<c:if test="${fn:length(form.systemsReview.musculoskeletal) > 0}">
<li><b><u>Muscoloskeletal</b></u></li><br>
<c:forEach items="${form.systemsReview.musculoskeletal}" var="f"> 
	<li>
		${f }
		<c:if test="${f.equalsIgnoreCase('Morning stiffness') }">
			- ${form.systemsReview.hours } hours ${form.systemsReview.min } minutes
		</c:if>
	</li>
	</c:forEach>
	<li> ${form.systemsReview.joints }</li><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.integumentary) > 0}">
<li><b><u>Integumentary(skin and/or breast)</b></u></li><br>
<c:forEach items="${form.systemsReview.integumentary}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.neurologicalSystem) > 0}">
<li><b><u>Neurological System</b></u></li><br>
<c:forEach items="${form.systemsReview.neurologicalSystem}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.psychiatric) > 0}">
<li><b><u>Psychiatric</b></u></li><br>
<c:forEach items="${form.systemsReview.psychiatric}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.endocrine) > 0}">
<li><b><u>Endocrine</b></u></li><br>
<c:forEach items="${form.systemsReview.endocrine}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.hematologic) > 0}">
<li><b><u>Hematologic/Lymphatic</b></u></li><br>
<c:forEach items="${form.systemsReview.hematologic}" var="f">
<li>
		${f }
		<c:if test="${f.equalsIgnoreCase('transfusion') }">
			 on   ${form.systemsReview.when}
		</c:if>
	</li>
	</c:forEach>
	<li> ${form.systemsReview.joints }</li><br><br>
</c:if>

<c:if test="${fn:length(form.systemsReview.allergic) > 0}">
<li><b><u>Allergic/Immunologic</b></u></li><br>
<c:forEach items="${form.systemsReview.allergic}" var="f"> 
	<li>${f}</li>
	</c:forEach><br><br>
</c:if>

</ul>
<br><br><br><br><br>
<br><h1 style="color:black;">Social History</h1>	

<table border="1px" class="navigation" style="margin:0px auto;">
								<tr>
									<td align="center"><b><u>CAFFEINATED BEVERAGES</u></b></td>
									<td align="center"><b><u>SMOKING</u></b></td>
									<td align="center"><b><u>DRINKING</u></b></td>							
								</tr>
								
								<tr>
									<td>
										<p>Do you drink caffeinated beverages?</p>
										${form.socialHistory.caffeinatedBeverages}
										
									</td>
									
									<td>
										<p>Do you smoke?</p>
										${form.socialHistory.smoke}
																			
									</td>
									
									<td>
										<p>Do you drink alcohol?</p>
										${form.socialHistory.alcohol}
																		
									</td>
								</tr>
								
								<tr>
									<td>
										<p>IF YES, how many cups/glasses per day?</p>
										${form.socialHistory.glassesPerDay}									
									</td>
								
									<td>
										<p>IF PAST, how long ago?</p>
										${form.socialHistory.smokingDuration}																										
									</td>
									
									<td>
										<p>Has anyone ever told you to cut down on your drinking?</p>
										${form.socialHistory.cutDownDrinking}
										
									</td>
								</tr>

								<tr>
									<td></td>
									<td></td>
									<td>
										<p>IF YES, how many bottles per week?</p>
										${form.socialHistory.numberPerWeek} bottles									
									</td>
									
								</tr>
								</table>
								<br><br>
								<table>
								<tr>
									<td colspan="2" align="center"><b><u>DRUGS</u></b></td>								
								</tr>
								
								<tr>															
									<td>
										<p>Do you use drugs for reasons that are not medical?</p>
										${form.socialHistory.drugs}
																		
									</td>
									
									<td>
										<p>IF YES, please list:</p>
										${form.socialHistory.listOfDrugs}									
									</td>
								</tr>

								<tr>
									<td align="center"><b><u>EXERCISE</u></b></td>
									<td align="center"><b><u>SLEEP</u></b></td>
								</tr>
								
								<tr>
									<td align="center">
									<p>Do you exercise regularly?</p>
									${form.socialHistory.exercise}
									<br>
									<label>Type</label>  ${form.socialHistory.exerciseType}	
									<label>Amount&nbspper&nbspWeek</label>  ${form.socialHistory.exerciseWeeklyAmount}
									</td>
									
									<td align="center">
										<p>How many hours of sleep do you get at night?</p>
											${form.socialHistory.hoursOfSleep}<br><br>
										<p>Do you get enough sleep at night?</p>
											${form.socialHistory.enoughSleep}
											<br><br>
										<p>Do you wake up feeling rested?</p>
											${form.socialHistory.rested}
											<br><br>										
									</td>
								</tr>
								</table>
								
								<br><h1 style="color:black;">Past Medical History</h1>
								<ul>
<li>Do you now or have you ever had: (check if "yes")</li><br>
<table>
<c:forEach items="${form.medicalHistory.pastProblems}" var="f">
<tr>
	<td>${f }<td>
</tr>
</c:forEach>
</table>

<table>
<tr><td>Other significant illness (please list): <td>${form.medicalHistory.others}</tr>
<tr><td>Natural or Alternative Therapies: <td>${form.medicalHistory.therapies}</tr>
</table>
</ul>

	<br><h1 style="color:black;">Previous Operations</h1>
	
	<c:choose>
					<c:when test="${fn:length(form.systemsReview.musculoskeletal) > 0}">
						<table border="1px" class="navigation">
									<tr>
										<td align="center"><b>Type</b></td>
										<td align="center"><b>Year</b></td>
										<td align="center"><b>Reason</b></td>
									</tr>
									<c:forEach items="${form.previousOperations.previousOperations}" var="f">
									<tr>
										<td align="center">${f.type}
										<td align="center">${f.year}
										<td align="center">${f.reason}
									</tr>
									</c:forEach>
							</table>	
						
					</c:when>
					<c:otherwise>
						<p> ${patient.personInfo.firstName } ${patient.personInfo.lastName } has not undergone any operations yet.
					</c:otherwise>
				</c:choose>
								<br><br>
														
								
								<table>
									<tr>
										<td>
											<p>Any previous fractures?</p>
											${form.previousOperations.fractures}
																					
										</td>
										
										<td>
											<p>Describe:</p>
											${form.previousOperations.fracturesDescriptions} 										
										</td>
									</tr>
									
									<tr>
										<td>
											<p>Any other serious injury?</p>
											${form.previousOperations.injuries}
																						
										</td>
										
										<td>
											<p>Describe:</p>
											${form.previousOperations.injuriesDescriptions}										
										</td>
									</tr>
								
								</table>
								
								<br><h1 style="color:black;">Family History</h1>	
								
								<ul>
<li><table>
<tr>
<th style="width:50px;">If Living</th>
<th style="width:100px;">Age</th>
<th style="width:300px;">Health</th>
<th style="width:60px;">If Deceased</th>
<th style="width:170px;">Age at Death</th>
<th style="width:300px;">Cause</th>
</tr>
<tr><th>Father</th></tr>
<tr>
<td>If living - <td>${form.familyHistory.f_age}</td> ${form.familyHistory.f_health}</td>
If deceased - <td> ${form.familyHistory.f_ageDeath}</td>${form.familyHistory.f_cause}</tr>
<tr><th>Mother</th></tr>
<tr>
<td>If living - <td>${form.familyHistory.m_age}</td> ${form.familyHistory.m_health}</td>
If deceased - <td> ${form.familyHistory.m_ageDeath}</td>${form.familyHistory.m_cause}</tr>
</table></li>
<li><br><br>

<table>
<td>Number of siblings: ${form.familyHistory.siblings}</td>Number living: ${form.familyHistory.s_living}
</td>Number deceased: ${form.familyHistory.s_deceased}</tr>
</tr>
<tr>
<td>Number of children: ${form.familyHistory.childrenNum}</td>Number living: ${form.familyHistory.c_living}
</td>Number deceased: ${form.familyHistory.c_deceased} </tr>

<tr><td>List ages of each ${form.familyHistory.ages}</tr>
</table>
<li>Health of children: ${form.familyHistory.healthOfChildren} </li><br>
<li>Do you know of any blood relative who has or had: (check and give relationship)</li><br>
<table>
<c:forEach items="${ form.familyHistory.bloodRelativesDiseases }" var="f">
	<tr><td>
		${f }
		<c:if test="${f.equals('cancer') }">
			 - ${form.familyHistory.cancer}
		</c:if>
		<c:if test="${f.equals('Heart disease') }">
			 - ${form.familyHistory.heartDisease}
		</c:if>
		<c:if test="${f.equals('Rheumatic fever') }">
			 - ${form.familyHistory.rheumaticFever}
		</c:if>
		<c:if test="${f.equals('Tuberculosis') }">
			 - ${form.familyHistory.tubercolosis}
		</c:if>
		<c:if test="${f.equals('Leukemia') }">
			 - ${form.familyHistory.leukemia}
		</c:if>
		<c:if test="${f.equals('High Blood Pressure') }">
			 - ${form.familyHistory.highBloodPressure}
		</c:if>
		<c:if test="${f.equals('Epilepsy') }">
			 - ${form.familyHistory.epilepsy}
		</c:if>
		<c:if test="${f.equals('Diabetes') }">
			 - ${form.familyHistory.diabetes}
		</c:if>
		<c:if test="${f.equals('Stroke') }">
			 - ${form.familyHistory.stroke}
		</c:if>
		<c:if test="${f.equals('Bleeding') }">
			 - ${form.familyHistory.bleedingTendency}
		</c:if>
		<c:if test="${f.equals('Asthma') }">
			 - ${form.familyHistory.asthma}
		</c:if>
		<c:if test="${f.equals('Goiter') }">
			 - ${form.familyHistory.goiter}
		</c:if>
		<c:if test="${f.equals('Colitis') }">
			 - ${form.familyHistory.colitis}
		</c:if>
		<c:if test="${f.equals('Alcoholism') }">
			 - ${form.familyHistory.alcoholism}
		</c:if>
		<c:if test="${f.equals('Psoriasis') }">
			 - ${form.familyHistory.psoriasis}
		</c:if>
	</td></tr>
</c:forEach>

</table>
<br>
</ul>

<br><h1 style="color:black;">Medications</h1>
<p>Drug Allergies?</p>
									${form.presentMedications.drugAllergies}
									<br><br>
								<p>To what?</p>
								${form.presentMedications.drugAllergyDetails}<br><br>
								<p>Type of reaction:</p>
								${form.presentMedications.reaction}<br><br>
								
								
								<p align="center"><b>PRESENT MEDICATIONS</b></p>
								<p align="center">(List any medications you are taking. Include such item as aspirin, vitamins, laxatives, calcium, and other supplements, etc.)</p><br><br>	
								<table border="1" class="navigation" style="margin:0px auto;">
									<tr>
										<td align="center"><b>Name of Drug</b></td>
										<td align="center"><b>Dose (include strength & number of pills per day)</b></td>
										<td align="center"><b>How long have you taken this medication</b></td>
										<td align="center" colspan="3"><b>Please choose: Helped?</b></td>
									</tr>
								<c:forEach items="${form.presentMedications.presentMedications}" var="f">
									<tr>
										<td align="center">${f.name}</td>
										<td align="center">${f.dose}</td>
										<td align="center">${f.duration}</td>
										<td align="center">${f.isHelpful}</td>
										
									</tr>
								</c:forEach>
													
									
								</table>	
								
								<br><br><h1 style="color:black;">Past Medications</h1>		
								
								<ul>
<li>Please review the list of "arthritis" medications. As accurately as possible, try to remember which medications you have taken, how long you were taking the medication, the results of taking the medication and list any reactions you may have had. Record your comments in the spaces provided.
<br>


<table>
<tr><th style="width:300px;">Drug names/Dosage</th>
<th style="width:150px;">Length of Time</th>
<th style="width:200px;">Rate</th>
<th style="width:300px;">Reactions</th></tr>


<c:forEach items="${form.pastMedications.pastMedications }" var="f" varStatus="i">

	<tr>
		<td>${f.drug}</td>
		<td>${f.length}</td>
		<td>${f.isHelpful}</td>
		<td>${f.reactions}</td>
	</tr>
	
	<c:if test="${f.drug.equals('Non-steroidal Anti-inflammatory drugs(NSAIDs)') }">
		<c:forEach items="${form.pastMedications.NSAIDs }" var="nsaid">
			<tr><td><td>${nsaid}</td></tr>
		</c:forEach>
	</c:if>
</c:forEach>
</table>
</li><br>

<li>Please list supplements:</li><br>
<li>${form.pastMedications.supplements}</li><br>
<li>Have you participated in any clinical trials for new medications? ${form.pastMedications.clinicalTrials}</li><br>
<li>If yes, list: ${form.pastMedications.clinicalTrials_details}</li><br>
</ul>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1 style="color:black;">Activities of Daily Living</h1>	
<p>Do you have stairs to climb?
									${form.activities.stairs}
								&nbsp;&nbsp;&nbsp;IF YES, how many?${form.activities.stairsCount}</p>
								<p>How many people in household?${form.activities.houseHoldCount}</p>
								<p>Relationship and age of each:</p>
								${form.activities.relationshipAge}<br><br>
								<p>Who does most of the housework? &nbsp&nbsp&nbsp ${form.activities.houseWork}</p>							
								<p>Who does most of the shopping?&nbsp&nbsp&nbsp ${form.activities.shopping}</p>							
								<p>Who does most of the yard work?&nbsp&nbsp${form.activities.yardWork}</p><br><br>
								<p align="center">On the scale of 1-5, which best describes your situation;<i>Most of the time, I function...</i></p><br>
								<p align="center">
									${form.activities.situation}
								</p><br><br>
								<table border="1" class="navigation" style="margin:0px auto;">
									<tr>
										<td align="center" colspan="2"><b>Because of health problems, do you have difficulty:</b></td>
										
									</tr>
								
									<tr>
										<td align="">Using your hands to grasp small objects? (buttons, toothbrush, pencil, etc.</td>
										<td align="center">${form.activities.hands}
									</tr>

									<tr>
										<td align="">Walking?</td>
										<td align="center">${form.activities.walking}
									</tr>	

									<tr>
										<td align="">Climbing stairs?</td>
										<td align="center">${form.activities.climbingStairs}
									</tr>	

									<tr>
										<td align="">Descending stairs?</td>
										<td align="center">${form.activities.descendingStairs}
									</tr>	

									<tr>
										<td align="">Sitting down?</td>
										<td align="center">${form.activities.sitting}
									</tr>	

									<tr>
										<td align="">Getting up from chair?</td>
										<td align="center">${form.activities.gettingUp}
									</tr>	

									<tr>
										<td align="">Touching your feet while seated?</td>
										<td align="center">${form.activities.touchingFeet}
									</tr>	

									<tr>
										<td align="">Reaching behind your back?</td>
										<td align="center">${form.activities.reachingBack}
									</tr>	

									<tr>
										<td align="">Reaching behind your head?</td>
										<td align="center">${form.activities.reachingHead}
									</tr>	

									<tr>
										<td align="">Dressing yourself?</td>
										<td align="center">${form.activities.dressing}
									</tr>	

									<tr>
										<td align="">Going to sleep?</td>
										<td align="center">${form.activities.sleep}
									</tr>	

									<tr>
										<td align="">Staying asleep due to pain?</td>
										<td align="center">${form.activities.stayingAsleep}
									</tr>	

									<tr>
										<td align="">Obtaining restful sleep?</td>
										<td align="center">${form.activities.restfulSleep}
									</tr>	

									<tr>
										<td align="">Bathing?</td>
										<td align="center">${form.activities.bathing}
									</tr>	

									<tr>
										<td align="">Eating?</td>
										<td align="center">${form.activities.eating}
									</tr>	

									<tr>
										<td align="">Working?</td>
										<td align="center">${form.activities.working}
									</tr>	

									<tr>
										<td align="">Getting along with family members?</td>
										<td align="center">${form.activities.gettingAlong}
									</tr>	

									<tr>
										<td align="">In your sexual relationship?</td>
										<td align="center">${form.activities.sexual}
									</tr>	

									<tr>
										<td align="">Engaging in leisure time activities?</td>
										<td align="center">${form.activities.liesureActivities}
									</tr>

									<tr>
										<td align="">With morning stiffness?</td>
										<td align="center">${form.activities.morningStiffness}
									</tr>

									<tr>
										<td align="">Do you use a ${form.activities.walkHelper}</td>
										<td align="center">${form.activities.walkHelper_rate}
									</tr>									
								</table>
								<br><br>
								<p>What is the hardest thing for you to do?</p>
								${form.activities.hardestThing}<br><br>
								<table border="1" class="navigation">								
									<tr>
										<td align="">Are you receiving disability?</td>
										<td align="center">${form.activities.receiveDisability}</td>
									</tr>
									
									<tr>
										<td align="">Are you applying for disability?</td>
										<td align="center">${form.activities.applyDisability}</td>
									</tr>	

									<tr>
										<td align="">Do you have a medically related lawsuit pending?</td>
										<td align="center">${form.activities.medicalLawsuit}</td>
									</tr>									
								</table>
								


</body>
</html>
