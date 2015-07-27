<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Edit Damage Index for SLE</title>
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
			<form:form action="update_damage.it?pid=${patient.getId() }&fid=${form.id }" method="post" commandName="form">
				<form:hidden path="id" value="${form.getId() }"/>
				<form:hidden path="patient.id" value="${patient.getId()}"/>
				<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
				<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
				<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
				
				<div>
				<p class="titles">Damage Index for Systemic Lupus Erythematosus</p><br><br>
				</div>
				
			<ul>

<li>

		<table class="tablecontent2">

						<tr>
							
							<th class="pro">Item</th>
							<th class="phn">Score</th>
							
						</tr>	
			<tr>
				
				<td class="pro1"><br><h4>Ocular (either eye by clinical assessment)</h4></td>		
			</tr>
	
			<tr>
				<td class="pro">Any cataract ever</td>
				<td class="phn"><form:checkbox path="ocular1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Retinal change or optic atrophy</td>
				<td class="phn"><form:checkbox path="ocular2" value="1" /></td>

			</tr>	

			<tr>
				<td class="pro1"><br><h4>Neuropsychiatric</h4></td>

			</tr>

			<tr>
				<td class="pro">Cognitive impairment (e.g. memory deficit difficulty with calculabon, poor concentration, difficulty in spoken or written language, impaired performance levels) or major psychosis</td>
				<td class="phn"><form:checkbox path="neuropsychiatric1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Seizure requiring theraphy for 6 months</td>
				<td class="phn"><form:checkbox path="neuropsychiatric2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Cerebrovascular accident ever (score > 1)</td>
				<td class="phn"><form:radiobutton path="neuropsychiatric3" required="true" value="0"/>0 <form:radiobutton path="neuropsychiatric3" required="true" value="1" />1 <form:radiobutton path="neuropsychiatric3" required="true" value="2"/>2</td>

			</tr>

			<tr>
				<td class="pro">Cramal or peripheral neuropathy (excluding optic)</td>
				<td class="phn"><form:checkbox path="neuropsychiatric4" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Transverse mychtis</td>
				<td class="phn"><form:checkbox path="neuropsychiatric5" value="1" /></td>

			</tr>
			
			<tr>
				<td class="pro1"><br><h4>Renal</h4></td>

			</tr>

			<tr>
				<td class="pro">Estimated or measured glomerular filtiration rates 50%</td>
				<td class="phn"><form:checkbox path="renal1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Proteinaria >3.5 gm/24hours</td>
				<td class="phn"><form:checkbox path="renal2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">End-stage renal disease (regardless of dialysis or transplantation)</td>
				<td class="phn"><form:checkbox path="renal3" value="1" /></td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Pulmonary</h4></td>

			</tr>

			<tr>
				<td class="pro">Pulmonary hypertension(riht ventricular prominence or loud p2)</td>
				<td class="phn"><form:checkbox path="pulmonary1" value="1" /></td>
			</tr>

			<tr>
				<td class="pro">Pulmonary fibrosis (physical and rachograph)</td>
				<td class="phn"><form:checkbox path="pulmonary2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Shrinking lung (radiograph)</td>
				<td class="phn"><form:checkbox path="pulmonary3" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Pleural fibrosis (radiograph)</td>
				<td class="phn"><form:checkbox path="pulmonary4" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Pulmonary infarction (radiograph)</td>
				<td class="phn"><form:checkbox path="pulmonary5" value="1" /></td>

			</tr>

			<tr>
				<td class="pro1"><h4><br>Cardiovascular</h4></td>

			</tr>

			<tr>
				<td class="pro">Angina or coronary artery bypass</td>
				<td class="phn"><form:checkbox path="cardiovascular1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Myocardial infarction ever (score 2 if > 1)</td>
				<td class="phn"><form:radiobutton path="cardiovascular2" required="true" value="0"/>0 <form:radiobutton required="true" path="cardiovascular2" value="1" />1 <form:radiobutton path="cardiovascular2" required="true" value="2"/>2</td>
			</tr>

			<tr>
				<td class="pro">Cardiomyopathy (ventricular dysfunction)</td>
				<td class="phn"><form:checkbox path="cardiovascular3" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Valvular disease (diasolic murmur or systolic murmur)</td>
				<td class="phn"><form:checkbox path="cardiovascular4" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Pericarditis for 6 months or percardectomy</td>
				<td class="phn"><form:checkbox path="cardiovascular5" value="1" /></td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Peripheral vascular</h4></td>
				

			</tr>

			<tr>
				<td class="pro">Claudcation for 6 months</td>
				<td class="phn"><form:checkbox path="peripheralVascular1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Minor tissue loss (pulp space)</td>
				<td class="phn"><form:checkbox path="peripheralVascular2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Significant tissue loss ever (e.g. loss of digit or limb score)</td>
				<td class="phn"><form:radiobutton path="peripheralVascular3" required="true" value="0"/>0 <form:radiobutton path="peripheralVascular3" required="true" value="1" />1 <form:radiobutton path="peripheralVascular3" required="true" value="2"/>2</td>

			</tr>

			<tr>
				<td class="pro">Venous thrombosis with swelling, ulceration or venous statis</td>
				<td class="phn"><form:checkbox path="peripheralVascular4" value="1" /></td>
			</tr>

			<tr>
				<td class="pro1"><br><h4>Gastrointestinal</h4></td>

			</tr>

			<tr>
				<td class="pro">Infarction or resection of bowel below duodemum spleen, liver or gall bladder ever for cause</td>
				<td class="phn"><form:radiobutton path="gastrointestinal1" required="true" value="0"/>0 <form:radiobutton path="gastrointestinal1" required="true" value="1" />1 <form:radiobutton path="gastrointestinal1" required="true" value="2"/>2</td>

			</tr>

			<tr>
				<td class="pro">Mesentric insufficieny</td>
				<td class="phn"><form:checkbox path="gastrointestinal2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Chronic peritomitis</td>
				<td class="phn"><form:checkbox path="gastrointestinal3" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Stricture or upper gastrointestinal tract surgery ever/a></td>
				<td class="phn"><form:checkbox path="gastrointestinal4" value="1" /></td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Musculosskeletal</h4></td>
				

			</tr>

			<tr>
				<td class="pro">Muscle atrophy or weakness</td>
				<td class="phn"><form:checkbox path="musculoskeletal1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Deforming or crosive arthritis (including reducible deformies excluding avascular necrosis)</td>
				<td class="phn"><form:checkbox path="musculoskeletal2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Osteoporosis with fracture or venebral collapse (excluding avascular necrosis)</td>
				<td class="phn"><form:checkbox path="musculoskeletal3" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Avascular necrosis (score 2 if > 1)</td>
				<td class="phn"><form:radiobutton path="musculoskeletal4" required="true" value="0"/>0 <form:radiobutton path="musculoskeletal4" required="true" value="1" />1 <form:radiobutton path="musculoskeletal4" required="true" value="2"/>2</td>

			</tr>

			<tr>
				<td class="pro">Osteonryclitis</td>
				<td class="phn"><form:checkbox path="musculoskeletal5" value="1" /></td>
			</tr>

			<tr>
				<td class="pro"><br><h4>Skin</h4></td>

			</tr>

			<tr>
				<td class="pro">Scarring chronic alopecia</td>
				<td class="phn"><form:checkbox path="skin1" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Extensive scarring or panniculum other than scalp and pulp space</td>
				<td class="phn"><form:checkbox path="skin2" value="1" /></td>

			</tr>

			<tr>
				<td class="pro">Skin ulceration (excluding thrombosis) for 6 months</td>
				<td class="phn"><form:checkbox path="skin3" value="1" /></td>

			</tr>
			
			<tr>
				<td class="pro"><br><h4>Others</h4></td>

			</tr>

			<tr>
				<td class="pro">Premature gonadal failure</td>
				<td class="phn"><form:checkbox path="premature" value="1" /></td>
			</tr>

			<tr>
				<td class="pro">Diabetes (regadless of treatment)</td>
				<td class="phn"><form:checkbox path="diabetes" value="1" /></td>
			</tr>

			<tr>
				<td class="pro">Malignancy (exclude dysplasia)(score 2 if > 1 site)</td>
				<td class="phn"><form:radiobutton path="malignancy" required="true" value="0" />0 <form:radiobutton path="malignancy" required="true" value="1" />1 <form:radiobutton path="malignancy" required="true" value="2" />2</td>

			</tr>

		</table>

	
</li>

</ul><br><br><br><br>
			
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="view_damage_index.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
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