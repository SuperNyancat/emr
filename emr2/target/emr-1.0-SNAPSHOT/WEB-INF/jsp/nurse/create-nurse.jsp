<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
<head>
<title>Create Nurse</title>
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
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Create Nurse" />
	<jsp:param name="selected" value="nurses" />
</jsp:include>


<div class="content-wrap">
	
	<div class="wrapper">
		<div class="tabs">
			<div class="tab-content">
				<div id="History" class="tab active">
					
					<div class="right">
						<!-- class="crmForm" -->
						<form:form class="crmForm" method="post" commandName="nurse" action="create_nurse.it?adminId=${adminUser.getId() }" >
							<section>
								<header>
								
									<h3>Nurse Information</h3>
								</header>
							
							<ul class="fields">
								<li><label>First Name<span style="color:red;">*</span> </label>:<form:input path="personInfo.firstName" type="text" required="true" /></li>
								<li><label>Last Name<span style="color:red;">*</span></label>:<form:input path="personInfo.lastName" type="text" required="true" /></li>
								<li><label>License Number<span style="color:red;">*</span></label>:<form:input path="licenseNumber" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" /></li>
								<li><label>Occupation</label>:<form:input path="personInfo.occupation"  /></li>
								<li><label>Date of Birth<span style="color:red;">*</span></label>:<input name="dateOfBirth" type="text" required id="inputField" readonly/></li>
								<li><label>Gender</label>:
									   <label>Male</label><form:radiobutton path="personInfo.sex" value="male"/>
										<label>Female</Label><form:radiobutton path="personInfo.sex" value="female"/>
								</li>
								<li><label>Phone Number</label>:<form:input path="personInfo.contacts[0].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Mobile Number<span style="color:red;">*</span></label><form:input path="personInfo.contacts[0].mobileNumber" type="text" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>E-mail Address<span style="color:red;">*</span></label><form:input path="personInfo.email" type="text" required="true" pattern="(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*"/></li>
								<li><label>Employee ID<span style="color:red;">*</span></label><form:input path="employeeId" type="text" required="true"/></li>
							</ul>
							</section>
							
							<section>
							<header><h3>Address</h3></header>
							<ul class="fields">
								<li><label>Address</label>:<form:input path="personInfo.addresses[0].address"/></li>
								<li><label>City</label>:<form:input path="personInfo.addresses[0].city"/></li>
								<li><label>Province</label>:<form:input path="personInfo.addresses[0].province"/></li>
								<li><label>Zip Code</label>:<form:input path="personInfo.addresses[0].zipCode" /></li>
							</ul>
							
						</section>
						
						<section>
							<header><h3>Account Details</h3></header>
							<ul class="fields">
								<li><label>Username<span style="color:red;">*</span></label><form:input path="user.username" required="true"/></li>
								<li><label>Password<span style="color:red;">*</span></label><form:password path="user.password" required="true" id="txtNewPassword" /></li>
								<li><label>Confirm Password<span style="color:red;">*</span></label><input type="password" required="true" id="txtConfirmPassword" onChange="isPasswordMatch();" /></li>
								<li><div id="divCheckPassword" style="color:red"></div></li>
								<li><span style="color:red;">* The purpose of the following fields is to validate your account for resetting your password to your birthday.</span><li>
								<li><label>Security Question<span style="color:red;">*</span></label>:<form:input path="personInfo.securityQuestion" required="true"/></li>
								<li><label>Answer<span style="color:red;">*</span></label>:<form:input path="personInfo.securityAnswer" required="true" /></li>
								
							</ul>
						</section>
						
						<section>
							<header>
								<h3>Hospital Details</h3>
							</header>
							<ul class="fields">
								<li><label>Name</label>:<form:input path="personInfo.companyName" value="USTH Joint and Bone Center"/></li>
								<li><label>Phone Number</label>:<form:input path="personInfo.contacts[1].phoneNumber" value="7313001" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Work Mobile Number</label>:<form:input path="personInfo.contacts[1].mobileNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Address</label>:<form:input path="personInfo.addresses[1].address" value = "Espanya Blvd."/></li>
								<li><label>City</label>:<form:input path="personInfo.addresses[1].city" value="Manila"/></li>
								<li><label>Province</label>:<form:input path="personInfo.addresses[1].province" value="Manila"/></li>		
								<li><label>Zip Code</label>:<form:input path="personInfo.addresses[1].zipCode" value="1015"/>
								
							</ul>
						</section>	
							
							<br><br><br><br>
								<section>
									<ul class="btnForm">
										<li><span class="btn"><input type="submit"
												value="Create Account" class="btnSave"></span></li>
										<li><a href="view_nurses.it"><span class="btn"><input type="button"
												value="Cancel" class="btnCancel"></span></a></li>
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