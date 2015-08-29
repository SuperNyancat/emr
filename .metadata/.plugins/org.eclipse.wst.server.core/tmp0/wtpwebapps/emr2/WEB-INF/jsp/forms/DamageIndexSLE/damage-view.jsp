<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Damage Index for SLE</title>
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
		<form:form commandName="form" action="damage_index_SLE_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_damage.it" method="GET">
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
			<form:form commandName="form" action="delete_damage.it" method="GET">
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
				<p class="titles">Damage Index for Systemic Lupus Erythematosus (SLE)</p><br><br>
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
				<td class="phn"> ${form.getOcular1()}</td>

			</tr>

			<tr>
				<td class="pro">Retinal change or optic atrophy</td>
				<td class="phn"> ${form.getOcular2()}</td>

			</tr>	

			<tr>
				<td class="pro1"><br><h4>Neuropsychiatric</h4></td>

			</tr>

			<tr>
				<td class="pro">Cognitive impairment (e.g. memory deficit difficulty with calculabon, poor concentration, difficulty in spoken or written language, impaired performance levels) or major psychosis</td>
				<td class="phn"> ${form.getNeuropsychiatric1()}</td>

			</tr>

			<tr>
				<td class="pro">Seizure requiring therapy for 6 months</td>
				<td class="phn"> ${form.getNeuropsychiatric2()}</td>

			</tr>

			<tr>
				<td class="pro">Cerebrovascular accident ever (score > 1)</td>
				<td class="phn"> ${form.getNeuropsychiatric3()}</td>

			</tr>

			<tr>
				<td class="pro">Cramal or peripheral neuropathy (excluding optic)</td>
				<td class="phn"> ${form.getNeuropsychiatric4()}</td>

			</tr>

			<tr>
				<td class="pro">Transverse mychtis</td>
				<td class="phn"> ${form.getNeuropsychiatric5()}</td>

			</tr>
			
			<tr>
				<td class="pro1"><br><h4>Renal</h4></td>

			</tr>

			<tr>
				<td class="pro">Estimated or measured glomerular filtiration rates 50%</td>
				<td class="phn"> ${form.getRenal1()}</td>

			</tr>

			<tr>
				<td class="pro">Proteinaria >3.5 gm/24hours</td>
				<td class="phn"> ${form.getRenal2()}</td>

			</tr>

			<tr>
				<td class="pro">End-stage renal disease (regardless of dialysis or transplantation)</td>
				<td class="phn"> ${form.getRenal3()}</td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Pulmonary</h4></td>

			</tr>

			<tr>
				<td class="pro">Pulmonary hypertension(riht ventricular prominence or loud p2)</td>
				<td class="phn"> ${form.getPulmonary1()}</td>

			</tr>

			<tr>
				<td class="pro">Pulmonary fibrosis (physical and rachograph)</td>
				<td class="phn"> ${form.getPulmonary2()}</td>

			</tr>

			<tr>
				<td class="pro">Shrinking lung (radiograph)</td>
				<td class="phn"> ${form.getPulmonary3()}</td>

			</tr>

			<tr>
				<td class="pro">Pleural fibrosis (radiograph)</td>
				<td class="phn"> ${form.getPulmonary4()}</td>

			</tr>

			<tr>
				<td class="pro">Pulmonary infarction (radiograph)</td>
				<td class="phn"> ${form.getPulmonary5()}</td>

			</tr>

			<tr>
				<td class="pro1"><h4><br>Cardiovascular</h4></td>

			</tr>

			<tr>
				<td class="pro">Angina or coronary artery bypass</td>
				<td class="phn"> ${form.getCardiovascular1()}</td>

			</tr>

			<tr>
				<td class="pro">Myocardial infarction ever (score 2 if > 1)</td>
				<td class="phn"> ${form.getCardiovascular2()}</td>

			</tr>

			<tr>
				<td class="pro">Cardiomyopathy (ventricular dysfunction)</td>
				<td class="phn"> ${form.getCardiovascular3()}</td>

			</tr>

			<tr>
				<td class="pro">Valvular disease (diasolic murmur or systolic murmur)</td>
				<td class="phn"> ${form.getCardiovascular4()}</td>

			</tr>

			<tr>
				<td class="pro">Pericarditis for 6 months or percardectomy</td>
				<td class="phn"> ${form.getCardiovascular5()}</td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Peripheral vascular</h4></td>
				

			</tr>

			<tr>
				<td class="pro">Claudcation for 6 months</td>
				<td class="phn"> ${form.getPeripheralVascular1()}</td>

			</tr>

			<tr>
				<td class="pro">Minor tissue loss (pulp space)</td>
				<td class="phn"> ${form.getPeripheralVascular2()}</td>

			</tr>

			<tr>
				<td class="pro">Significant tissue loss ever (e.g. loss of digit or limb score)</td>
				<td class="phn"> ${form.getPeripheralVascular3()}</td>

			</tr>

			<tr>
				<td class="pro">Venous thrombosis with swelling, ulceration or venous statis</td>
				<td class="phn"> ${form.getPeripheralVascular4()}</td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Gastrointestinal</h4></td>

			</tr>

			<tr>
				<td class="pro">Infarction or resection of bowel below duodemum spleen, liver or gall bladder ever for cause</td>
				<td class="phn"> ${form.getGastrointestinal1()}</td>

			</tr>

			<tr>
				<td class="pro">Mesentric insufficieny</td>
				<td class="phn"> ${form.getGastrointestinal2()}</td>

			</tr>

			<tr>
				<td class="pro">Chronic peritomitis</td>
				<td class="phn"> ${form.getGastrointestinal3()}</td>

			</tr>

			<tr>
				<td class="pro">Stricture or upper gastrointestinal tract surgery ever/a></td>
				<td class="phn"> ${form.getGastrointestinal4()}</td>

			</tr>

			<tr>
				<td class="pro1"><br><h4>Musculosskeletal</h4></td>
				

			</tr>

			<tr>
				<td class="pro">Muscle atrophy or weakness</td>
				<td class="phn"> ${form.getMusculoskeletal1()}</td>

			</tr>

			<tr>
				<td class="pro">Deforming or crosive arthritis (including reducible deformies excluding avascular necrosis)</td>
				<td class="phn"> ${form.getMusculoskeletal2()}</td>

			</tr>

			<tr>
				<td class="pro">Osteoporosis with fracture or venebral collapse (excluding avascular necrosis)</td>
				<td class="phn"> ${form.getMusculoskeletal3()}</td>

			</tr>

			<tr>
				<td class="pro">Avascular necrosis</td>
				<td class="phn"> ${form.getMusculoskeletal4()}</td>

			</tr>

			<tr>
				<td class="pro">Osteonryclitis</td>
				<td class="phn"> ${form.getMusculoskeletal5()}</td>

			</tr>

			<tr>
				<td class="pro"><br><h4>Skin</h4></td>

			</tr>

			<tr>
				<td class="pro">Scarring chronic alopecia</td>
				<td class="phn"> ${form.getSkin1()}</td>

			</tr>

			<tr>
				<td class="pro">Extensive scarring or panniculum other than scalp and pulp space</td>
				<td class="phn"> ${form.getSkin2()}</td>

			</tr>

			<tr>
				<td class="pro">Skin ulceration (excluding thrombosis) for 6 months</td>
				<td class="phn"> ${form.getSkin3()}</td>

			</tr>
			
			<tr>
				<td class="pro"><br><h4>Others</h4></td>

			</tr>

			<tr>
				<td class="pro">Premature gonadal failure</td>
				<td class="phn"> ${form.getPremature()}</td>

			</tr>

			<tr>
				<td class="pro">Diabetes (regadless of treatment)</td>
				<td class="phn"> ${form.getDiabetes()}</td>

			</tr>

			<tr>
				<td class="pro">Malignancy (exclude dysplasia)(score 2 if > 1 site)</td>
				<td class="phn"> ${form.getMalignancy()}</td>

			</tr>
			<tr>
				<td class="pro">Score</td>
				<td class="phn"> ${form.getScore()}</td>

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