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
<head>
	<meta charset="utf-8">
	
				<link rel="stylesheet" media="all" href="resources/css/jsDatePick_ltr.min.css" type="text/css">
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
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="New Patient History" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="New Patient History" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>


<div class="pageCtrl">	
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper">	
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
			<jsp:param name="selected" value="history" />
			</jsp:include>
		
			<div class="tab-content">
				<div id="History" class="tab active">           			
				<div class="rightHistory">
						<form:form method="post" class="crmForm" commandName="form" action="ih_create.it?id=${patient.id }" >
							<p class="titles">Patient History</p>
								<br><br><br><br><br>
							<h1>General Information</h1>	
							<div class="section">							

<table>

<tr>							
<td>Referred here by(check one) :</td>
<td> <form:radiobutton path="generalInfo.referredBy_RB" required="true" value="Self"/>Self <form:radiobutton path="generalInfo.referredBy_RB" required="true" value="Family"/>Family <form:radiobutton required="true" path="generalInfo.referredBy_RB" value="Friend"/>Friend <form:radiobutton path="generalInfo.referredBy_RB" required="true" value="Doctor"/>Doctor <form:radiobutton path="generalInfo.referredBy_RB" required="true" value="Other Health Professional"/>Other Health Professional</td>
</tr>
<tr>
<td>Name of person making referral:</td>
<td><form:input style="width:300px;" path="generalInfo.referredBy"/></td>
</tr>
<tr>
<td>The name of the physician your primary medical care: </td>
<td> <form:input style="width:300px;" path="generalInfo.physicianName"/></td>
</tr>
<tr>
<td>Do you have an orthopedic surgeon? </td>
<td> <form:radiobutton required="true" value="Yes" path="generalInfo.orthoSurgeon_RB"/>Yes <form:radiobutton required="true" vaue="No" path="generalInfo.orthoSurgeon_RB"/>No    If <strong>yes</strong>, Name: <form:input style="width:300px;" path="generalInfo.orthoSurgeonName"/></td>
</tr>
<tr>
<td>Describe briefly your present symptoms:</td>
<td> <form:textarea style="width:350px;height:50px;" path="generalInfo.symptoms"/></td>
</tr>
<tr>
<td>Date symptoms began (approximate):</td>
<td><input style="width:120px;" name="dateOfSymptoms" type="text" id="inputField" readonly/></td>
</tr>
<tr><td>Diagnosis:</td> <td><form:input style="width:300px;" path="generalInfo.diagnosis"/></td>
</tr>
<tr><td>Previous treatment for this problem(include physical therapy, surgery and injections; medications to be listed later)</td> <td><form:textarea style="width:350px; height:50px;" path="generalInfo.previousTreatment"/>
</tr>
<tr><td>Please list the names of other practitioners you have seen for this problem:</td> <td><form:textarea style="width:350px; height:50px;" path="generalInfo.otherPractitioners"/> </td>
</tr>
</table>

&nbspPlease check the locations of your pain over the past week
<table>
<tr><td><form:checkbox path="generalInfo.pain" value="Neck"/>Neck<td><form:checkbox path="generalInfo.pain" value="Left arm"/>Left arm <td><form:checkbox path="generalInfo.pain" value="Right arm"/> Right arm <td><form:checkbox path="generalInfo.pain" value="Left hand"/>Left hand <td><form:checkbox path="generalInfo.pain" value="Right hand"/>Right hand </tr>
<tr><td><form:checkbox path="generalInfo.pain" value="Left shoulder"/>Left shoulder <td><form:checkbox path="generalInfo.pain" value="Right shoulder"/>Right shoulder <td><form:checkbox path="generalInfo.pain" value="Upper back"/>Upper back <td><form:checkbox path="generalInfo.pain" value="Middle back"/>Middle back <td><form:checkbox path="generalInfo.pain" value="Lower back"/>Lower back </tr>
<tr><td><form:checkbox path="generalInfo.pain" value="Left leg"/>Left leg <td><form:checkbox path="generalInfo.pain" value="Right leg"/>Right leg<td><form:checkbox path="generalInfo.pain" value="Left foot"/>Left foot<td><form:checkbox path="generalInfo.pain" value="Right foot"/>Right foot<td> Others: <form:input path="generalInfo.otherPain"/></td></tr>
<tr><td><form:checkbox path="generalInfo.pain" value="Left knee"/>Left knee <td><form:checkbox path="generalInfo.pain" value="Right knee"/>Right knee</tr>

</table>

									</div>
						
						
						
						
						<br><br><br>
							<br><h1>Rheumatologic (Arthritis) History</h1>
								<div class="section">
								<li>
								<p>At any time have you or a blood relative had any of the following? (Check if "yes")</p><br>
								<div>
								
								<table border="1px" class="navigation" style="margin:0px auto;">
								<tr>
									<th><b>DISEASE</b></td>
									<th colspan=3>PERSONS AFFECTED</td>
								</tr>
								
								<tr>
								<td rowspan=2>Arthritis</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.arthritis" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.arthritis" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.arthritis_name"   style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.arthritis_relationship"  style="width:120px"/></td> 
								</tr>	

								<tr>
								<td rowspan=2>Osteoarthritis</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.osteoArthritis" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.osteoArthritis" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.osteoArthritis_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.osteoArthritis_relationship"  style="width:120px"/></td> 
								</tr>
								
								<tr>
								<td rowspan=2>Gout</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.gout" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.gout" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.gout_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.gout_relationship"  style="width:120px"/></td> 
								</tr>	

								<tr>
								<td rowspan=2>Childhood Arthritis</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.childhoodArthritis" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.childhoodArthritis" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.childhoodArthritis_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.childhoodArthritis_relationship"  style="width:120px"/></td> 
								</tr>

								<tr>
								<td rowspan=2>Lupus or "SLE"</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.lupus" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.lupus" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.lupus_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.lupus_relationship"  style="width:120px"/></td> 
								</tr>

								<tr>
								<td rowspan=2>Rheumatoid Arthritis</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.rheumatoid" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.rheumatoid" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.rheumatoid_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.rheumatoid_relationship"  style="width:120px"/></td> 
								</tr>	

								<tr>
								<td rowspan=2>Ankylosing Spondylitis</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.ankylosing" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.ankylosing" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.ankylosing_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.ankylosing_relationship"  style="width:120px"/></td> 
								</tr>	

								<tr>
								<td rowspan=2>Osteoporosis</td>
								<td rowspan=2><form:checkbox path="rheumaHistory.osteo" value="Yourself;"/>Yourself</td>
									<td ROWSPAN=2><form:checkbox path="rheumaHistory.osteo" value=" Relative;"/>Relative</td>
									<td><label>Name</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input path="rheumaHistory.osteo_name"  style="width:120px"/></td>
								</tr>

								<tr>
									<td><label>Relationship</label>  <form:input path="rheumaHistory.osteo_relationship"  style="width:120px"/></td> 
								</tr>	
								<tr>
									<td rowspan=2>Other Arthritis Conditions:</td>
									<td rowspan=3><form:input path="rheumaHistory.others"/></td>
								</tr>
								</table>
								
								</div>
								</li>
								</div>
			
			
			
			
			
			<br><br><br>
							<br><h1>Systems Review</h1>	
								<div class="section">
								<ul>
<li>As you review the following list, please check any of those problem, which have significantly affected you.</li><br>
<table>
<tr>        
<td>Date of last mammogram: <td><input style="width:120px;" name="mammogram" type="text" id="inputField" readonly/></td>  
<td>Date of last eye exam: <td><input style="width:120px;" name="eyeExam" type="text" id="inputField" readonly/> </td>
<td>Date of last chest x-ray: <td><input style="width:120px;" name="chestXRay" type="text" id="inputField" readonly/> </td>
</tr>
<tr>
<td>Date of last Tuberculosis Test: <td><input style="width:120px;" name="tuberculosis" type="text" id="inputField" readonly/></td> 
<td>Date of last bone densitometry: <td><input style="width:120px;" name="boneDensitometry" type="text" id="inputField" readonly/></td></li><br>
</tr>
</table>

<li><b><u>Constitutional</b></u></li><br>
<li><form:checkbox path="systemsReview.constitutional" value="Weight Gain"/>Recent weight gain;   amount:(lbs) <form:input path="systemsReview.weightGain" style="width:30px;"/> <form:checkbox path="systemsReview.constitutional" value="Weight Loss"/>Recent weight loss;   amount:(lbs) <form:input path="systemsReview.weightLoss" style="width:30px;" /> <form:checkbox path="systemsReview.constitutional" value="Fatigue"/>Fatigue <form:checkbox path="systemsReview.constitutional" value="Weakness"/>Weakness <form:checkbox path="systemsReview.constitutional" value="Fever"/>Fever </li><br>

<li><b><u>Eyes</b></u></li><br>
<li><form:checkbox value="Pain " path="systemsReview.eyes"/>Pain <form:checkbox value="Redness " path="systemsReview.eyes"/>Redness <form:checkbox value="Loss of vision " path="systemsReview.eyes"/>Loss of vision <form:checkbox value="Double or blurred vision " path="systemsReview.eyes"/>Double or blurred vision <form:checkbox value="Dryness " path="systemsReview.eyes"/>Dryness <form:checkbox value="Feels like something in eye " path="systemsReview.eyes"/>Feels like something in eye <form:checkbox value="Itching eyes " path="systemsReview.eyes"/>Itching eyes</li><br><br>

<li><b><u>Ears-Nose-Mouth-Throat</b></u></li><br>
<li><form:checkbox value="Ringing in ears" path="systemsReview.earsNoseMouthThroat"/>Ringing in ears <form:checkbox value="Loss of hearing" path="systemsReview.earsNoseMouthThroat"/>Loss of hearing <form:checkbox value="Nosebleeds" path="systemsReview.earsNoseMouthThroat"/>Nosebleeds <form:checkbox value="Loss of smell" path="systemsReview.earsNoseMouthThroat"/>Loss of smell <form:checkbox value="Dryness in nose" path="systemsReview.earsNoseMouthThroat"/>Dryness in nose <form:checkbox value="Runny nose" path="systemsReview.earsNoseMouthThroat"/>Runny nose <form:checkbox value="Sore tongue " path="systemsReview.earsNoseMouthThroat"/>Sore tongue <form:checkbox value="Bleeding gums " path="systemsReview.earsNoseMouthThroat"/>Bleeding gums</li><br><br>
<li><form:checkbox value="Sores in mouth" path="systemsReview.earsNoseMouthThroat"/>Sores in mouth <form:checkbox value="Loss of taste" path="systemsReview.earsNoseMouthThroat"/>Loss of taste <form:checkbox value="Dryness of mouth" path="systemsReview.earsNoseMouthThroat"/>Dryness of mouth <form:checkbox value="Frequent sore throats" path="systemsReview.earsNoseMouthThroat"/>Frequent sore throats <form:checkbox value="Hoarseness" path="systemsReview.earsNoseMouthThroat"/>Hoarseness <form:checkbox value="Difficulty in swallowing " path="systemsReview.earsNoseMouthThroat"/>Difficulty in swallowing</li><br><br>

<li><b><u>Cardiovascular</b></u></li><br>
<li><form:checkbox value="Pain in chest" path="systemsReview.cardiovascular"/>Pain in chest <form:checkbox value="Irregular heart beat" path="systemsReview.cardiovascular"/>Irregular heart beat <form:checkbox value="Sudden changes in heart beat" path="systemsReview.cardiovascular"/>Sudden changes in heart beat <form:checkbox value="High blood pressure" path="systemsReview.cardiovascular"/>High blood pressure <form:checkbox value="Heart murmurs" path="systemsReview.cardiovascular"/>Heart murmurs </li><br><br>

<li><b><u>Respiratory</b></u></li><br>
<li><form:checkbox value="Shortness of breath" path="systemsReview.respiratory"/>Shortness of breath <form:checkbox value="Difficulty in breathing at night" path="systemsReview.respiratory"/>Difficulty in breathing at night <form:checkbox value="Swollen legs or feet" path="systemsReview.respiratory"/>Swollen legs or feet <form:checkbox value="Cough" path="systemsReview.respiratory"/>Cough <form:checkbox value="Coughing of blood" path="systemsReview.respiratory"/>Coughing of blood <form:checkbox value="Wheezing (asthma)" path="systemsReview.respiratory"/>Wheezing (asthma)</li><br><br>

<li><b><u>Gastrointestinal</b></u></li><br>
<li><form:checkbox value="Nausea" path="systemsReview.gastrointestinal"/>Nausea <form:checkbox value="Vomiting of blood or coffee ground material" path="systemsReview.gastrointestinal"/>Vomiting of blood or coffee ground material <form:checkbox value="Stomach pain relieved by food or milk" path="systemsReview.gastrointestinal"/>Stomach pain relieved by food or milk <form:checkbox value="Jaundice" path="systemsReview.gastrointestinal"/>Jaundice <form:checkbox value="Increasing constipation" path="systemsReview.gastrointestinal"/>Increasing constipation</li><br><br>
<li><form:checkbox value="Persistent diarrhea" path="systemsReview.gastrointestinal"/>Persistent diarrhea <form:checkbox value="Blood in tools" path="systemsReview.gastrointestinal"/>Blood in tools <form:checkbox value="Black stools" path="systemsReview.gastrointestinal"/>Black stools <form:checkbox value="Heartburn" path="systemsReview.gastrointestinal"/>Heartburn</li><br><br>

<li><b><u>Genitourinary</b></u></li><br>
<li><form:checkbox value="Difficult urination" path="systemsReview.genitourinary"/>Difficult urination <form:checkbox value="Pain or burning on urination" path="systemsReview.genitourinary"/>Pain or burning on urination <form:checkbox value="Blood in urine" path="systemsReview.genitourinary"/>Blood in urine <form:checkbox value="Cloudy urine" path="systemsReview.genitourinary"/>Cloudy urine <form:checkbox value="Pus in urine" path="systemsReview.genitourinary"/>Pus in urine</li><br>
<li><form:checkbox value="Discharge from penis/vagina" path="systemsReview.genitourinary"/>Discharge from penis/vagina <form:checkbox value="Getting up at night to pass urine" path="systemsReview.genitourinary"/>Getting up at night to pass urine <form:checkbox value="Vaginal dryness" path="systemsReview.genitourinary"/>Vaginal dryness <form:checkbox value="Rash/ulcers" path="systemsReview.genitourinary"/>Rash/ulcers <form:checkbox value="Sexual difficulties" path="systemsReview.genitourinary"/>Sexual difficulties <form:checkbox value="Prostate trouble" path="systemsReview.genitourinary"/>Prostate trouble</li><br><br>
<li>For Women only:</li><br>
<table>

<tr>
<td>Age when periods began: <form:input style="width:120px;" path="systemsReview.agePeriod"/> <td> Periods regular? <form:radiobutton value="Yes" path="systemsReview.regular"/>Yes <form:radiobutton value="No" path="systemsReview.regular"/>No <td>How many days apart? <form:input style="width:120px;" path="systemsReview.daysApart"/>
</tr>
<tr>
<td>Date of last period? <input style="width:120px;" name="lastPeriod" type="text" id="inputField" readonly/> <td>Date of last pap?  <input style="width:120px;" name="lastPap" type="text" id="inputField" readonly/>  <td>Bleeding after menopause? <form:radiobutton value="Yes" path="systemsReview.bleedingAfterMenopause"/>Yes <form:radiobutton value="No" path="systemsReview.bleedingAfterMenopause"/>No </li><br><br>
</tr>
<tr>
<td>Number of pregnancies? <form:input style="width:120px;" path="systemsReview.pregnancies"/> <td>Number of miscarriages? <form:input style="width:120px;" path="systemsReview.miscarriages"/></li><br>
</tr>
</table>

<li><b><u>Muscoloskeletal</b></u></li><br>
<li><form:checkbox value="Morning stiffness" path="systemsReview.musculoskeletal"/>Morning stiffness --- Lasting how long? <form:input style="width:30px;" path="systemsReview.hours"/> hours and <form:input style="width:30px;" path="systemsReview.min"/> minutes &nbsp&nbsp&nbsp&nbsp  <form:checkbox value="Joint pain" path="systemsReview.musculoskeletal"/>Joint pain <form:checkbox value="Muscle weakness" path="systemsReview.musculoskeletal"/>Muscle weakness <form:checkbox value="Muscle tenderness" path="systemsReview.musculoskeletal"/>Muscle tenderness <form:checkbox value="Joint swelling" path="systemsReview.musculoskeletal"/>Joint swelling</li><br><br>
<li>List joints affected in the last 6 months: <form:textarea style="width:550px; height:50px;" path="systemsReview.joints"/></li><br><br>

<li><b><u>Integumentary(skin and/or breast)</b></u></li><br>
<li><form:checkbox value="Easy bruising" path="systemsReview.integumentary"/>Easy bruising <form:checkbox value="Redness" path="systemsReview.integumentary"/>Redness <form:checkbox value="Rash" path="systemsReview.integumentary"/>Rash <form:checkbox value="Hives" path="systemsReview.integumentary"/>Hives <form:checkbox value="Sun sensitive" path="systemsReview.integumentary"/>Sun sensitive <form:checkbox value="Tightness" path="systemsReview.integumentary"/>Tightness <form:checkbox value="Nodules/bumps" path="systemsReview.integumentary"/>Nodules/bumps <form:checkbox value="Hair loss" path="systemsReview.integumentary"/>Hair loss <form:checkbox value="Color changes of hands or feet in the cold" path="systemsReview.integumentary"/>Color changes of hands or feet in the cold</li><br><br>

<li><b><u>Neurological System</b></u></li><br>
<li><form:checkbox value="Headaches" path="systemsReview.neurologicalSystem"/>Headaches <form:checkbox value="Dizziness" path="systemsReview.neurologicalSystem"/>Dizziness <form:checkbox value="Fainting" path="systemsReview.neurologicalSystem"/>Fainting <form:checkbox value="Muscle spasm" path="systemsReview.neurologicalSystem"/>Muscle spasm <form:checkbox value="Loss of consciousness" path="systemsReview.neurologicalSystem"/>Loss of consciousness <form:checkbox value="Sensitivity or pain of hands and/or feet" path="systemsReview.neurologicalSystem"/>Sensitivity or pain of hands and/or feet <form:checkbox value="Memory loss" path="systemsReview.neurologicalSystem"/>Memory loss <form:checkbox value="Night sweats" path="systemsReview.neurologicalSystem"/>Night sweats</li><br><br>

<li><b><u>Psychiatric</b></u></li><br>
<li><form:checkbox value="Excessive worries" path="systemsReview.psychiatric"/>Excessive worries <form:checkbox value="Anxiety" path="systemsReview.psychiatric"/>Anxiety <form:checkbox value="Easily losing temper" path="systemsReview.psychiatric"/>Easily losing temper <form:checkbox value="Depression" path="systemsReview.psychiatric"/>Depression <form:checkbox value="Agitation" path="systemsReview.psychiatric"/>Agitation <form:checkbox value="Difficulty falling asleep" path="systemsReview.psychiatric"/>Difficulty falling asleep <form:checkbox value="Difficulty staying asleep" path="systemsReview.psychiatric"/>Difficulty staying asleep </li><br><br>

<li><b><u>Endocrine</b></u></li><br>
<li><form:checkbox value="Excessive thirst" path="systemsReview.endocrine"/>Excessive thirst</li><br>

<li><b><u>Hematologic/Lymphatic</b></u></li><br>
<li><form:checkbox value="Swollen glands" path="systemsReview.hematologic"/>Swollen glands <form:checkbox value="Tender glands" path="systemsReview.hematologic"/>Tender glands <form:checkbox value="Anemia" path="systemsReview.hematologic"/>Anemia <form:checkbox value="Bleeding tendency" path="systemsReview.hematologic"/>Bleeding tendency <form:checkbox value="Transfusion" path="systemsReview.hematologic"/>Transfusion/when <form:input style="width:120px;" path="systemsReview.when"/></li><br><br>

<li><b><u>Allergic/Immunologic</b></u></li><br>
<li><form:checkbox value="Frequent sneezing" path="systemsReview.allergic"/>Frequent sneezing <form:checkbox value="Increased susceptibility to infection" path="systemsReview.allergic"/>Increased susceptibility to infection</li><br><br>
</ul>
								</div>
						
						
						
						
						
						
						
						
						<br><br><br>
							<br><h1>Social History</h1>	
								<div class="section" style="padding-left:25px">							
								
								<table border="1px" class="navigation" style="margin:0px auto;">
								<tr>
									<td align="center"><b><u>CAFFEINATED BEVERAGES</u></b></td>
									<td align="center"><b><u>SMOKING</u></b></td>
									<td align="center"><b><u>DRINKING</u></b></td>							
								</tr>
								
								<tr>
									<td>
										<p>Do you drink caffeinated beverages?</p>
										<form:radiobutton required="true" path="socialHistory.caffeinatedBeverages" value="Yes"/>Yes
										<form:radiobutton required="true" path="socialHistory.caffeinatedBeverages" value="No"/>No
									</td>
									
									<td>
										<p>Do you smoke?</p>
										<form:radiobutton required="true" path="socialHistory.smoke" value="Yes"/>Yes
										<form:radiobutton required="true" path="socialHistory.smoke" value="No"/>No							
										<form:radiobutton required="true" path="socialHistory.smoke" value="Past"/>Past									
									</td>
									
									<td>
										<p>Do you drink alcohol?</p>
										<form:radiobutton required="true" path="socialHistory.alcohol" value="Yes"/>Yes
										<form:radiobutton required="true" path="socialHistory.alcohol" value="No"/>No									
									</td>
								</tr>
								
								<tr>
									<td>
										<p>IF YES, how many cups/glasses per day?</p>
										<form:input path="socialHistory.glassesPerDay" type="number" min="0" max="20" step="1" value="0" size="0"/>									
									</td>
								
									<td>
										<p>IF PAST, how long ago?</p>
										<form:input path="socialHistory.smokingDuration"/>																										
									</td>
									
									<td>
										<p>Has anyone ever told you to cut down on your drinking?</p>
										<form:radiobutton required="true" path="socialHistory.cutDownDrinking" value="Yes"/>Yes
										<form:radiobutton required="true" path="socialHistory.cutDownDrinking" value="No"/>No	
									</td>
								</tr>

								<tr>
									<td></td>
									<td></td>
									<td>
										<p>IF YES, how many bottles per week?</p>
										<form:input path="socialHistory.numberPerWeek" type="number" min="0" max="90" step="1" value="0" size="0"/>Bottle/s									
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
										<form:radiobutton required="true" path="socialHistory.drugs" value="Yes"/>Yes
										<form:radiobutton required="true" path="socialHistory.drugs" value="No"/>No										
									</td>
									
									<td>
										<p>IF YES, please list:</p>
										<form:textarea path="socialHistory.listOfDrugs" rows="4" cols="50"/>									
									</td>
								</tr>

								<tr>
									<td align="center"><b><u>EXERCISE</u></b></td>
									<td align="center"><b><u>SLEEP</u></b></td>
								</tr>
								
								<tr>
									<td align="center">
									<p>Do you exercise regularly?</p>
									<form:radiobutton required="true" path="socialHistory.exercise" value="Yes"/>Yes
									<form:radiobutton required="true" path="socialHistory.exercise" value="No"/>No<br>
									<label>Type</label><form:input path="socialHistory.exerciseType" style="width:200px"/>	
									<br><label>Amount&nbspper&nbspWeek</label><form:input path="socialHistory.exerciseWeeklyAmount" style="width:200px"/>
									</td>
									
									<td align="center">
										<p>How many hours of sleep do you get at night?</p>
											<form:input path="socialHistory.hoursOfSleep" type="number" min="0" max="50" step="1" value="0" size="0"/>Hour/s<br><br>
										<p>Do you get enough sleep at night?</p>
											<form:radiobutton required="true" path="socialHistory.enoughSleep" value="Yes"/>Yes
											<form:radiobutton required="true" path="socialHistory.enoughSleep" value="No"/>No<br><br>
										<p>Do you wake up feeling rested?</p>
											<form:radiobutton required="true" path="socialHistory.rested" value="Yes"/>Yes
											<form:radiobutton required="true" path="socialHistory.rested" value="No"/>No<br><br>										
									</td>
								</tr>
								</table>
								
								
								
								</div>

						
						
						
			<br><br><br>
							<br><h1>Past Medical History</h1>		
								<div class="section">
								<ul>
<li>Do you now or have you ever had: (check if "yes")</li><br>
<table>
<tr>
<td><form:checkbox path="medicalHistory.pastProblems" value="Cancer"/>Cancer <td><form:checkbox path="medicalHistory.pastProblems" value="Heart Problems"/>Heart problems <td><form:checkbox path="medicalHistory.pastProblems" value="Asthma"/>Asthma <td><form:checkbox path="medicalHistory.pastProblems" value="Goiter"/>Goiter <td><form:checkbox path="medicalHistory.pastProblems" value="Leukemia"/>Leukemia <td><form:checkbox path="medicalHistory.pastProblems" value="Stroke"/>Stroke  </tr>
<tr><td><form:checkbox path="medicalHistory.pastProblems" value="Cataracts"/>Cataracts <td><form:checkbox path="medicalHistory.pastProblems" value="Diabetes"/>Diabetes <td><form:checkbox path="medicalHistory.pastProblems" value="Epilepsy"/>Epilepsy <td><form:checkbox path="medicalHistory.pastProblems" value="Nervous Breakdown"/>Nervous breakdown <td><form:checkbox path="medicalHistory.pastProblems" value="Stomach Ulcers"/>Stomach ulcers <td><form:checkbox path="medicalHistory.pastProblems" value="Rheumatic Fever"/>Rheumatic Fever
</tr>
<tr>
<td><form:checkbox path="medicalHistory.pastProblems" value="Bad Headaches"/>Bad headaches <td><form:checkbox path="medicalHistory.pastProblems" value="Jaundice"/>Jaundice <td><form:checkbox path="medicalHistory.pastProblems" value="Colities"/>Colities <td><form:checkbox path="medicalHistory.pastProblems" value="Kidney Disease"/>Kidney disease <td><form:checkbox path="medicalHistory.pastProblems" value="Pneumonia"/>Pneumonia <td><form:checkbox path="medicalHistory.pastProblems" value="Psoriasis"/>Psoriasis</tr>
<tr><td><form:checkbox path="medicalHistory.pastProblems" value="Anemia"/>Anemia <td><form:checkbox path="medicalHistory.pastProblems" value="HIV/AIDS"/>HIV/AIDS <td><form:checkbox path="medicalHistory.pastProblems" value="High Blood Pressure"/>High blood pressure <td><form:checkbox path="medicalHistory.pastProblems" value="Emphysema"/>Emphysema <td><form:checkbox path="medicalHistory.pastProblems" value="Glaucoma"/>Glaucoma <td><form:checkbox path="medicalHistory.pastProblems" value="Tubercolosis"/>Tubercolosis
</tr>
</table>
<table>
<tr>
<th><th>
</tr>
<tr><td>Other significant illness (please list): <td><form:textarea style="width:700px;height:50px;" path="medicalHistory.others"/></tr>
<tr><td>Natural or Alternative Therapies: <td><form:textarea style="width:700px;height:50px;" path="medicalHistory.therapies"/></tr>
</table>
</ul>
								</div>
								
								
								
								
								
								<br><br><br>
							<br><h1>Previous Operations</h1>		
								<div class="section">
								<table border="1px" class="navigation">
									<tr>
										<th align="center"><b>Type</b></td>
										<th align="center"><b>Year</b></td>
										<th align="center"><b>Reason</b></td>
									</tr>
									
									<tr>
										<td align="center">1.  <form:input path="previousOperations.previousOperations[0].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[0].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[0].reason" style="width:650px"/></td>
									</tr>
	
									<tr>
										<td align="center">2.  <form:input path="previousOperations.previousOperations[1].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[1].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[1].reason" style="width:650px"/></td>
									</tr>

									<tr>
										<td align="center">3.  <form:input path="previousOperations.previousOperations[2].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[2].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[2].reason" style="width:650px"/></td>
									</tr>

									<tr>
										<td align="center">4.  <form:input path="previousOperations.previousOperations[3].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[3].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[3].reason" style="width:650px"/></td>
									</tr>

									<tr>
										<td align="center">5.  <form:input path="previousOperations.previousOperations[4].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[4].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[4].reason" style="width:650px"/></td>
									</tr>

									<tr>
										<td align="center">6.  <form:input path="previousOperations.previousOperations[5].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[5].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[5].reason" style="width:650px"/></td>
									</tr>

									<tr>
										<td align="center">7.  <form:input path="previousOperations.previousOperations[6].type" style="width:200px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[6].year" style="width:50px"/></td>
										<td align="center"><form:input path="previousOperations.previousOperations[6].reason" style="width:650px"/></td>
									</tr>									
								</table>	
								<br><br>
								<table>
									<tr>
										<td>
											<p>Any previous fractures?</p>
											<form:radiobutton required="true" path="previousOperations.fractures" value="Yes"/>Yes
											<form:radiobutton required="true" path="previousOperations.fractures" value="No"/>No										
										</td>
										
										<td>
											<p>Describe:</p>
											<form:textarea path="previousOperations.fracturesDescriptions" rows="4" cols="50"/> 										
										</td>
									</tr>
									
									<tr>
										<td>
											<p>Any other serious injury?</p>
											<form:radiobutton required="true" path="previousOperations.injuries" value="Yes"/>Yes
											<form:radiobutton required="true" path="previousOperations.injuries" value="No"/>No											
										</td>
										
										<td>
											<p>Describe:</p>
											<form:textarea path="previousOperations.injuriesDescriptions" rows="4" cols="50"/>										
										</td>
									</tr>
								
								</table>
								</div>	
								
								
								
								
								
								
<br><br><br>
							<br><h1>Family History</h1>		
								<div class="section">
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
<tr><th style="width:50px;" colspan="6">Father</th></tr>
<tr>
<td>If living - <td><form:input style="width:50px;" path="familyHistory.f_age"/> <td> <form:input style="width:220px;" path="familyHistory.f_health"/> <td>If deceased - <td> <form:input style="width:50px;" path="familyHistory.f_ageDeath"/> <td><form:input style="width:220px;" path="familyHistory.f_cause"/></tr>
<tr><th style="width:50px;" colspan="6">Mother</th></tr>
<tr>
<td>If living - <td><form:input style="width:50px;" path="familyHistory.m_age"/> <td> <form:input style="width:220px;" path="familyHistory.m_health"/> <td>If deceased - <td> <form:input style="width:50px;" path="familyHistory.m_ageDeath"/> <td><form:input style="width:220px;" path="familyHistory.m_cause"/></tr>
</table></li>
<li><br><br>

<table>
<td>Number of siblings: <form:input style="width:120px;" path="familyHistory.siblings"/> <td>Number living: <form:input style="width:120px;" path="familyHistory.s_living"/> <td>Number deceased: <form:input style="width:120px;" path="familyHistory.s_deceased"/></tr>
</tr>
<tr>
<td>Number of children: <form:input style="width:120px;" path="familyHistory.childrenNum"/> <td>Number living: <form:input style="width:120px;" path="familyHistory.c_living"/> <td>Number deceased: <form:input style="width:120px;" path="familyHistory.c_deceased"/> </tr>
<tr><td>List ages of each <form:input style="width:200px;" path="familyHistory.ages"/></tr>
</table>
<li>Health of children: <form:textarea style="width:700px;height:50px;" path="familyHistory.healthOfChildren"/> </li><br>
<li>Do you know of any blood relative who has or had: (check and give relationship)</li><br>
<table>

<tr><td><form:checkbox value="Cancer" path="familyHistory.bloodRelativesDiseases"/>Cancer<form:input style="width:120px;" path="familyHistory.cancer"/> <td><form:checkbox value="Heart disease" path="familyHistory.bloodRelativesDiseases"/>Heart disease<form:input style="width:120px;" path="familyHistory.heartDisease"/> <td><form:checkbox value="Rheumatic fever" path="familyHistory.bloodRelativesDiseases"/>Rheumatic fever<form:input style="width:120px;" path="familyHistory.rheumaticFever"/> <td><form:checkbox value="Tuberculosis" path="familyHistory.bloodRelativesDiseases"/>Tuberculosis<form:input style="width:120px;" path="familyHistory.tubercolosis"/></tr>
<tr><td><form:checkbox value="Leukemia" path="familyHistory.bloodRelativesDiseases"/>Leukemia<form:input style="width:120px;" path="familyHistory.leukemia"/><td><form:checkbox value="High Blood Pressure" path="familyHistory.bloodRelativesDiseases"/>High BP<form:input style="width:120px;" path="familyHistory.highBloodPressure"/><td><form:checkbox value="Epilepsy" path="familyHistory.bloodRelativesDiseases"/>Epilepsy<form:input style="width:120px;" path="familyHistory.epilepsy"/><td><form:checkbox value="Diabetes" path="familyHistory.bloodRelativesDiseases"/>Diabetes<form:input style="width:120px;" path="familyHistory.diabetes"/></tr>
<tr><td><form:checkbox value="Stroke" path="familyHistory.bloodRelativesDiseases"/>Stroke<form:input style="width:120px;" path="familyHistory.stroke"/><td><form:checkbox value="Bleeding" path="familyHistory.bloodRelativesDiseases"/>Bleeding<form:input style="width:120px;" path="familyHistory.bleedingTendency"/><td><form:checkbox value="Asthma" path="familyHistory.bloodRelativesDiseases"/>Asthma<form:input style="width:120px;" path="familyHistory.asthma"/><td><form:checkbox value="Goiter" path="familyHistory.bloodRelativesDiseases"/>Goiter<form:input style="width:120px;" path="familyHistory.goiter"/></tr>
<tr><td><form:checkbox value="Colitis" path="familyHistory.bloodRelativesDiseases"/>Colitis<form:input style="width:120px;" path="familyHistory.colitis"/><td><form:checkbox value="Alcoholism" path="familyHistory.bloodRelativesDiseases"/>Alcoholism<form:input style="width:120px;" path="familyHistory.alcoholism"/><td><form:checkbox value="Psoriasis" path="familyHistory.bloodRelativesDiseases"/>Psoriasis<form:input style="width:120px;" path="familyHistory.psoriasis"/></tr>
</table><br><br>
</ul>
								</div>

								
								
								
								<br><br><br>
							<br><h1>Medications</h1>		
								<div class="section">
								<p>Drug Allergies?</p>
									<form:radiobutton required="true" path="presentMedications.drugAllergies" value="Yes"/>Yes
									<form:radiobutton required="true" path="presentMedications.drugAllergies" value="No"/>No<br><br>
								<p>To what?</p>
								<form:textarea path="presentMedications.drugAllergyDetails" rows="4" cols="50"/><br><br>
								<p>Type of reaction:</p>
								<form:textarea path="presentMedications.reaction" rows="4" cols="50"/><br><br>
								<p align="center"><b>PRESENT MEDICATIONS</b></p>
								<p align="center">(List any medications you are taking. Include such item as aspirin, vitamins, laxatives, calcium, and other supplements, etc.)</p><br><br>	
								<table border="1" class="navigation" style="margin:0px auto;">
									<tr>
										<th align="center"><b>Name of Drug</b></td>
										<th align="center"><b>Dose (include strength & number of pills per day)</b></td>
										<th align="center"><b>How long have you taken this medication</b></td>
										<th align="center" colspan="3"><b>Please choose: Helped?</b></td>
									</tr>
									
									<tr>
										<td align="center">1.<form:input path="presentMedications.presentMedications[0].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[0].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[0].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton required="true" value="A Lot" path="presentMedications.presentMedications[0].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton required="true" value="Some" path="presentMedications.presentMedications[0].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton required="true" value="Not At All" path="presentMedications.presentMedications[0].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">2.<form:input path="presentMedications.presentMedications[1].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[1].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[1].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[1].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[1].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[1].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">3.<form:input path="presentMedications.presentMedications[2].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[2].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[2].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[2].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[2].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[2].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">4.<form:input path="presentMedications.presentMedications[3].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[3].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[3].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[3].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[3].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[3].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">5.<form:input path="presentMedications.presentMedications[4].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[4].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[4].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[4].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[4].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[4].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">6.<form:input path="presentMedications.presentMedications[5].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[5].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[5].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[5].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[5].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[5].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">7.<form:input path="presentMedications.presentMedications[6].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[6].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[6].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[6].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[6].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[6].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">8.<form:input path="presentMedications.presentMedications[7].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[7].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[7].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[7].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[7].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[7].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">9.<form:input path="presentMedications.presentMedications[8].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[8].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[8].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[8].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[8].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[8].isHelpful"/>Not At All</td>
									</tr>

									<tr>
										<td align="center">10.<form:input path="presentMedications.presentMedications[9].name" style="width:200px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[9].dose" style="width:50px"/></td>
										<td align="center"><form:input path="presentMedications.presentMedications[9].duration" style="width:100px"/></td>
										<td align="center"><form:radiobutton value="A Lot" path="presentMedications.presentMedications[9].isHelpful"/>A Lot</td>
										<td align="center"><form:radiobutton value="Some" path="presentMedications.presentMedications[9].isHelpful"/>Some</td>
										<td align="center"><form:radiobutton value="Not At All" path="presentMedications.presentMedications[9].isHelpful"/>Not At All</td>
									</tr>									
									
								</table>	
								</div>	

								
								
								
								<br><br><br>
								
							<br><h1>Past Medications</h1>		
								<div class="section">
<ul>
<li>Please review the list of "arthritis" medications. As accurately as possible, try to remember which medications you have taken, how long you were taking the medication, the results of taking the medication and list any reactions you may have had. Record your comments in the spaces provided.
<br>
<li>Check what you have taken in the past:



<table>
<th style="width:300px;">Drug names/Dosage</th>
<th style="width:150px;">Length of Time</th>
<th style="width:200px;">Helped a Lot</th>
<th style="width:200px;">Helped Some</th>
<th style="width:200px;">Did not help at all</th>
<th style="width:300px;">Reactions</th>

<tr>
<td>Non-steroidal Anti-inflammatory drugs(NSAIDs)</td><form:hidden path="pastMedications.pastMedications[0].drug" value="Non-steroidal Anti-inflammatory drugs(NSAIDs)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[0].length"/></td>
<td style="text-align:center;"><form:radiobutton required="true" path="pastMedications.pastMedications[0].isHelpful" value="A Lot"/></td>
<td style="text-align:center;"><form:radiobutton required="true" path="pastMedications.pastMedications[0].isHelpful" value="Some"/></td>
<td style="text-align:center;"><form:radiobutton required="true" path="pastMedications.pastMedications[0].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[0].reactions"/></td>
</tr>

<tr><td><td><form:checkbox path="pastMedications.NSAIDs" value="Ansaid (flurbiprofen)"/>Ansaid (flurbiprofen) <td><form:checkbox path="pastMedications.NSAIDs" value="Arhthrotec (diclofenac + misoprostil)"/>Arhthrotec (diclofenac + misoprostil) <td><form:checkbox path="pastMedications.NSAIDs" value="Aspirin( including coated aspirin)"/>Aspirin( including coated aspirin) <td><form:checkbox path="pastMedications.NSAIDs" value="Celebrex (celcoxib)"/>Celebrex<br>(celcoxib) <td><form:checkbox path="pastMedications.NSAIDs" value="Clinoril (sulindac)"/>Clinoril (sulindac)</tr>
<tr><td><td><form:checkbox path="pastMedications.NSAIDs" value="Daypro (oxaprozin)"/>Daypro (oxaprozin) <td><form:checkbox path="pastMedications.NSAIDs" value="Discalcid (salsalate)"/>Discalcid (salsalate) <td><form:checkbox path="pastMedications.NSAIDs" value="Dolobid (diflunisal)"/>Dolobid (diflunisal)<td><form:checkbox path="pastMedications.NSAIDs" value="Feldene (piroxicam)"/>Feldene (piroxicam) <td><form:checkbox path="pastMedications.NSAIDs" value="Indocin (incomethacin)"/>Indocin (incomethacin) </tr>
<tr><td><td><form:checkbox path="pastMedications.NSAIDs" value="Lodine (etodolac)"/>Lodine (etodolac) <td><form:checkbox path="pastMedications.NSAIDs" value="Meclomen (meclofenamate)"/>Meclomen<br>(meclofenamate) <td><form:checkbox path="pastMedications.NSAIDs" value="Motrin/Rufen (ibuprofen)"/>Motrin/Rufen<br>(ibuprofen) <td><form:checkbox path="pastMedications.NSAIDs" value="Nalfon (fenoprofen)"/>Nalfon<br>(fenoprofen) <td><form:checkbox path="pastMedications.NSAIDs" value="Naprosym (naproxen)"/>Naprosym (naproxen) </tr>
<tr><td><td><form:checkbox path="pastMedications.NSAIDs" value="Oruvail (ketoprofen)"/>Oruvail (ketoprofen) <td><form:checkbox path="pastMedications.NSAIDs" value="Tolectin (tolmetin)"/>Tolectin (tolmetin) <td><form:checkbox path="pastMedications.NSAIDs" value="Trilisate (choline magnesium trisalicylate)"/>Trilisate (choline magnesium trisalicylate) <td><form:checkbox path="pastMedications.NSAIDs" value="Vioxx (rofecoxib)"/>Vioxx<br>(rofecoxib) <td><form:checkbox path="pastMedications.NSAIDs" value="Voltaren (diclofenac)"/>Voltaren (diclofenac)</tr>


<tr>
<td>Pain Relivers</td>
</tr>

<tr>
<td>Acetaminophen (Tylenol)</td><form:hidden path="pastMedications.pastMedications[1].drug" value="Acetaminophen (Tylenol)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[1].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[1].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[1].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[1].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[1].reactions"/></td>
</tr>



<tr>
<td>Codeine (Vicodin, Tylenol 3)</td><form:hidden path="pastMedications.pastMedications[2].drug" value="Codeine (Vicodin, Tylenol 3)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[2].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[2].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[2].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[2].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[2].reactions"/></td>
</tr>

<tr>
<td>Propoxyphene (Darvon/Darvocet)</td><form:hidden path="pastMedications.pastMedications[3].drug" value="Propoxyphene (Darvon/Darvocet)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[3].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[3].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[3].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[3].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[3].reactions"/></td>
</tr>

<tr>
<td>Other: <form:input path="pastMedications.pastMedications[4].drug" /></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[4].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[4].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[4].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[4].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[4].reactions"/></td>
</tr>
<tr>
<td>Other:  <form:input path="pastMedications.pastMedications[5].drug" /></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[5].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[5].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[5].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[5].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[5].reactions"/></td>
</tr>


<tr>
<td>Disease Modifying Antirheumatic Drugs (DMARDS)</td>
</tr>

<tr>
<td>Auranofin, gold pills (Ridaura)</td><form:hidden path="pastMedications.pastMedications[6].drug" value="Auranofin, gold pills (Ridaura)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[6].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[6].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[6].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[6].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[6].reactions"/></td>
</tr>

<tr>
<td>Gold shots (Myochrysine or Solganol)</td><form:hidden path="pastMedications.pastMedications[7].drug" value="Gold shots (Myochrysine or Solganol)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[7].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[7].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[7].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[7].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[7].reactions"/></td>
</tr>

<tr>
<td>Hydroxychloroquine (Plaquenil)</td><form:hidden path="pastMedications.pastMedications[8].drug" value="Hydroxychloroquine (Plaquenil)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[8].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[8].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[8].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[8].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[8].reactions"/></td>
</tr>

<tr>
<td>Penicillamine (Cuprimine or Depen)</td><form:hidden path="pastMedications.pastMedications[9].drug" value="Penicillamine (Cuprimine or Depen)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[9].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[9].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[9].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[9].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[9].reactions"/></td>
</tr>

<tr>
<td>Methotrexate (Rheumatrex)</td><form:hidden path="pastMedications.pastMedications[10].drug" value="Methotrexate (Rheumatrex)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[10].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[10].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[10].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[10].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[10].reactions"/></td>
</tr>

<tr>
<td>Azathioprine (Imuran)</td><form:hidden path="pastMedications.pastMedications[11].drug" value="Azathioprine (Imuran)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[11].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[11].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[11].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[11].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[11].reactions"/></td>
</tr>

<tr>
<td>Sulfasalazine (Azulfidine)</td><form:hidden path="pastMedications.pastMedications[12].drug" value="Sulfasalazine (Azulfidine)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[12].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[12].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[12].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[12].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[12].reactions"/></td>
</tr>

<tr>
<td>Quinacrine (Atabrine)</td><form:hidden path="pastMedications.pastMedications[13].drug" value="Quinacrine (Atabrine)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[13].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[13].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[13].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[13].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[13].reactions"/></td>
</tr>

<tr>
<td>Cyclophosphamide (Cytoxan)</td><form:hidden path="pastMedications.pastMedications[14].drug" value="Cyclophosphamide (Cytoxan)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[14].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[14].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[14].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[14].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[14].reactions"/></td>
</tr>

<tr>
<td>Cyclosporine A (Sandimmune or Neoral)</td><form:hidden path="pastMedications.pastMedications[15].drug" value="Cyclosporine A (Sandimmune or Neoral)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[15].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[15].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[15].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[15].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[15].reactions"/></td>
</tr>

<tr>
<td>Etanercept (Enbrel)</td><form:hidden path="pastMedications.pastMedications[16].drug" value="Etanercept (Enbrel)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[16].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[16].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[16].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[16].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[16].reactions"/></td>
</tr>

<tr>
<td>Infliximab (Remicade)</td><form:hidden path="pastMedications.pastMedications[17].drug" value="Infliximab (Remicade)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[17].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[17].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[17].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[17].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[17].reactions"/></td>
</tr>

<tr>
<td>Prosorba Column</td><form:hidden path="pastMedications.pastMedications[18].drug" value="Prosorba Column"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[18].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[18].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[18].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[18].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[18].reactions"/></td>
</tr>

<tr>
<td>Other: <form:input path="pastMedications.pastMedications[19].drug" /></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[19].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[19].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[19].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[19].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[19].reactions"/></td>
</tr>

<tr>
<td>Other: <form:input path="pastMedications.pastMedications[20].drug" /></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[20].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[20].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[20].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[20].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[20].reactions"/></td>
</tr>

<tr>
<td>Osteoporosis Medications</td>
</tr>

<tr>
<td>Estrogen (Premarin, etc.)</td><form:hidden path="pastMedications.pastMedications[21].drug" value="Estrogen (Premarin, etc.)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[21].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[21].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[21].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[21].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[21].reactions"/></td>
</tr>

<tr>
<td>Alendronate (Fosamax)</td><form:hidden path="pastMedications.pastMedications[22].drug" value="Alendronate (Fosamax)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[22].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[22].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[22].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[22].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[22].reactions"/></td>
</tr>

<tr>
<td>Etidronate (Didronel)</td><form:hidden path="pastMedications.pastMedications[23].drug" value="Etidronate (Didronel)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[23].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[23].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[23].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[23].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[23].reactions"/></td>
</tr>

<tr>
<td>Raloxifene (Evista)</td><form:hidden path="pastMedications.pastMedications[24].drug" value="Raloxifene (Evista)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[24].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[24].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[24].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[24].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[24].reactions"/></td>
</tr>

<tr>
<td>Flouride</td><form:hidden path="pastMedications.pastMedications[25].drug" value="Flouride"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[25].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[25].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[25].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[25].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[25].reactions"/></td>
</tr>

<tr>
<td>Calcitonin injection or nasal (Miacalcin, Calcimar)</td><form:hidden path="pastMedications.pastMedications[26].drug" value="Calcitonin injection or nasal (Miacalcin, Calcimar)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[26].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[26].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[26].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[26].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[26].reactions"/></td>
</tr>

<tr>
<td>Risedronte (Actonel)</td><form:hidden path="pastMedications.pastMedications[27].drug" value="Risedronte (Actonel)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[27].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[27].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[27].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[27].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[27].reactions"/></td>
</tr>

<tr>
<td>Other: <form:hidden path="pastMedications.pastMedications[28].drug"/></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[28].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[28].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[28].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[28].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[28].reactions"/></td>
</tr>

<tr>
<td>Other: <form:hidden path="pastMedications.pastMedications[29].drug"/></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[29].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[29].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[29].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[29].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[29].reactions"/></td>
</tr>

<tr>
<td>Gout Medications</td>
</tr>

<tr>
<td>Probenecid (Behemid)</td><form:hidden path="pastMedications.pastMedications[30].drug" value="Probenecid (Behemid)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[30].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[30].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[30].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[30].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[30].reactions"/></td>
</tr>

<tr>
<td>Colchicine</td><form:hidden path="pastMedications.pastMedications[31].drug" value="Colchicine"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[31].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[31].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[31].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[31].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[31].reactions"/></td>
</tr>

<tr>
<td>Allopurinol (Zyloprim/Lopurin)</td><form:hidden path="pastMedications.pastMedications[32].drug" value="Allopurinol (Zyloprim/Lopurin)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[32].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[32].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[32].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[32].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[32].reactions"/></td>
</tr>

<tr>
<td>Other: <form:input path="pastMedications.pastMedications[33].drug" /></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[33].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[33].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[33].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[33].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[33].reactions"/></td>
</tr>

<tr>
<td>Other: <form:input path="pastMedications.pastMedications[34].drug" /></td>
<td><form:input style="width:120px" path="pastMedications.pastMedications[34].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[34].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[34].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[34].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[34].reactions"/></td>
</tr>

<tr>
<td>Others</td>
</tr>

<tr>
<td>Tamoxifen (Nolvadex)</td><form:hidden path="pastMedications.pastMedications[35].drug" value="Tamoxifen (Nolvadex)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[35].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[35].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[35].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[35].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[35].reactions"/></td>
</tr>

<tr>
<td>Tiludronate(Skelid)</td><form:hidden path="pastMedications.pastMedications[36].drug" value="Tiludronate(Skelid)"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[36].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[36].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[36].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[36].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[36].reactions"/></td>
</tr>

<tr>
<td>Cortisone/Predisone</td><form:hidden path="pastMedications.pastMedications[37].drug" value="Cortisone/Predisone"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[37].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[37].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[37].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[37].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[37].reactions"/></td>
</tr>

<tr>
<td>Hyalgan/Synvisc injections</td><form:hidden path="pastMedications.pastMedications[38].drug" value="Hyalgan/Synvisc injections"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[38].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[38].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[38].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[38].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[38].reactions"/></td>
</tr>

<tr>
<td>Herbal or Nutritional Supplements</td><form:hidden path="pastMedications.pastMedications[39].drug" value="Herbal or Nutritional Supplements<"/>
<td><form:input style="width:120px" path="pastMedications.pastMedications[39].length"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[39].isHelpful" value="A Lot"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[39].isHelpful" value="Some"/></td>
<td><form:radiobutton path="pastMedications.pastMedications[39].isHelpful" value="Not at All"/></td>
<td><form:input style="width:200px" path="pastMedications.pastMedications[39].reactions"/></td>
</tr>

</table>
</li><br>

<li>Please list supplements:</li><br>
<li><form:textarea style="height:50px;width:700px;" path="pastMedications.supplements"/></li><br>
<li>Have you participated in any clinical trials for new medications? <form:radiobutton required="true" path="pastMedications.clinicalTrials" value="Yes"/>Yes <form:radiobutton path="pastMedications.clinicalTrials" required="true" value="No"/>No </li><br>
<li>If yes, list: <form:textarea path="pastMedications.clinicalTrials_details" style="height:50px;width:700px;"/></li><br>
</ul>
								</div>		

								
								
								
								
								
								
								
								
								
								<br><br><br>
							<br><h1>Activities of Daily Living</h1>		
								<div class="section">
								<p>Do you have stairs to climb?
									<form:radiobutton required="true" path="activities.stairs" value="Yes"/>Yes
									<form:radiobutton required="true" path="activities.stairs" value="No"/>No
								&nbsp;&nbsp;&nbsp;IF YES, how many?<form:input path="activities.stairsCount" type="number" min="0" max="20" step="1" value="0" size="0"/></p>
								<p>How many people in household?<form:input path="activities.houseHoldCount" type="number" min="0" max="20" step="1" value="0" size="-1"/></p>
								<p>Relationship and age of each:</p>
								<form:textarea path="activities.relationshipAge" rows="4" cols="50"/><br><br>
								<p>Who does most of the housework?<form:input path="activities.houseWork" style="width:300px"/></p>							
								<p>Who does most of the shopping?&nbsp&nbsp&nbsp <form:input path="activities.shopping" style="width:300px"/></p>							
								<p>Who does most of the yard work?&nbsp&nbsp<form:input path="activities.yardWork" style="width:300px"/></p><br><br>
								<p align="center">On the scale of 1-5, which best describes your situation;<i>Most of the time, I function...</i></p><br>
								<p align="center">
									<form:radiobutton required="true" path="activities.situation" value="1 - VERY POORLY"/>1 - VERY POORLY
									<form:radiobutton required="true" path="activities.situation" value="2 - POORLY"/>2 - POORLY
									<form:radiobutton required="true" path="activities.situation" value="3 - OK"/>3 - OK
									<form:radiobutton required="true" path="activities.situation" value="4 - WELL"/>4 - WELL
									<form:radiobutton required="true" path="activities.situation" value="5 - VERY WELL"/>5 - VERY WELL
								</p><br><br>
								<table border="1" class="navigation" style="margin:0px auto;">
									<tr>
										<th align="center"><b>Because of health problems, do you have difficulty:</b></td>
										<th align="center"><b>Usually</b></td>
										<th align="center"><b>Sometimes</b></td>
										<th align="center" colspan="3"><b>No</b></td>
									</tr>
								
									<tr>
										<td align="">Using your hands to grasp small objects? (buttons, toothbrush, pencil, etc.</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.hands"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.hands"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.hands"/></td>
									</tr>

									<tr>
										<td align="">Walking?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.walking"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.walking"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.walking"/></td>
									</tr>	

									<tr>
										<td align="">Climbing stairs?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.climbingStairs"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.climbingStairs."/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.climbingStairs"/></td>
									</tr>	

									<tr>
										<td align="">Descending stairs?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.descendingStairs"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.descendingStairs"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.descendingStairs"/></td>
									</tr>	

									<tr>
										<td align="">Sitting down?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.sitting"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.sitting"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.sitting"/></td>
									</tr>	

									<tr>
										<td align="">Getting up from chair?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.gettingUp"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.gettingUp"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.gettingUp"/></td>
									</tr>	

									<tr>
										<td align="">Touching your feet while seated?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.touchingFeet"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.touchingFeet"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.touchingFeet"/></td>
									</tr>	

									<tr>
										<td align="">Reaching behind your back?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.reachingBack"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.reachingBack"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.reachingBack"/></td>
									</tr>	

									<tr>
										<td align="">Reaching behind your head?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.reachingHead"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.reachingHead"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.reachingHead"/></td>
									</tr>	

									<tr>
										<td align="">Dressing yourself?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.dressing"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.dressing"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.dressing"/></td>
									</tr>	

									<tr>
										<td align="">Going to sleep?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.sleep"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.sleep"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.sleep"/></td>
									</tr>	

									<tr>
										<td align="">Staying asleep due to pain?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.stayingAsleep"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.stayingAsleep"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.stayingAsleep"/></td>
									</tr>	

									<tr>
										<td align="">Obtaining restful sleep?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.restfulSleep"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.restfulSleep"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.restfulSleep"/></td>
									</tr>	

									<tr>
										<td align="">Bathing?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.bathing"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.bathing"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.bathing"/></td>
									</tr>	

									<tr>
										<td align="">Eating?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.eating"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.eating"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.eating"/></td>
									</tr>	

									<tr>
										<td align="">Working?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.working"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.working"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.working"/></td>
									</tr>	

									<tr>
										<td align="">Getting along with family members?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.gettingAlong"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.gettingAlong"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.gettingAlong"/></td>
									</tr>	

									<tr>
										<td align="">In your sexual relationship?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.sexual"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.sexual"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.sexual"/></td>
									</tr>	

									<tr>
										<td align="">Engaging in leisure time activities?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.liesureActivities"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.liesureActivities"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.liesureActivities"/></td>
									</tr>

									<tr>
										<td align="">With morning stiffness?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.morningStiffness"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.morningStiffness"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.morningStiffness"/></td>
									</tr>

									<tr>
										<td align="">Do you use a <form:radiobutton required="true" path="activities.walkHelper" value="cane"/>cane, <form:radiobutton path="activities.walkHelper" required="true" value="crutches as walker"/>crutches as walker or a <form:radiobutton required="true" path="activities.walkHelper" value="wheelchair"/>wheelchair?</td>
										<td align="center"><form:radiobutton value="Usually" required="true" path="activities.walkHelper_rate"/></td>
										<td align="center"><form:radiobutton value="Sometimes" required="true" path="activities.walkHelper_rate"/></td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.walkHelper_rate"/></td>
									</tr>									
								</table>
								<br><br>
								<p>What is the hardest thing for you to do?</p>
								<form:textarea rows="4" path="activities.hardestThing" cols="50"/><br><br>
								<table border="1" class="navigation">								
									<tr>
										<td align="">Are you receiving disability?</td>
										<td align="center"><form:radiobutton value="Yes" required="true" path="activities.receiveDisability"/>Yes</td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.receiveDisability"/>No</td>
									</tr>
									
									<tr>
										<td align="">Are you applying for disability?</td>
										<td align="center"><form:radiobutton value="Yes" required="true" path="activities.applyDisability"/>Yes</td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.applyDisability"/>No</td>
									</tr>	

									<tr>
										<td align="">Do you have a medically related lawsuit pending?</td>
										<td align="center"><form:radiobutton value="Yes" required="true" path="activities.medicalLawsuit"/>Yes</td>
										<td align="center"><form:radiobutton required="true" value="No" path="activities.medicalLawsuit"/>No</td>
									</tr>									
								</table>
								</div>
								
								
								<br><br><br>
								<section>
									<ul class="btnForm">
										<span class="btn"><input type="submit" value="Save" class="btnSave"></span>
										<a href="uh_table.it?id=${patient.id }"><span class="btn"><input type="button" value="Cancel" class="btnCancel" onClick=""></span></a>
										<font style="padding-left:700px"></font>
										<span class="btn"><input type="button" value="Back to Top" class="btnTop"></span>
									</ul>
								</section>								
						</div></form:form>
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

	<script type="text/javascript" src="resources/js/jquery.1.4.2.js"></script>
	<script type="text/javascript" src="resources/js/jsDatePick.jquery.min.1.3.js"></script>

</body>
</html>