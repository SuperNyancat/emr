<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Patient</title>
	<meta charset="utf-8">
	<!--[if lt IE 9]>
	<script src="resources/js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">
	<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="patient" action="edit_patient.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	

	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to delete?</p><br>
		<span class="btn">
			<form:form commandName="patient" action="disable_patient.it" method="GET">
				<form:hidden path="id" value="${patient.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>

	
	
	<ul class="ctrlBtn listSpace">
	<c:if test="${nurse == null }">
		<li>
		<span class="btn">
			<form onsubmit="return checkCarType(this)" method="POST" commandName="patient" action="refer_patient.it?id=${patient.getId() }"> 
		
				<select name="chosen" required="required">
				<option hidden="something">Choose Doctor</option>
				<c:forEach items="${doctors}" var="doc"> 
					<option value="${doc.getId()}">Dr. ${doc.getPersonInfo().getFirstName() } ${doc.getPersonInfo().getLastName() } ${doc.getSuffix() }</option>
				</c:forEach>
			</select>
				<input type="submit" value="Refer Patient" class="btnNext"/>
			</form>
		</span>
		</li>

		<!--  <li>
		<span class="btn">
			<form onsubmit="return checkCarType(this)" method="POST" action="turnover_patient.it?id=${patient.getId() }">  
			<select name="chosen" required="required">
				<option hidden="something">Choose Doctor</option>
				<c:forEach items="${doctors}" var="doc"> 
					<option value="${doc.getId()}">Dr. ${doc.getPersonInfo().getFirstName() } ${doc.getPersonInfo().getLastName() } ${doc.getSuffix() }</option>
				</c:forEach>
			</select>
			<input type="submit" value="Turnover Patient" class="btnNext"/>
			</form>
		</span>
		</li>-->
		</c:if>
	</ul>
	
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../headers/patient-header.jsp">
				<jsp:param name="selected" value="profile" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../headers/patient-left.jsp" />
						<br><br>
						<span class="btn"><a href="upload_prof_pic_assembler.it?id=${patient.getId() }&key=p"><input type="button" value="  Update Profile Picture" class="btnSave"></a></span>
			
					</div>
					
					<div class="right">
						<h4>Personal Information</h4>				
						<form class="settingForm">
							<label>Name</label>:  <span> ${patient.getPersonInfo().getFirstName() }  ${ patient.personInfo.maidenName }   ${patient.getPersonInfo().getLastName()}</span> <br /> 
							<label>Date of Birth</label>:  <span> ${patient.getPersonInfo().getDateOfBirth() }</span> <br/>
								<label>Birthplace</label>: <span>${patient.birthPlace }</span> <br/>
							<label>Age</label>:  <span>${patient.personInfo.age }</span> <br/>
							<label>Gender</label>:  <span> ${ patient.getPersonInfo().getSex() }</span> <br /> 
								<label>Marital Status:</label> <span> ${ patient.maritalStatus }</span> <br /> 
								<label>Spouse/Significant Other:</label><span> ${ patient.aliveOrdead }    </span><br>
								
								<c:if test="${  !patient.aliveAge.isEmpty() }">
								<label>Age of Spouse/Significant Other:</label><span> ${ patient.aliveAge }</span> <br />
								</c:if>
								<c:if test="${  !patient.deadAge.isEmpty() }">
									<label>Age of Death:</label><span> ${ patient.deadAge }</span> <br />
									<label>Major Ilnesses:</label><span> ${ patient.majorIllnesses }</span> <br />
								</c:if>
								<label>Education </label>:<br>
								
								<label>Grade School</label>:<span> ${ patient.gradeSchool }</span> <br />
								<label>College</label>:<span> ${ patient.college }</span> <br />
								<label>Graduate School</label>:<span> ${ patient.graduateSchool }</span> <br />
							<label>Address</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getAddress() }</span> <br/> 
							<label>City</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getCity() }</span> <br /> 
							<label>State/Province</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getProvince() }</span> <br /> 
							<label>Zip/Postal Code</label>:  <span>${ patient.getPersonInfo().getAddresses().get(0).getZipCode() }</span> <br /> 
							<label>Phone</label>:  <span>${ patient.getPersonInfo().getContacts().get(0).getPhoneNumber() }</span> <br /> 
							<label>Mobile</label>:  <span>${ patient.getPersonInfo().getContacts().get(0).getMobileNumber() }</span> <br /> 
							<label>Email Address</label>:  <span>${ patient.getPersonInfo().getEmail() }</span> <br /> 
						</form>	
							
						<br><br><br>
						<form class="settingForm">
						<h4>Medical Information</h4>	
							<label>Diagnosis</label>:  <span><strong>${ patient.diagnosis}</strong></span> <br />
							<label>Stage</label>:  <span>${ patient.stage}</span> <br />					
														
							<label>Health Insurance</label>:  <span>${ patient.getHealthInsurance() }</span> <br />
							<c:if test="${patient.getPreviousDoctor() != null }">
							<label>Referring Physician</label>:  <span>Dr. ${ patient.getPreviousDoctor().getPersonInfo().getFirstName() } ${ patient.getPreviousDoctor().getPersonInfo().getLastName() } ${ patient.getPreviousDoctor().getSuffix()}</span> <br /> 
							</c:if>
							<label>Attending Physician</label>:  <span>Dr. ${ patient.getCurrentDoctor().getPersonInfo().getFirstName() } ${ patient.getCurrentDoctor().getPersonInfo().getLastName() } ${ patient.getCurrentDoctor().getSuffix()}</span> <br /> 
							
							
					</form>
						
						
						<br><br><br>
						<form class="settingForm">
						<h4>Work Information</h4>	
							<label>Occupation</label>:  <span>${ patient.getPersonInfo().getOccupation() }</span> <br /> 
							<label>Company Name</label>: <span>${ patient.getPersonInfo().getCompanyName() }</span><br /> 
								<label>Number of hours worked/average per week: </label><span> ${ patient.hoursWorked }</span> <br />
							<label>Address</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getAddress() }</span> <br /> 
							<label>City</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getCity() }</span> <br /> 
							<label>State/Province</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getProvince() }</span> <br /> 
							<label>Zip/Postal Code</label>:  <span>${ patient.getPersonInfo().getAddresses().get(1).getZipCode() }</span> <br /> 
							<label>Phone</label>:  <span>${ patient.getPersonInfo().getContacts().get(1).getPhoneNumber() }</span> <br /> 
							<label>Mobile</label>:  <span>${ patient.getPersonInfo().getContacts().get(1).getMobileNumber() }</span> <br /> 
						</form>			
					</div>
			
					</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ patient.getPersonInfo().getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ patient.getPersonInfo().getRevisionHistory().getDateModified() }</span></li> |
								<li><label>Modified By</label>:  <span>${ patient.getPersonInfo().getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ patient.getPersonInfo().getRevisionHistory().getDateCreated() }</span></li> |
								<li><label>Created By</label>:  <span>${ patient.getPersonInfo().getRevisionHistory().getCreatedBy().getUsername() }</span></li>
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