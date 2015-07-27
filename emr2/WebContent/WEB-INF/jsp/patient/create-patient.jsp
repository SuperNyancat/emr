	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
<title>Create Patient</title>
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
						<form:form method="post" class="crmForm" commandName="patient" action="create_patient.it" >
							<section>
								<header>
								
									<h3>Patient Information</h3>
								</header>
							
							<ul class="fields">
								<li><span><font color="red">${errorMessage}</font></span></li>
								<li><label>First Name<span style="color:red;">*</span></label>:<form:input path="personInfo.firstName" type="text" required="true" /> </li>
								<li><label>Maiden Name: </label> <form:input path="personInfo.maidenName"/></label></li>
								<li><label>Last Name<span style="color:red;">*</span></label>:<form:input path="personInfo.lastName" type="text" required="true" /> </li>
								<li><label>Marital Status: </label><form:radiobutton path="maritalStatus" value="Never Married"/>Never Married <form:radiobutton path="maritalStatus" value="Married"/>Married <form:radiobutton path="maritalStatus" value="Divorced"/>Divorced <form:radiobutton path="maritalStatus" value="Separated"/>Separated <form:radiobutton path="maritalStatus" value="Widowed"/>Widowed</li>
								<li><label>Spouse/Significant Other: </label><form:radiobutton path="aliveOrdead" value="Alive"/>Alive/Age <form:input path="aliveAge"/> <form:radiobutton path="aliveOrdead" value="Deceased"/> Deceased/Age <form:input path="deadAge"/> 
								Major Illnesses <form:input path="majorIllnesses"/></li>
								<li><label>Education(input the highest level attended: </label>Grade school: <form:input path="gradeSchool"/> College: <form:input path="college"/> Graduate School: <form:input path="graduateSchool"/></li>
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
								<li><label>Date of Birth<span style="color:red;">*</span></label>:<input name="dateOfBirth" readonly type="text" required id="inputField" /></li>
									<li><label>Birthplace:</label> <form:input path="birthPlace"/></li>
								<!--<form:input path="personInfo.dateOfBirth"  />-->
								<li><label>Gender<span style="color:red;">*</span></label>:
									   Male<form:radiobutton path="personInfo.sex" required="true" value="male"/>
										Female<form:radiobutton path="personInfo.sex" required="true" value="female"/>
								</li>
								<li><label>Phone Number</label>:<form:input path="personInfo.contacts[0].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Mobile Number<span style="color:red;">*</span></label>:<form:input path="personInfo.contacts[0].mobileNumber" type="text" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>E-mail Address<span style="color:red;">*</span></label>:<form:input path="personInfo.email" type="text" required="true" pattern="(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*"  autocomplete="off"/></li>
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
							<header>
								<h3>Work Details</h3>
							</header>
							<ul class="fields">
								<li><label>Occupation</label>:<form:input path="personInfo.occupation"  /></li>
								<li><label>Company Name</label>:<form:input path="personInfo.companyName"/></li>
									<li><label>Number of hours worked/average per week: </label> <form:input pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" path="hoursWorked"/></li>
								<li><label>Phone Number</label>:<form:input path="personInfo.contacts[1].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Work Mobile Number</label>:<form:input path="personInfo.contacts[1].mobileNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off"/></li>
								<li><label>Address</label>:<form:input path="personInfo.addresses[1].address" /></li>
								<li><label>City</label>:<form:input path="personInfo.addresses[1].city"/></li>
								<li><label>Province</label>:<form:input path="personInfo.addresses[1].province" /></li>		
								<li><label>Zip Code</label>:<form:input path="personInfo.addresses[1].zipCode" />
							</ul>
						</section>	
							
							
								<section>
									<ul class="btnForm">
										<li><span class="btn"><input type="submit"
												value="Create Patient" class="btnSave"></span></li>
									<c:choose>		
										<c:when test="${nurse != null }">
											<li><a href="view_all_patients.it "><span class="btn"><input type="button"
												value="Cancel" class="btnCancel"></span></a></li>
										</c:when>
										<c:otherwise>
											<li><a href="view_patients.it"><span class="btn"><input type="button"
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

	<script type="text/javascript" src="resources/js/jquery.1.4.2.js"></script>
	<script type="text/javascript" src="resources/js/jsDatePick.jquery.min.1.3.js"></script>

</body>
</html>