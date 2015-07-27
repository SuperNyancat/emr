<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Medications and Prescriptions</title>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl"></div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
		<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="medicationsAndPrescriptions" />
			</jsp:include>
		
			<div class="tab-content">
			
				<div id="Medication and Prescription" class="tab active">
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>									
					
						<div class="right">
						
						<form:form action="create_medications_and_prescriptions.it?id=${patient.getId() }" method="post" commandName="medicationsAndPrescriptions">
							<form:hidden path="id" value="${form.getId() }"/>
			<form:hidden path="patient.id" value="${patient.getId() }" />
			<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
			<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
			<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
			
							<label>PTR Number</label> <form:input type="text" value="${medicationsAndPrescriptions.getPTRNumber() }" path="PTRNumber" style="width:120px; height:20px;"/>
							
							<br><br>
							<h4>Medications</h4>
							<table class="table">
								<tr>
									<th class="pro">Generic Name</th>
									<th class="pro">Brand Name</th>
									<th class="pro">Dosage</th>
									<th class="pro">Duration</th>
									<th class="pro">Other Details</th>
								</tr>
								
								<tr>
									<td class="phn"><form:input type="text" path="medications[0].genericName" value="${ medication.getGenericName() }" style="width:120px; height:20px;"/></td>
									<td class="phn"><form:input type="text" path="medications[0].brandName" value="${ medication.getBrandName() }" style="width:120px; height:20px;"/></td>
									<td class="phn"><form:input type="text" path="medications[0].dosage" value="${ medication.getDosage() }" style="width:120px; height:20px;"/></td>
									<td class="phn"><form:input type="text" path="medications[0].duration" value="${ medication.getDuration() }" style="width:120px; height:20px;"/></td>
									<td class="phn"><form:input type="text" path="medications[0].otherDetails" value="${ medication.getOtherDetails() }" style="width:120px; height:20px;"/></td>
								</tr>
							</table>
							<br><br>
							
							<h5>Prescription Details</h5>				
							
								<div>
									<form:textarea path="prescriptionDetails" value="${medicationsAndPrescriptions.getPrescriptionDetails() }" rows="4" cols="50" style="width:700px; height:100px;"/>
								</div>
								
								<section>
									<ul class="btnForm">
										<li><span class="btn"><input type="submit"
												value="Save" class="btnSave"></span></li>
										<li><a href="view_pres_meds.it?pid=${patient.getId() }&fid=${medicationsAndPrescriptions.getId()}"><span class="btn"><input type="button"
												value="Cancel" class="btnCancel"></span></a></li>
										<li><span class="btn"><input type="button"
											value="Back to Top" class="btnTop"></span></li>
									</ul>
								</section>
							</form:form>							
								<!-- <span class="errormsg quota">You are not allowed to edit this value</span> -->
						
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