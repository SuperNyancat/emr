<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Nurse Profile</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="resources/css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css">
	<link rel="stylesheet" href="resources/css/forms.css">
	<link rel="stylesheet" href="resources/css/form-popup.css">
	<link rel="stylesheet" href="resources/css/template-table.css">
	<link rel="stylesheet" href="resources/css/homepage.css">	
	<link rel="stylesheet" href="resources/css/tabs.css">	
	<link rel="stylesheet" href="resources/css/settings.css">	
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${adminUser != null }">
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="Nurse Profile" />
			<jsp:param name="selected" value="nurses" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/nurse-header.jsp">
			<jsp:param name="title" value="Nurse Profile" />
			<jsp:param name="selected" value="home" />
		</jsp:include>
	</c:otherwise>
</c:choose>


<div class="pageCtrl">
	<ul class="ctrlBtn listSpace">
		<li><span class="btn"><form:form commandName="nurse" action="edit_nurse.it" method="GET">
			<form:hidden path="id" value="${nurse.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form></span></li>
		
	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to disable?</p><br>
		<span class="btn">
			<form:form commandName="nurse" action="disable_nurse.it" method="GET">
				<form:hidden path="id" value="${nurse.id }" />
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
	
		<section class="settingBody clrfix">		
			<div class = "left">
				<h4 class="name">${nurse.getPersonInfo().getFirstName() }  ${nurse.getPersonInfo().getLastName()}</h4>
				<p>${ nurse.getPersonInfo().getEmail() }</p>
				<c:choose>
					<c:when test="${nurse.getRelativePath() == null || nurse.getRelativePath().equalsIgnoreCase('null')}">
						<img src="resources/images/img_user.jpg" alt="">
					</c:when>
					<c:otherwise>
						<img src="${nurse.getRelativePath() }" alt="${nurse.getPersonInfo().getFirstName()}'s profile picture" />
					</c:otherwise>
				</c:choose><br><br><br>
					<a href="upload_prof_pic_assembler.it?id=${nurse.getId() }&key=n"><span class="btn"><input type="button" value="  Update Profile Picture" class="btnSave"></span></a></div>
			
			<div class="right">
				<h4>Personal Information</h4>				
				<form class="settingForm">
					<label>First Name</label>:  <span>${nurse.getPersonInfo().getFirstName()} ${nurse.getPersonInfo().getLastName()}</span> </br> 
					<label>License Number</label>: <span>${nurse.licenseNumber }</span><br />
					<label>Occupation</label>: <span>${nurse.getPersonInfo().getOccupation() }</span><br />
					<label>Date of Birth</label>:  <span>${nurse.getPersonInfo().getDateOfBirth() }</span> </br> 
					<label>Age</label>:  <span>${nurse.personInfo.age }</span> </br> 
					<label>Gender</label>:  <span>${ nurse.getPersonInfo().getSex() }</span> </br> 
					<label>Phone Number</label>:  <span>${ nurse.getPersonInfo().getContacts().get(0).getPhoneNumber() }</span> </br> 
					<label>Mobile Number</label>:  <span>${ nurse.getPersonInfo().getContacts().get(0).getMobileNumber() }</span> </br> 
					<label>Email Address</label>:  <span>${ nurse.getPersonInfo().getEmail() }</span> </br> 
					<label>Employee ID</label>:  <span>${ nurse.getEmployeeId() }</span> </br> 
				</form>
				
				<br><br>
			
				<h4>Address</h4>				
				<form class="settingForm">
					<label>Address</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(0).getAddress() }</span> </br> 
					<label>City</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(0).getCity() }</span> </br> 
					<label>Province</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(0).getProvince() }</span> </br> 
					<label>Zip Code</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(0).getZipCode() }</span> </br> 
				</form>
				
				<br><br>
			
				<h4>Account Details</h4>				
				<form class="settingForm">
					<label>Username</label>:  <span>${ nurse.getUser().getUsername() }</span> </br> 
					<c:if test="${adminUser == null }">
						<li><label>Security Question</label>:${ doctor.personInfo.securityQuestion}</li>
						<li><label>Answer</label>:${doctor.personInfo.securityAnswer}</li>
					</c:if>
				</form>
				
				<br><br>
				
				<h4>Hospital Details</h4>				
				<form class="settingForm">
					<label>Name</label>: <span>${nurse.getPersonInfo().getCompanyName() }</span><br>
					<label>Address</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(1).getAddress() }</span> </br> 
					<label>City</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(1).getCity() }</span> </br> 
					<label>Province</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(1).getProvince() }</span> </br> 
					<label>Zip Code</label>:  <span>${ nurse.getPersonInfo().getAddresses().get(1).getZipCode() }</span> </br> 
				</form>
				
				<br><br>
				
				
				
							
			</div>
		</section>
		
            <div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ nurse.getPersonInfo().getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ nurse.getPersonInfo().getRevisionHistory().getDateModified() }</span></li> |
								<li><label>Modified By</label>:  <span>${ nurse.getPersonInfo().getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ nurse.getPersonInfo().getRevisionHistory().getDateCreated() }</span></li> |
								<li><label>Created By</label>:  <span>${ nurse.getPersonInfo().getRevisionHistory().getCreatedBy().getUsername() }</span></li>
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

	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/scripts.js"></script>
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