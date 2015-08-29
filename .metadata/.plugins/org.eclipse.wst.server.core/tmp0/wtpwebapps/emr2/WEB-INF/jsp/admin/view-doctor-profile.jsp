<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!doctype html>
<html lang="en">

<head>
	<title>Doctor Profile</title>
	<meta charset="utf-8">
	
</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${adminUser != null }">
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="Doctor Profile" />
			<jsp:param name="selected" value="doctors" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Profile" />
			<jsp:param name="selected" value="home" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">
	<ul class="ctrlBtn listSpace">
		<li><span class="btn">
			<form:form commandName="doctor" action="edit_doctor.it" method="GET">
				<form:hidden path="id" value="${doctor.id }" />
				<input type="submit" value="Edit" class="btnEdit" />
			</form:form>
		</span></li>
		
		<li><span class="btn">
			<form:form commandName="doctor" action="disable_doctor.it" method="GET">
				<form:hidden path="id" value="${doctor.id }" />
				<input type="submit" value="Delete" class="btnDel">
			</form:form>
		</span></li>
	</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	
		<section class="settingBody clrfix">		
			<div class = "left">
				<h4 class="name">${doctor.getPersonInfo().getFirstName() }  ${doctor.getPersonInfo().getLastName()}</h4>
				<p>${ doctor.getPersonInfo().getEmail() }</p>
				<c:choose>
					<c:when test="${doctor.getRelativePath() == null || doctor.getRelativePath().equalsIgnoreCase('null')}">
						<img src="resources/images/img_user.jpg" alt="">
					</c:when>
					<c:otherwise>
						<img src="${doctor.getRelativePath() }" alt="${doctor.getPersonInfo().getFirstName()}'s profile picture" />
					</c:otherwise>
				</c:choose><br/><br/><br/>
					<a href="upload_prof_pic_assembler.it?id=${doctor.getId() }&key=d"><span class="btn"><input type="button" value="  Update Profile Picture" class="btnSave"></span></a>
				</div>
			
			<div class="right">
				<h4>Personal Information</h4>				
				<form class="settingForm">
					<label>Name</label>:  <span>${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()} ${doctor.getSuffix() }</span> </br> 
					<label>License Number</label>:  <span>${ doctor.getLicenseNumber() }</span> </br> 
					<label>Date of Birth</label>:  <span>${doctor.getPersonInfo().getDateOfBirth() }</span> </br> 
					<label>Age</label>:  <span>${doctor.personInfo.age }</span> </br> 
					<label>Gender</label>:  <span>${ doctor.getPersonInfo().getSex() }</span> </br> 
					<label>Phone Number</label>:  <span>${ doctor.getPersonInfo().getContacts().get(0).getPhoneNumber() }</span> </br> 
					<label>Mobile Number</label>:  <span>${ doctor.getPersonInfo().getContacts().get(0).getMobileNumber() }</span> </br> 
					<label>Email Address</label>:  <span>${ doctor.getPersonInfo().getEmail() }</span> </br> 
					<label>Specialization</label>:  <span>${ doctor.getSpecialization() }</span> </br> 
					<label>Employee ID</label>:  <span>${ doctor.getEmployeeId() }</span> </br> 
				</form>
				
				<br><br>
			
				<h4>Address</h4>				
				<form class="settingForm">
					<label>Address</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(0).getAddress() }</span> </br> 
					<label>City</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(0).getCity() }</span> </br> 
					<label>Province</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(0).getProvince() }</span> </br> 
					<label>Zip Code</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(0).getZipCode() }</span> </br> 
				</form>
				
				<br><br>
			
				<h4>Account Details</h4>				
				<form class="settingForm">
					<label>Username</label>:  <span>${ doctor.getUser().getUsername() }</span> <br> 
					<c:if test="${adminUser == null }">
						<li><label>Security Question</label>:${ doctor.personInfo.securityQuestion}</li>
						<li><label>Answer</label>:${doctor.personInfo.securityAnswer}</li>
					</c:if>
								
				</form>
				
				<br><br>
				
				<h4>Hospital Details</h4>				
				<form class="settingForm">
					<label>Occupation</label>: <span>${doctor.getPersonInfo().getOccupation() }</span><br/>
					<label>Hospital</label>: <span>${doctor.getPersonInfo().getCompanyName() }</span><br/>
					<label>Office Hours</label>: <span>${doctor.officeStart} - ${doctor.officeEnd}</span>
					<br/>
					<label>Address</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(1).getAddress() }</span> </br> 
					<label>City</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(1).getCity() }</span> </br> 
					<label>Province</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(1).getProvince() }</span> </br> 
					<label>Zip Code</label>:  <span>${ doctor.getPersonInfo().getAddresses().get(1).getZipCode() }</span> </br> 
				</form>
				
				<br><br>
			</div>
		</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ doctor.getPersonInfo().getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ doctor.getPersonInfo().getRevisionHistory().getDateModified() }</span></li> |
								<li><label>Modified By</label>:  <span>${ doctor.getPersonInfo().getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ doctor.getPersonInfo().getRevisionHistory().getDateCreated() }</span></li> |
								<li><label>Created By</label>:  <span>${ doctor.getPersonInfo().getRevisionHistory().getCreatedBy().getUsername() }</span></li>
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

</body>
</html>