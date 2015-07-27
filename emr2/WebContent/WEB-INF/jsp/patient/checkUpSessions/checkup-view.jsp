<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Check-up Session</title>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">
	<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="form" action="edit_checkup.it" method="GET">
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
			<form:form commandName="form" action="delete_checkup.it" method="GET">
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
				<jsp:param name="selected" value="medications" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
					
					<div class="right">				
						<p class="titles">Check-up Record</p><br><br>
							<h4>Personal Details</h4>		
								<ul class="fields">
								<li><label>Height</label>: <span> ${form.getHeightFeet() }' ${form.getHeightInches() } ''</span> </li>  
								<li><label>Weight</label>:  <span>${form.getWeight() } lbs</span> </li>  
								<li><label>BMI</label>:   <span>${form.getBMI() }</span> </li>  					
								<li><label>BSA</label>:  <span>${form.getBSA()} m^2</span> </li> 
								<li><label>BP</label>:  <span>${form.getBP()}</span> </li> 
								
							<br></br><br></br>
							<h4>Symptoms</h4>					
								<li><p>${form.getSymptoms() } </p></li>
							
							<br></br><br></br>
							<h4>Review of Systems</h4>				
								<li><p>${form.getReviewOfSystems() } </p></li>						

							<br></br><br></br>
							<h4>Assessment/Working Impression: S.O.A.P. Notes</h4>
								<table>
									<tr>
										<td align="center">S<br>(Subjective)</td>
										<td align="justify"><p>${form.getSubjective() } </p></td>					
									</tr>
									
									<tr>
										<td align="center"><label>O<br>(Objective)</label></td>
										<td align="justify"><p>${form.getObjective() } </p></td>				
									</tr>
									
									<tr>
										<td align="center"><label>A<br>(Assessment)</label></td>
										<td align="justify"><p>${form.getAssessment() } </p></td>					
									</tr>					

									<tr>
										<td align="center"><label>P<br>(Plan)</label></td>
										<td align="justify"><p>${form.getPlanning() } </p></td>					
									</tr>
									
								</table>	
								
							<br></br><br></br>
							<h4>Physical Examinations</h4>
							<p>The following are the forms that were utilized for today's check-up session. </p>
							<c:forEach items="${physicalExamination }" var="p">
								<li><label><span>-- ${p }</span></label></li>  					
							</c:forEach>	

							<br></br><br></br>
							<h4>Prescriptions and Medications</h4>
							
							<c:choose>
							<c:when test="${medsForms == null }">
								<span>There are currently no medications and prescriptions made today.</span>
							</c:when>
							<c:otherwise>
							<table class="tablecontent">
							<tr>
									<th class="pro">Generic Name</th>
									<th class="phn">Brand Name</th>
									<th class="ind">Dosage</th>
									<th class="ind">Duration</th>
									<th class="ind">Others</th>
							</tr>

								<c:forEach items="${medsForms.getMedications() }" var="medication">
								<tr>
									<td class="phn"><span>${ medication.getGenericName() }</span></td>
									<td class="phn"><span>${ medication.getBrandName() }</span></td>
									<td class="phn"><span>${ medication.getDosage() }</span></td>
									<td class="phn"><span>${ medication.getDuration() }</span></td>
									<td class="phn"><span>${ medication.getOtherDetails() }</span></td>
								</tr>
							</c:forEach>
							</table>
							<br>
								<h5>Prescriptions</h5>				
							<form class="settingForm">
								<div>
									<span>${ medsForms.getPrescriptionDetails()  }</span>
								</div>						
								<!-- <span class="errormsg quota">You are not allowed to edit this value</span> -->
							</form>
							</c:otherwise>
							</c:choose>
							
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