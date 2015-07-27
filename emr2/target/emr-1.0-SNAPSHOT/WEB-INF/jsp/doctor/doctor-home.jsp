<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>

<html lang="en">
<head>
	<title>Doctor Home Page</title>
	<meta charset="utf-8">
	
	<link href="resources/css/homepage.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/reset.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/forms.css" type="text/css"/>	
	<link rel="stylesheet" href="resources/css/form-popup.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/template-table.css" type="text/css"/>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
</head>

<body>
<div id="wrap">
<jsp:include page="../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="home" />
</jsp:include>
<div class="pageCtrl noContent"><!--no content--></div>

<div class="content-wrap">
	
	<div class="wrapper home">

	<section class="accDetails clrfix">
	<div class="profile">
		<h3>Hello, Dr. ${doctor.getPersonInfo().getFirstName()}!</h3>
		<ul>
			<li class="photo"><c:choose>
					<c:when test="${doctor.getRelativePath() == null || doctor.getRelativePath().equalsIgnoreCase('null')}">
						<img src="resources/images/img_user.jpg" alt="">
					</c:when>
					<c:otherwise>
						<img src="${doctor.getRelativePath() }" alt="${doctor.getPersonInfo().getFirstName()}'s profile picture" style="width:110px; height:135px;" />
					</c:otherwise>
				</c:choose></li>
			<li class="name">${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()} ${doctor.suffix }</li>
			<li>Office Hours: <strong>${doctor.officeStart } - ${doctor.officeEnd }</strong></li>
			<li>${doctor.getPersonInfo().getEmail()}</li>
			<li>${doctor.getSpecialization()}</li>
		</ul>
	</div>
	<div class="quicklinks">
		<ul>
			<li><a href="view_patients.it">
				<span class="blue"><img src="resources/images/icon_potentials.png" alt="" ></span>
				<span class="link">Patients </span></a></li>
			<li><a href="">
				<span class="blue"><img src="resources/images/icon_contacts.png" alt="" ></span>
				<span class="link">Appointments</span></a></li>
			<li><a href="edit_doctor.it?id=${doctor.getId() }">
				<span class="blue"><img src="resources/images/icon_editprofile.png" alt="" ></span>
				<span class="link">Edit My Profile</span></a></li>
			
		</ul>
	</div>
	</section>
	<section>
		<h1>Latest Appointments</h1>
		<table>
		<tr>
			
	<th class ="pro">Patient's Name</th>
			
	<th class ="pro">Date</th>
			
	<th class ="pro">Time</th>
		<tr><td colspan="3"><font color="red" size="3px">${errorMessage}</font>
			<c:remove var="errorMessage" scope="session" /></td> 
			
		<c:forEach items="${appointmentForms }" var="form">
		<tr>
			<td>${form.getPatient().getPersonInfo().getFirstName() } ${form.getPatient().getPersonInfo().getLastName() }</td>
			<td>${form.getDate() }</td>
			<td>${form.getStartTime() } - ${form.getEndTime() }</td>
		</tr>
		</c:forEach>
		</table><br><br><br>
	</section>	
	
	<section>
		<h1>Reminders</h1>
		<table>
		<tr>
		<td style="color:red;"><i>Nothing requires your attention right now.</i></td>
		</tr>
		</table><br><br><br>
	</section>
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->

<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>