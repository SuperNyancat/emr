<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
<head>
<title>Edit Doctor</title>
<meta charset="utf-8">

<link rel="stylesheet" href="resources/css/reset.css" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css" type="text/css">
	<link rel="stylesheet" href="resources/css/forms.css" type="text/css">	
	<link rel="stylesheet" href="resources/css/form-popup.css" type="text/css">
	<link rel="stylesheet" href="resources/css/template-table.css" type="text/css">
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
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
	<c:when test="${adminUser != null }">
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="Edit Doctor" />
			<jsp:param name="selected" value="doctors" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/doctor-header.jsp">
			<jsp:param name="title" value="Edit Doctor" />
			<jsp:param name="selected" value="home" />
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
						<form:form class="crmForm" method="post" commandName="doctor" action="update_doctor.it?id=${doctor.getId() }" >
							<form:hidden path="id" value="${doctor.id }"/>
							<form:hidden path="personInfo.revisionHistory.dateCreated" value="${doctor.personInfo.revisionHistory.dateCreated }"/>
							<form:hidden path="personInfo.revisionHistory.createdBy.id" value="${doctor.personInfo.revisionHistory.createdBy.id }"/>
							<c:if test="${doctor.personInfo.revisionHistory.dateDeleted != null }">
								<form:hidden path="personInfo.revisionHistory.dateDeleted" value="${doctor.personInfo.revisionHistory.dateDeleted  }"/>
								<form:hidden path="personInfo.revisionHistory.deletedBy.id" value="${doctor.personInfo.revisionHistory.deletedBy.id}"/>
							</c:if>
							<section>
								<header>
									<h3>Doctor Information</h3>
								</header>
							<form:hidden path="personInfo.id" value="${doctor.getPersonInfo().getId()}" />
							<form:hidden path="user.id" value="${doctor.getUser().getId()}" />
							<form:hidden value="${ doctor.getPersonInfo().getContacts().get(0).getId() }" path="personInfo.contacts[0].id"/>
							<form:hidden value="${ doctor.getPersonInfo().getContacts().get(1).getId() }" path="personInfo.contacts[1].id"/>
							<form:hidden value="${ doctor.getPersonInfo().getAddresses().get(0).getId() }" path="personInfo.addresses[0].id"/>
							<form:hidden value="${ doctor.getPersonInfo().getAddresses().get(1).getId() }" path="personInfo.addresses[1].id"/>
							<form:hidden value="${doctor.getUser().getRole().getId() }" path="user.role.id"/>
							<form:hidden path="id" value="${doctor.getId()}"/>
							
							<ul class="fields">
								<li><label>First Name<span style="color:red;">*</span></label>:<form:input value="${doctor.getPersonInfo().getFirstName()}" path="personInfo.firstName" type="text" required="true" /></li>
								<li><label>Last Name<span style="color:red;">*</span></label>:<form:input value="${doctor.getPersonInfo().getLastName()}" path="personInfo.lastName" type="text" required="true" /></li>
								<li><label>Suffix</label>:<form:input value="${doctor.getSuffix() }" path="suffix" /></li>
								<li><label>License Number<span style="color:red;">*</span></label>:<form:input value="${ doctor.getLicenseNumber() }" path="licenseNumber" /></li>
								<li><label>Occupation</label>:<form:input value="${doctor.getPersonInfo().getOccupation() }" path="personInfo.occupation"  /></li>
								<li><label>Specialization<span style="color:red;">*</span></label>:<form:input value="${ doctor.getSpecialization() }" path="specialization" required="true"/></li>
								<li><label>Date of Birth<span style="color:red;">*</span></label>:<input value="${doctor.getPersonInfo().getDateOfBirth() }" required name="dateOfBirth" type="text" id="inputField" /></li>
								<li><label>Gender</label>:
									   <label>Male</label><form:radiobutton path="personInfo.sex" value="male"/>
										<label>Female</Label><form:radiobutton path="personInfo.sex" value="female"/>
								</li>
								<li><label>Phone Number<span style="color:red;">*</span></label>:<form:input value="${ doctor.getPersonInfo().getContacts().get(0).getPhoneNumber() }" path="personInfo.contacts[0].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Mobile Number<span style="color:red;">*</span></label>:<form:input value="${ doctor.getPersonInfo().getContacts().get(0).getMobileNumber() }" path="personInfo.contacts[0].mobileNumber" type="text" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>E-mail Address<span style="color:red;">*</span></label>:<form:input value="${ doctor.getPersonInfo().getEmail() }" path="personInfo.email" type="text" required="true" pattern="(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*"/></li>
								<li><label>Employee ID</label>:<form:input value="${ doctor.getEmployeeId() }" path="employeeId" type="text" required="true"/></li>
							</ul>
							</section>
							
							<section>
							<header><h3>Address</h3></header>
							<ul class="fields">
								<li><label>Address</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(0).getAddress() }" path="personInfo.addresses[0].address"/></li>
								<li><label>City</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(0).getCity() }" path="personInfo.addresses[0].city"/></li>
								<li><label>Province</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(0).getProvince() }" path="personInfo.addresses[0].province"/></li>
								<li><label>Zip Code</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(0).getZipCode() }" path="personInfo.addresses[0].zipCode" /></li>
							</ul>
							
						</section>
						
						<section>
							<header><h3>Account Details</h3></header>
							<ul class="fields">
								<li><label>Username<span style="color:red;">*</span></label>:<form:input value="${ doctor.getUser().getUsername() }" path="user.username" required="true"/></li>
								<li><label>Password<span style="color:red;">*</span></label>:<form:password min="8" value="${ doctor.getUser().getPassword() }" path="user.password" required="true" id="txtNewPassword"/></li>
								<li><label>Confirm Password<span style="color:red;">*</span></label>:<input type="password" value="${ doctor.getUser().getPassword() }" required="true" id="txtConfirmPassword" onChange="isPasswordMatch();" /></li>
								<li><div id="divCheckPassword" style="color:red"></div></li>
								<li><span style="color:red;">* The purpose of the following fields is to validate your account for resetting your password to your birthday.</span><li>
								<li><label>Security Question<span style="color:red;">*</span></label>:<form:input value="${doctor.getPersonInfo().getSecurityQuestion()}" path="personInfo.securityQuestion" required="true"/></li>
								<li><label>Answer<span style="color:red;">*</span></label>:<form:input value="${doctor.getPersonInfo().getSecurityAnswer()}" path="personInfo.securityAnswer" required="true" /></li>
								
							</ul>
						</section>
						
						<section>
							<header>
								<h3>Hospital Details</h3>
							</header>
							<ul class="fields">
								<li><label>Name</label>:<form:input value="${doctor.getPersonInfo().getCompanyName() }" path="personInfo.companyName"/></li>
								<li><label>Employment Status</label>:
									 <label>Full-time</label><form:radiobutton path="employmentStatus" value="full-time"/>
									 <label>Part-time</Label><form:radiobutton path="employmentStatus" value="part-time"/>
								</li>
								<li><label><strong>Office Hours</strong></label></li>
									<li><label>Start Time<span style="color:red;">*</span></label>:* 
										<form:input path="officeStart" required="true" value="${doctor.getOfficeStart() }"/>
										<label style="color:red"></label>
									</li>
									<li><label>End Time<span style="color:red;">*</span></label>:*
										<form:input path="officeEnd" required="true" value="${doctor.getOfficeEnd() }"/>
										<label style="color:red"></label>
								</li>
								<li><label>Phone Number</label>:<form:input value="${ doctor.getPersonInfo().getContacts().get(1).getPhoneNumber()}" path="personInfo.contacts[1].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Work Mobile Number</label>:<form:input value="${ doctor.getPersonInfo().getContacts().get(1).getPhoneNumber()}" path="personInfo.contacts[1].mobileNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Address</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(1).getAddress() }" path="personInfo.addresses[1].address" /></li>
								<li><label>City</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(1).getCity() }" path="personInfo.addresses[1].city"/></li>
								<li><label>Province</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(1).getProvince() }" path="personInfo.addresses[1].province" /></li>		
								<li><label>Zip Code</label>:<form:input value="${ doctor.getPersonInfo().getAddresses().get(1).getZipCode() }" path="personInfo.addresses[1].zipCode" />
								
							</ul>
						</section>	
													
						<section>
							<ul class="btnForm">
								<li><span class="btn"><input type="submit"
										value="Save" class="btnSave"></span></li>
				<c:choose>
					<c:when test="${adminUser != null }">
						<li><a href="view_doctors.it"><span class="btn"><input type="button"
						value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a></li>							
					</c:when>
					<c:otherwise>
						<li><a href="doctor_homepage.it"><span class="btn"><input type="button"
						value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a></li>							
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

	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/retypepwd.js"></script>
</body>
</html>