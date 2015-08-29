<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Medications And Prescriptions</title>
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
		<form:form commandName="form" action="edit_pres_and_meds.it" method="GET">
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
			<form:form commandName="form" action="delete_meds.it" method="GET">
				<form:hidden path="patient.id" value="${patient.id }" />
				<form:hidden path="id" value="${form.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>
	>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="medicationsAndPrescriptions" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
			
				<div id="Medication and Prescription" class="tab active">
					<section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../../headers/patient-left.jsp" />
			</div>
						<div class="right">
													
						
							<label>PTR Number: </label> <span>${form.getPTRNumber() }</span>
							<br><br>
							<h4>Medications</h4>		
							<table class="tablecontent">
								<tr>
									<th class="pro"><a href="">Generic Name</a></td>
									<th class="pro"><a href="">Brand Name</a></td>
									<th class="pro"><a href="">Dosage</a></td>
									<th class="pro"><a href="">Duration</a></td>
									<th class="pro"><a href="">Other Details</a></td>
								</tr>
								
								
							<c:forEach items="${form.getMedications() }" var="medication">
								<tr>
									<td class="phn"><span>${ medication.getGenericName() }</span></td>
									<td class="phn"><span>${ medication.getBrandName() }</span></td>
									<td class="phn"><span>${ medication.getDosage() }</span></td>
									<td class="phn"><span>${ medication.getDuration() }</span></td>
									<td class="phn"><span>${ medication.getOtherDetails() }</span></td>
								</tr>
							</c:forEach>
								
							</table>
							<br><br>
							
							<h5>Prescription</h5>				
							<form class="settingForm">
								<div>
									<span>${ form.getPrescriptionDetails() }</span>
								</div>						
								<!-- <span class="errormsg quota">You are not allowed to edit this value</span> -->
							</form>
							<br><br>
							<ul class="ctrlBtn listSpace">
									<li><span class="btn"><a href="medpres_print.it?pid=${patient.getId() }&fid=${form.getId()}"><input type="button" value="Print" class="btnEdit" style="right-align"></a></span></li>
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
</body>
</html>