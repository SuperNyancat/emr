<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<title>Edit Patient</title>
<meta charset="utf-8">

			<link rel="stylesheet" media="all" href="resources/css/jsDatePick_ltr.min.css" type="text/css">
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

<div class="content-wrap">
	
	<div class="wrapper">
		<div class="tabs">
			<div class="tab-content">
				<div id="History" class="tab active">
					
					<div class="right">
						<!-- class="crmForm" -->
						<form:form method="post" class="crmForm" commandName="patient" action="update_patient.it?id=${patient.getId() }" >
							<section>
								<header>
								
									<h3>Patient Information</h3>
								</header>
							<form:hidden path="personInfo.id" value="${patient.getPersonInfo().getId()}" />
							<form:hidden value="${ patient.getPersonInfo().getContacts().get(0).getId() }" path="personInfo.contacts[0].id"/>
							<form:hidden value="${ patient.getPersonInfo().getContacts().get(1).getId() }" path="personInfo.contacts[1].id"/>
							<form:hidden value="${ patient.getPersonInfo().getAddresses().get(0).getId() }" path="personInfo.addresses[0].id"/>
							<form:hidden value="${ patient.getPersonInfo().getAddresses().get(1).getId() }" path="personInfo.addresses[1].id"/>
							<form:hidden value="${patient.getCurrentDoctor().getId() }" path="currentDoctor.id"/>
							<c:if test="${patient.getPreviousDoctor().getId() != null}">
								<form:hidden value="${patient.getPreviousDoctor().getId() }" path="previousDoctor.id"/>							
							</c:if>
							<form:hidden value="${patient.getFileName() }" path="fileName"/>
							<form:hidden value="${patient.getRelativePath() }" path="relativePath"/>
							<form:hidden value="${patient.getPersonInfo().getRevisionHistory().getDateCreated() }" path="personInfo.revisionHistory.dateCreated"/>
							<form:hidden value="${patient.getPersonInfo().getRevisionHistory().getCreatedBy().getId() }" path="personInfo.revisionHistory.createdBy.id"/>
							<c:if test="${patient.getPersonInfo().getRevisionHistory().getDateDeleted() != null }">
								<form:hidden value="${patient.getPersonInfo().getRevisionHistory().getDateDeleted() }" path="personInfo.revisionHistory.dateDeleted"/>
								<form:hidden value="${patient.getPersonInfo().getRevisionHistory().getDeletedBy().getId() }" path="personInfo.revisionHistory.deletedBy.id"/>								
							</c:if>																		
							<form:hidden path="id" value="${patient.getId()}"/>
							
							<ul class="fields">
								<li><span><font color="red">${errorMessage}</font></span></li>
								<li><label>First Name<span style="color:red;">*</span></label>:<form:input view="${patient.getPersonInfo().getFirstName()}" path="personInfo.firstName" type="text" required="true" /></li>
								<li><label>Last Name<span style="color:red;">*</span></label>:<form:input view="${patient.getPersonInfo().getLastName()}" path="personInfo.lastName" type="text" required="true" /></li>
									<li><label>Maiden Name: </label> <input type="text" name="Birthplace"></label></li>
									<li><label>Marital Status: </label><input type="radio" name="NeverMarried">Never Married <input type="radio" name="Married">Married <input type="radio" name="Divorced">Divorced <input type="radio" name="Separated">Separated <input type="radio" name="Widowed">Widowed</li>
									<li><label>Spouse/Significant Other: </label><input type="radio" name="Alive">Alive/Age <input type="text"  name="AgeAli"> <input type="radio" name="Deceased"> Deceased/Age <input type="text" name="AgeDec"> Major Illnesses <input type="text"  name="MajorIll"></li>
									<li><label>Education(input the highest level attended: </label>Grade school: <input type="text"  name="GradeSchool"> College: <input type="text"  name="College"> Graduate School: <input type="text"  name="GradSchool"></li>
								<li><label>Doctor</label>: 
									<c:choose>
									<c:when test="${nurse != null }">
										<select name="chosenDoctor" required="required">
											<c:forEach items="${doctors}" var="doc"> 
												<option value="${doc.getId()}">Dr. ${doc.getPersonInfo().getFirstName() } ${doc.getPersonInfo().getLastName() } ${doc.getSuffix() }</option>
											</c:forEach>
										</select>
									</c:when>
									<c:otherwise>
										<span>Dr. ${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()} ${doctor.getSuffix() }</span>
									</c:otherwise>
									</c:choose>
								</li>
								<li><label>Date of Birth<span style="color:red;">*</span></label>:<input value="${patient.getPersonInfo().getDateOfBirth() }" name="personInfo.dateOfBirth" type="text" id="inputField" required readonly /></li>
									<li><label>Birthplace:</label> <input type="text" name="Birthplace"></li>
							
								<li><label>Gender<span style="color:red;">*</span></label>:
									   <label>Male</label><form:radiobutton path="personInfo.sex" required="true" value="male"/>
										<label>Female</Label><form:radiobutton path="personInfo.sex" required="true" value="female"/>
								</li>
								<li><label>Phone Number</label>:<form:input value="${ patient.getPersonInfo().getContacts().get(0).getPhoneNumber() }" path="personInfo.contacts[0].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Mobile Number<span style="color:red;">*</span></label>:<form:input value=">${ patient.getPersonInfo().getContacts().get(0).getMobileNumber() }" path="personInfo.contacts[0].mobileNumber" type="text" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>E-mail Address<span style="color:red;">*</span></label>:<form:input value="${ patient.getPersonInfo().getEmail() }" path="personInfo.email" type="text" required="true" pattern="(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*"  autocomplete="off"/></li>
								<!--<form:hidden path="personInfo.contacts[1].type" value="home"/>-->
							</ul>
							</section>
							
							<section>
							<header><h3>Address</h3></header>
							<ul class="fields">
								<li><label>Address</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(0).getAddress() }" path="personInfo.addresses[0].address"/></li>
								<li><label>City</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(0).getCity() }" path="personInfo.addresses[0].city"/></li>
								<li><label>Province</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(0).getProvince() }" path="personInfo.addresses[0].province"/></li>
								<li><label>Zip Code</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(0).getZipCode() }" path="personInfo.addresses[0].zipCode" /></li>
							</ul>
							
						</section>
					
						<section>
							<header>
								<h3>Work Details</h3>
							</header>
							<ul class="fields">
								<li><label>Occupation</label>:<form:input value="${ patient.getPersonInfo().getOccupation() }" path="personInfo.occupation"  /></li>
								<li><label>Company Name</label>:<form:input value="${ patient.getPersonInfo().getCompanyName() }" path="personInfo.companyName"/></li>
										<li><label>Number of hours worked/average per week: </label><input type="text" name="NumberHours"></li>						
								<li><label>Phone Number</label>:<form:input value="${ patient.getPersonInfo().getContacts().get(1).getPhoneNumber() }" path="personInfo.contacts[1].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Work Mobile Number</label>:<form:input value="${ patient.getPersonInfo().getContacts().get(1).getMobileNumber() }" path="personInfo.contacts[1].mobileNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Address</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(1).getAddress() }" path="personInfo.addresses[1].address" /></li>
								<li><label>City</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(1).getCity() }" path="personInfo.addresses[1].city"/></li>
								<li><label>Province</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(1).getProvince() }" path="personInfo.addresses[1].province" /></li>		
								<li><label>Zip Code</label>:<form:input value="${ patient.getPersonInfo().getAddresses().get(1).getZipCode() }" path="personInfo.addresses[1].zipCode" />
								<!--<form:hidden path="personInfo.addresses[1].type" value="work"/> 
								<form:hidden path="personInfo.contacts[1].type" value="work"/>-->
							</ul>
						</section>	
							
						<section>
							<ul class="btnForm">
								<li><span class="btn"><input type="submit"
										value="Save" class="btnSave"></span></li>
							<c:choose>		
								<c:when test="${nurse != null }">
									<li><a href="view_all_patients.it "><span class="btn"><input type="button"
										value="Cancel" class="btnCancel"></span></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="view_patients.it "><span class="btn"><input type="button"
										value="Cancel" class="btnCancel"></span></a></li>
								</c:otherwise>
							</c:choose>
							</ul>
							<div class="backontop">
								<span class="btn"><input type="button"
									value="Back to Top" class="btnTop"></span>
							</div>
						</section>
										
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

	<script type="text/javascript" src="resources/js/jquery.1.4.2.js"></script>
	<script type="text/javascript" src="resources/js/jsDatePick.jquery.min.1.3.js"></script>

</body>
</html>