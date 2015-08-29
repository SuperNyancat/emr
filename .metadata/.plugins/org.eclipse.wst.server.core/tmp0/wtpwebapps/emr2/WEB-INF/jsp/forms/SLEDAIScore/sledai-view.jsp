<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View SLEDAI Form</title>
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
		<form:form commandName="form" action="SLEDAI_score_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_sledai.it" method="GET">
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
			<form:form commandName="form" action="delete_sledai.it" method="GET">
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
				<p class="titles">Systemic Lupus Erythematosus Disease Activity Index (SLEDAI) SELENA Modification</p><br><br>
				</div>
				
			<ul>
			
			<p>Physicians Global Assessment (0-3):       <strong>${form.getPGA() }</strong></p>
				
			<br><br><br><br>

					<table class="tablecontent">
					<tr>
							<th class="phn2">Wt</a></td>
							<th class="ind2">Present</a></td>
							<th class="web2">Descriptor</a></td>
							<th class="ind">Definition</a></td>
					</tr>

						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getSeizure() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Seizure</span></td>
							<td class="phn2" text-align="left"><span>Recent onset. Exclude metabolic, infectious or drug cause.</span></td>							
						</tr>		

						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getPsychosis() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Psychosis</span></td>
							<td class="phn2" align="center"><span>Altered ability to function in normal activity due to severe disturbance in the perception of reality. Include hallucinations, incoherence, marked loose associations, impoverished thought content, marked illogical thinking, bizarre, disorganized, or catatonic behavior. Excluded uremia and drug causes.</span></td>							
						</tr>		

						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getOrganicBrainSyndrome() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Organic Brain Syndrome</span></td>
							<td class="phn2" align="center"><span>Altered mental function with impaired orientation, memory or other intelligent function, with rapid onset fluctuating clinical features. Include clouding of consciousness with reduced capacity to focus, and inability to sustain attention to environment, plus at least two of the following: perceptual disturbance, incoherent speech, insomnia or daytime drowsiness, or increased or decreased psychomotor activity. Exclude metabolic, infectious or drug causes.</span></td>							
						</tr>		

						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getVirtualDisturbance() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Visual Disturbance</span></td>
							<td class="phn2"><span>Retinal changes of SLE. Include cytoid bodies, retinal hemorrhages, serious exodate or hemorrhages in the choroids, or optic neuritis. Exclude hypertension, infection, or drug causes.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getCranialNerveDisorder() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Cranial Nerve Disorder</span></td>
							<td class="phn2"><span>New onset of sensory or motor neuropathy involving cranial nerves.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getLupusHeadache() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Lupus Headache</span></td>
							<td class="phn2"><span>Severe persistent headache: may be migrainous, but must be nonresponsive to narcotic analgesia.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getCVA() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>CVA</span></td>
							<td class="phn2"><span>New onset of cerebrovascular accident(s). Exclude arteriosclerosis.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>8</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getVasculitis() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Vasculitis</span></td>
							<td class="phn2"><span>Ulceration, gangrene, tender finger nodules, periungual, infarction, splinter hemorrhages, or biopsy or angiogram proof of vasculitis.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>4</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getArthritis() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Arthritis</span></td>
							<td class="phn2"><span>More than 2 joints with pain and signs of inflammation (i.e. tenderness, swelling, or effusion).</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>4</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getMyositis() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Myositis</span></td>
							<td class="phn2"><span>Proximal muscle aching/weakness, associated with elevated creatine phosphokinase/adolase or electromyogram changes or a biopsy showing myositis.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>4</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getUrinaryCasts() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Urinary Casts</span></td>
							<td class="phn2"><span>Heme-granular or red blood cell casts.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>4</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getHematuria() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Hematuria</span></td>
							<td class="phn2"><span>>5 red blood cells/high power field. Exclude stone, infection or other cause.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>4</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getProteinuria() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Proteinuria</span></td>
							<td class="phn2"><span>>0.5 gm/24 hours. New onset or recent increase of more than 0.5 gm/24 hours.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>4</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getPyuria() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Pyuria</span></td>
							<td class="phn2"><span>>5 white blood cells/high power field. Exclude infection.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getNewRash() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>New Rash</span></td>
							<td class="phn2"><span>New onset or recurrence of inflammatory type rash.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getAlopecia() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>Alopecia</span></td>
							<td class="phn2"><span>New onset or recurrence of abnormal, patchy or diffuse loss of hair.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getMucosalUlcers() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>Mucosal Ulcers</span></td>
							<td class="phn2"><span>New onset or recurrence of oral or nasal ulcerations.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getPleurisy() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>Pleurisy</span></td>
							<td class="phn2"><span>Pleuritic chest pain with pleural rub or effusion, or pleural thickening.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getPericarditis() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>Pericarditis</span></td>
							<td class="phn2"><span>Pericardial pain with at least 1 of the following: rub, effusion, or electrocardiogram confirmation.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getLowComplement() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>Low Complement</span></td>
							<td class="phn2"><span>Decrease in CH50, C3, or C4 below the lower limit of normal for testing laboratory.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>2</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getIncreasedDNABinding() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>	
							<td class="phn" align="center"><span>Increased DNA binding</span></td>
							<td class="phn2"><span>25% binding by Farr assay or above normal range for testing laboratory.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>1</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getFever() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Fever</span></td>
							<td class="phn2" align="center"><span>>38°C. Exclude infectious cause.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>1</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getThrombocytopenia() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Thrombocytopenia</span></td>
							<td class="phn2"><span><100,000 platelets/mm3.</span></td>							
						</tr>		
						<tr>					
							<td class="phn" align="center"><span>1</span></td>
							<td class="phn"><c:choose> <c:when test="${form.getLeukopenia() >= 1 }"><img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when> <c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise> </c:choose></td>		
							<td class="phn" align="center"><span>Leukopenia</span></td>
							<td class="phn2"><span><3,000 White blood cell/mm3. Exclude drug causes.</span></td>							
						</tr>	
						
						<tr>
							<td class="phn" align="center"><span>${form.getScore() }</span></td>
							<td class="phn" colspan="3"><span>TOTAL SCORE (Sum of weights next to descriptors marked present)</span></td>
						</tr>							
					</table><br>
					
					

			
			
			</ul>
			</div>
			
					</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li> |
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li> |
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