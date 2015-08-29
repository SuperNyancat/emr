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
	<style>
		table, td {
			border: 1px solid gray;
			border-collapse: collapse;
		}
		td {
			padding: 5px;
			text-align: left;
		}
	</style>
	

</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="View History Update" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="View History Update" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>


<div class="pageCtrl">
<ul class="ctrlBtn">
	
	<li><span class="btn">
		<form:form commandName="form" action="uh_edit.it" method="GET">
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
			<form:form commandName="form" action="uh_delete.it" method="GET">
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
			<jsp:param name="selected" value="history" />
			</jsp:include>
	
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
			
					<div class="right">
						<form>
								<div style="background:goldenrod;">
									<br><p class="titles" style="color:white">Patient History Update</p><br>		
								</div>
								<br>
								
								<label class="bigfont">What has happened since you were last here?</label><br><br>
								
							
								<label class="bigfont"><h4>Since your last visit, have you?</h4></label><br>
									<table class="tableContenttrans1">	
										<tr>
											<th class="phn"><center><b>Question</b></center></th>
											<th class="phn"><center><b>Answer</b></center></th> 
											<th class="phn"><center><b>Details</b></center></th>
										</tr>
										
										<tr>
											<td class="phn">Had any illnesses?</td>
											<td class="phn"><center>${form.illness}</center></center></td> 
											<td class="phn"><center>${form.illness_specify}</center></td>
											</tr>
		
										<tr>
											<td class="ind">Seen any healthcare providers?</td>
											<td class="phn"><center>${form.healthCare}</center></td> 
											<td class="phn"><center>${form.healthCare_specify}</center></td>
											</tr>

										<tr>
											<td class="pro">Had an x-ray, lab or other procedures?</td>
											<td class="phn"><center>${form.xrayLab}</center></td> 
											<td class="phn"><center>${form.xrayLab_specify}</center></td>
										</tr>
										
										<tr>
											<td class="pro">Had any change in your family medical history?</td>
											<td class="phn"><center>${form.familyHistoChange}</center></td> 
											<td class="phn"><center>${form.familyHistoChange_specify}</center></td>
										</tr>
										
										<tr>
											<td class="pro">Had any change in your social history?</td>
											<td class="phn"><center>${form.socialHistoChange}</center></td> 
											<td class="phn"><center>${form.socialHistoChange_specify}</center></td>
										</tr>
										
										<tr>
											<td class="pro">Had any new allergies or reactions to medications?</td>
											<td class="phn"><center>${form.newAllergies}</center></td> 
											<td class="phn"><center>${form.newAllergies_specify}</center></td>
										</tr>
										
										<tr>
											<td class="pro">Started, changed or stopped any new medications?</td>
											<td class="phn"><center>${form.medsChange}</center></td> 
											<td class="phn"><center>${form.medsChange_specify}</center></td>
										</tr>
									</table>	
									<br><br><br>
									
									<div class="tableHeadertrans1 clrfix">
									<table border="1" class="navigation">
										<tr>
											<td class="pro">New diseases or illnesses developed by relatives (parents, children, aunts, uncles, brothers, sisters)</a></td>
										</tr>
									</table>
									</div>
									<br>
									<div>
										<span rows="4" cols="50" style="width:694px; height:60px;">${form.relativesDiseases}</span>
									</div>
									<br><br><br>
									
									<div class="tableHeadertrans1 clrfix">
									<table border="1" class="navigation">
										<tr>
											<td class="pro">Changes in your social situation: Work, relationships, residence, smoking, alcohol consumption</a></td>
										</tr>
									</table>
									</div>
									<br>
									<div>
										<span rows="4" cols="50" style="width:694px; height:60px;">${form.socialChanges}</span>
									</div>
									<br><br><br>
									
									<div class="tableHeadertrans1 clrfix">
									<table border="1" class="navigation">
										<tr>
											<td class="pro">New allergies or reactions to medications</a></td>
										</tr>
									</table>
									</div>
									<br>
									<div>
										<span rows="4" cols="50" style="width:694px; height:60px;">${form.allergiesOrReactions}</span>
									</div>
									<br><br><br><br>
								
								<label class="bigfont"><h4>Please list medicine that are new, changed or stopped since your last visit</h4></label><br>
								<table>
									<tr>
										<td class="pro"><b>Name of Medication</b></td>
										<td class="ind"><b>New, Change Or Stop (For dose change, indicate current dosage)</b></a></td>
										<td class="pro"><b>Name of Prescribing Doctor (If you made the change, put Self)</b></a></td>
										<td class="ind"><b>Why was the medication changed or stopped? No longer needed? No longer effective or not effective? Side effects? (Please Specify)</b></a></td>
									</tr>
									<c:forEach items="${form.medsUpdates }" var="f">
										<tr>
											<td class="pro">${f.name }</td>
											<td class="ind">${f.status }</td>
											<td class="pro">${f.prescriber }</td>
											<td class="ind">${f.reason }</td>
										</tr>
									</c:forEach>
								
								</table>
								<br><br><br><br>
								
								<label class="bigfont"><h4>How Do You Feel Today as Compared to Your Last Visit Here?</h4></label><br>
								<b><span style="color:goldenrod;"><b><u>Scale:</u><br>0=Problem not present today 1=Much better 2=Better 3=Same 4=Worse 5=Much Worse N=New Problem</b></span>
								</b>
								<br><br>
								
								<table class="tableContenttrans1">

									<tr>
										<td class="phn"><center><b>Question</b></center></td>
										<td class="phn"><center><b>Rating</b></center></td> 										
									</tr>
									
									<tr>
										<td class="ind">Pain</td>
										<td class="phn"><center>${form.pain}</center></td>
										
									</tr>
	
									<tr>
										<td class="ind">Swelling</td>
										<td class="phn"><center>${form.swelling}</center></td>
										
									</tr>

									<tr>
										<td class="pro">Fatique</td>
										<td class="phn"><center>${form.fatigue}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Ringing in Ears</td>
										<td class="phn"><center>${form.ringingInEars}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Stomach Upset</td>
										<td class="phn"><center>${form.stomachUpset}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Skin Rash</td>
										<td class="phn"><center>${form.skinRash}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Bruising</td>
										<td class="phn"><center>${form.bruising}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Difficulty Sleeping</td>
										<td class="phn"><center>${form.difficultySleeping}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Cough</td>
										<td class="phn"><center>${form.cough}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Eyes Red</td>
										<td class="phn"><center>${form.eyesRed}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Chest Pain</td>
										<td class="phn"><center>${form.chestPain}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Fever</td>
										<td class="phn"><center>${form.fever}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Oral Ulcers</td>
										<td class="phn"><center>${form.oralUlcers}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Diarrhea</td>
										<td class="phn"><center>${form.diarrhea}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Skin Ulcers</td>
										<td class="phn"><center>${form.skinUlcers}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Swollen Glands</td>
										<td class="phn"><center>${form.swollenGlands}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Headache</td>
										<td class="phn"><center>${form.headache}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Shortness of Breath</td>
										<td class="phn"><center>${form.shortnessOfBreath}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Eyes Dry</td>
										<td class="phn"><center>${form.eyesDry}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Heart Palpitations</td>
										<td class="phn"><center>${form.heartPalpitations}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Weight Loss</td>
										<td class="phn"><center>${form.weightLoss}</center></td>
										
									</tr>
									
									<tr>
										<td class="pro">Overall Assessment</td>
										<td class="phn"><center>${form.overallAssessment}</center></td>
										
									</tr>
								</table>	
								<br><br><br><br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">How Long is your morning stiffness (minutes)?</a></td>
									</tr>
								</table>
								</div>
								<br>
								<div>
									<span rows="4" cols="50" style="width:694px; height:60px;">${form.morningStiffness}</span>
								</div>
								<br><br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">What is your worst joint?</a></td>
									</tr>
								</table>
								</div>
								<br>
								<div>
									<span rows="4" cols="50" style="width:694px; height:60px;">${form.worstJoint}</span>
								</div>
								<br><br>
								
																
								<ul class="ctrlBtn listSpace">
									<li><span class="btn"><input type="button" value="Print" class="btnEdit" style="right-align"></span></li>
								</ul>
						</form>		
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