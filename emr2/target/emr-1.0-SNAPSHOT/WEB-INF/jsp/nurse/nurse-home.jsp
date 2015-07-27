<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>

<html lang="en">
<head>
	<title>Nurse Home Page</title>
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
<jsp:include page="../headers/nurse-header.jsp">
	<jsp:param name="title" value="Nurse Home" />
	<jsp:param name="selected" value="home" />
</jsp:include>
<div class="pageCtrl noContent"><!--no content--></div>

<div class="content-wrap">
	
	<div class="wrapper home">

	<section class="accDetails clrfix">
	<div class="profile">
		<h3>Hello, ${nurse.getPersonInfo().getFirstName()}!</h3>
		<ul>
			<li class="photo">
			<c:choose>
					<c:when test="${nurse.getRelativePath() == null || nurse.getRelativePath().equalsIgnoreCase('null')}">
						<img src="resources/images/img_user.jpg" alt="">
					</c:when>
					<c:otherwise>
						<img src="${nurse.getRelativePath() }" alt="${nurse.getPersonInfo().getFirstName()}'s profile picture" style="width:110px; height:135px;" />
					</c:otherwise>
				</c:choose>
				</li>
			<li class="name">${nurse.getPersonInfo().getFirstName()} ${nurse.getPersonInfo().getLastName()}, R.N.</li>
			<li>${nurse.getPersonInfo().getEmail()}</li>
			<li>Nurse</li>
		</ul>
	</div>
	<div class="quicklinks">
		<ul>
			<li><a href="view_all_patients.it">
				<span class="blue"><img src="resources/images/icon_potentials.png" alt="" ></span>
				<span class="link">Patients </span></a></li>
			<li><a href="">
				<span class="blue"><img src="resources/images/icon_contacts.png" alt="" ></span>
				<span class="link">Appointments</span></a></li>
			<li><a href="edit_nurse.it?id=${nurse.getId() }">
				<span class="blue"><img src="resources/images/icon_editprofile.png" alt="" ></span>
				<span class="link">Edit My Profile</span></a></li>
		</ul>
	</div>
	</section>
		
	<section>
		<h1>Something</h1>
		<table>
		<tr>
			<th>Patient's Name</th>
			<th>Date of Visit</th>
			<th>Status</th>
		</tr>
		<tr>
			<td>Matt</td>
			<td>Today</td>
			<td>Physical Examination</td>
		</tr>
		<tr>
			<td>Posadas</td>
			<td>Tomorrow</td>
			<td>Monthly Check-up</td>
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